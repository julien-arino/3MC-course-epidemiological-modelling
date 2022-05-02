library(lubridate)
library(dplyr)
library(wbstats)
library(deSolve)
library(GA)

# The RHS function for KMK
RHS_KMK_SIR <- function(t, x, p) {
  with(as.list(c(x,p)), {
    dS <- -beta*S*I/pop
    dI <- beta*S*I/pop-gamma*I
    dR <- gamma*I
    return(list(c(dS, dI, dR)))
  })
}

# Compute the error based on one parameter value. Will also need a few more
# arguments
error_incidence <- function(p_vary, 
                            params, 
                            incidence_data,
                            method = "rk4",
                            which_incidence = "inc100") {
  # Anything that changes during optimisation needs to be set here
  params$beta = as.numeric(p_vary["beta"])
  params$gamma = as.numeric(p_vary["gamma"])
  # Check value of R0. If it is less than 1, no need to compute ODE solution,
  # just return Inf
  R0 = params$beta / params$gamma
  if (R0<1) {
    return(Inf)
  }
  # I0 is the I that gives us the incidence we are matching in the data. Since
  # incidence=beta*S*I/N, we have
  # I(0) = incidence*N/(beta*S(0)) ~= incidence/beta
  S0 = params$pop
  I0 = data_subset[[which_incidence]][1]/(params$beta)
  IC = c(S = S0, I = I0, R = 0)
  # The times at which we compute the solution to compare with data
  times = as.numeric(as.Date(incidence_data$date))
  sol = ode(IC, times, RHS_KMK_SIR, params, method = method)
  # Error checking
  if (sol[dim(sol)[1],"time"] < times[length(times)]) {
    #writeLines("Cut short")
    return(Inf)
  }
  # Values required to compute the error
  incidence_from_run = params$beta * sol[,"S"] * sol[,"I"] / params$pop
  # Compute the error
  diff_values = incidence_data[[which_incidence]] - incidence_from_run
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

# Type of incidence to use (column name in the data)
which_incidence = "inc"

# Let us now select one epidemic season (mid year to next). Use another variable
# so we don't have to reload the data if we do weird edits..
# We take a flu season prior to the pandemic (they are weird after that)
beg_year = 2018
end_year = 2019
data_subset = data %>%
  filter(date > paste0(beg_year,"-12-15")) %>%
  filter(date <= ymd(paste0(end_year,"-04-30")))

plot(data_subset$date, data_subset[[which_incidence]],
     type = "b",
     xlab = "Month", ylab = "Incidence",
     main = paste0(beg_year, "-", end_year, " flu season"))

# To do work, we will need the total population of France
pop_data_FRA <- wb_data(country = "FRA", indicator = "SP.POP.TOTL",
                        mrv = 100, return_wide = FALSE) %>%
  filter(date == beg_year)
# For numerical reasons, we might work per 100K people.. Detect this.
if (grepl("100", which_incidence)) {
  pop_data_FRA = pop_data_FRA$value / 100000
} else {
  pop_data_FRA = pop_data_FRA$value
}

params = list()
params$gamma = 1/3.5   # Let's see if we can fit with this simple value
# R0=beta/gamma, so beta=R0*gamma
params$beta = 1.5*params$gamma
# Add population data to this, for convenience
params$pop = pop_data_FRA

## Fit using a genetic algorithm
GA = ga(
  type = "real-valued",
  fitness = function(x) -error_incidence(p_vary = c(beta = x[1], gamma = x[2]),
                                         params = params,
                                         incidence_data = data_subset,
                                         which_incidence = which_incidence,
                                         method = "rk4"),
  parallel = TRUE,
  lower = c(0.1, 1/20),
  upper = c(1, 1/2),
  pcrossover = 0.7,
  pmutation = 0.2,
  optim = TRUE,
  optimArgs = list(method = "CG"),
  suggestions = c(params$beta, params$gamma),
  popSize = 500,
  maxiter = 100
)

params$beta = GA@solution[1]
params$gamma = GA@solution[2]
S0 = pop_data_FRA
I0 = data_subset[[which_incidence]][1]/(params$beta)
IC = c(S = S0, I = I0, R = 0)
dates_num = as.numeric(as.Date(data_subset$date))
times = seq(dates_num[1], dates_num[length(dates_num)], 0.1)
sol <- ode(IC, times, RHS_KMK_SIR, params)
sol_incidence = as.numeric(params$beta) * sol[,"S"] * sol[,"I"]/params$pop
y_max = max(max(sol_incidence), max(data_subset[[which_incidence]]))

plot(sol[,"time"], sol_incidence, type = "l",
     xlab = "Date", ylab = "Incidence",
     xaxt = "n", lwd = 2, col = "red",
     ylim = c(0, y_max))
lines(as.numeric(as.Date(data_subset$date)), data_subset[[which_incidence]],
      type = "b")
dates_pretty = pretty(dates_num)
axis(1, at = dates_pretty, labels = as.Date(dates_pretty, origin="1970-01-01"))
