library(lubridate)
library(dplyr)
library(wbstats)
library(deSolve)
library(GA)

# The RHS function for KMK
RHS_KMK_SIR <- function(t, x, p) {
  with(as.list(c(x,p)), {
    dS <- -beta*S*I
    dI <- beta*S*I-gamma*I
    dR <- gamma*I
    return(list(c(dS, dI, dR)))
  })
}

# Compute the error based on one parameter value. Will also need a few more
# arguments
error_Newton <- function(p_vary, params, incidence_data) {
  # Anything that changes during optimisation needs to be set here
  params$beta = p_vary[1]
  IC = c(S = params$pop, I = incidence_data$inc[1], R = 0)
  times = as.numeric(as.Date(incidence_data$date))
  sol = ode(IC, times, RHS_KMK_SIR, params,
            method = "rk4")
  # Error checking
  if (sol[dim(sol)[1],"time"] < times[length(times)]) {
    writeLines("Cut short")
    return(Inf)
  }
  # Values required to compute the error
  incidence_from_run = params$beta * sol[,"S"] * sol[,"I"]
  # Compute the error
  diff_values = incidence_data$inc100 - incidence_from_run
  diff_values_squared = diff_values^2
  error = sum(diff_values_squared)
  return(error)
}
  
# Read in the data for France
data = readr::read_csv("https://www.sentiweb.fr/datasets/incidence-PAY-3.csv",
                       skip = 1)
# Show the top of the table (always useful)
head(data)
# Week is by epi week, let's sort this out. Four first digits are year, last 
# two are week. Let us rename the first column as yyyyww, to avoid confusion
# with week
colnames(data)[1] = "yyyyww" 
data$year = substr(data$yyyyww, 1, 4)
data$week = substr(data$yyyyww, 5, 6)
# It will be easier to work with days as days, so we convert dates
data$date = lubridate::parse_date_time(paste(data$year, data$week, 1, sep="/"),'Y/W/w')
# There are some issues, let us fix without thinking: if something went wrong, it 
# is typically bcause of a week numbered 53. We make that day 31 December of 
# that year
idx = which(is.na(data$date))
data$date[idx] = ymd(paste0(data$year[idx],"-12-31"))

# Ah, yes, don't forget: let's flip the order of the table, as it is sorted
# by decreasing dates
data = data %>%
  arrange(date)

# Let us now select one epidemic season (mid year to next). Use another variable
# so we don't have to reload the data if we do weird edits..
# We take a flu season prior to the pandemic (they are weird after that)
beg_year = 2018
end_year = 2019
data_subset = data %>%
  filter(date > paste0(beg_year,"-07-01")) %>%
  filter(date <= ymd(paste0(end_year,"-06-30")))

plot(data_subset$date, data_subset$inc100,
     type = "b",
     xlab = "Month", ylab = "Incidence / 100K",
     main = paste0(beg_year, "-", end_year, " flu season"))

# To do work, we will need the total population of France
pop_data_FRA <- wb_data(country = "FRA", indicator = "SP.POP.TOTL",
                         mrv = 100, return_wide = FALSE) %>%
  filter(date == beg_year)
# For numerical reasons, we work per 100K people..
pop_data_FRA = pop_data_FRA$value / 100000

params = list()
params$gamma = 1/3.5/7   # Let's see if we can fit with this simple value
params$beta = 1.5*params$gamma/pop_data_FRA
# Add population data to this, for convenience
params$pop = pop_data_FRA

IC = c(S = pop_data_FRA, I = data_subset$inc100[1], R = 0)
times = as.numeric(as.Date(data_subset$date))

sol <- ode(IC, times, RHS_KMK_SIR, params)

# Just to check: does the error function indeed return what we want it to return
# and does it not change beta (here)
params$beta
error_Newton(p_vary = c(beta=0.0001), 
             params = params, 
             incidence_data = data_subset)
params$beta

# "Classic" minimisation using a Newton-type algorithm
param_value = nlm(f = error_Newton,
                  p = params$beta,
                  params = params, incidence_data = data_subset) 
# "Classic" minimisation using other classic algorithm
param_value = optim(fn = error_Newton,
                    par = params$beta,
                    params = params, incidence_data = data_subset) 
# "Classic" minimisation using other classic algorithm
param_value = optim(fn = 
                      function(x) error_Newton(x, 
                                               params = params,
                                               incidence_data = data_subset),
                    par = c(params$beta)) 
# Using a genetic algorithm
GA = ga(
  type = "real-valued",
  fitness = function(x) -error_Newton(p_vary = x,
                                      params = params,
                                      incidence_data = data_subset),
  parallel = TRUE,
  lower = c(0),
  upper = c(0.1),
  pcrossover = 0.7, 
  pmutation = 0.3, 
  suggestions = params$beta,
  popSize = 1000,
  maxiter = 500
)

params$beta = GA@solution
IC = c(S = pop_data_FRA, I = data_subset$inc100[1], R = 0)
times = as.numeric(as.Date(data_subset$date))
sol <- ode(IC, times, RHS_KMK_SIR, params)
sol_incidence = as.numeric(params$beta) * sol[,"S"] * sol[,"I"]
plot(sol[,"time"], sol_incidence)
