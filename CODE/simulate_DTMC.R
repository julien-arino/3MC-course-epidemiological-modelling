# Example simulation of a simple SIS model
library(DTMCPack)

# Source a file with a few helpful functions for plotting (nice axes labels, crop figure)
source("useful_functions.R")

# Recreate state from solution
number_I = function(sol) {
  time = 1:dim(sol)[2]
  state = rep(0, length(time))
  for (t in time) {
    state[t] = which(sol[,t] == 1)-1
  }
  OUT = data.frame(time = time, state = state)
}


# Total population
Pop = 100
# Initial number of infectious
I_0 = 2
# Parameters
gamma = 1/5
R_0 = 1.5
# R0 would be (beta/gamma)*S0, so beta=R0*gamma/S0
beta = R_0*gamma/(Pop-I_0)
# Final time
t_f = 100
# Time step
Delta_t = 1

# Prepare I vector
IC = mat.or.vec(nr = (Pop+1), nc = 1)
# Make the transition matrix
T = mat.or.vec(nr = length(IC), nc = length(IC))
for (row in 2:(dim(T)[1]-1)) {
  # Recoveries
  mv_right = gamma*row*Delta_t
  # Infections
  mv_left = beta*row*(Pop-row)*Delta_t
  # Fill up the matrix
  T[row,(row-1)] = mv_right
  T[row,(row+1)] = mv_left
}
# When we get to the total population, we bounce back
T[(Pop+1),Pop] = 1
# Check that we don't have too large values
if (max(T)>1) {
  writeLines("max(T)>1, scaling")
  max_T = max(T)
  T = T/max_T
}
diag(T) = 1-rowSums(T)


# Initial condition
# By putting all weight in one compartment, we fix an initial condition
IC[(I_0+1)] = 1

sol = DTMC(tmat = T, io = IC, N = t_f, trace = FALSE)
I = number_I(sol)

plot(I$time, I$state,
     type = "l",
     xlab = "Time (days)", ylab = "Number infectious")

sol = MultDTMC(nchains = 20, tmat = T, io = IC, n = t_f)

# Process solutions
# We want to show trajectories that go to zero differently from those that go endemic,
# so we do a bit of preprocessing, adding a colour field each solution
I = list()
I_max = 0
for (i in 1:length(sol)) {
  I[[i]] = number_I(sol[[i]])
  if (max(I[[i]]$state)>I_max) {
    I_max = max(I[[i]]$state)
  }
  if (I[[i]]$state[length(I[[i]]$state)] == 0) {
    I[[i]]$colour = "dodgerblue4"
    I[[i]]$lwd = 2
  } else {
    I[[i]]$colour = "black"
    I[[i]]$lwd = 0.5
  }
}

png(file = sprintf("%s/FIGURES/several_DTMC_sims.png", here::here()),
    width = 1200, height = 800, res = 200)
plot(I[[1]]$time, I[[1]]$state,
     type = "l",
     xlab = "Time (days)", ylab = "Number infectious",
     ylim = c(0,I_max),
     col = I[[1]]$colour, lwd = I[[1]]$lwd)
for (i in 2:length(sol)) {
  lines(I[[i]]$time, I[[i]]$state,
        type = "l",
        col = I[[i]]$colour, lwd = I[[i]]$lwd)
}
dev.off()
crop_figure(file = sprintf("%s/FIGURES/several_DTMC_sims.png", here::here()))