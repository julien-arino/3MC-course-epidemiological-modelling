# SLIAR_metapop
#
# Note that without further adaptation, the results provided by this
# script can be expected to be completely unrealistic, the intent is only 
# to provide a workable canvas.


# Load required library. 
# You may need to install this library using install.packages("deSolve").
library(deSolve)


# The vector field
SLIAR_metapop_rhs <- function(t, x, p) {
  with(as.list(p), {
    S = x[idx_S]
    L = x[idx_L]
    I = x[idx_I]
    A = x[idx_A]
    R = x[idx_R]
    N = S + L + I + A + R
    Phi = beta * S * (I + eta * A) / N
    dS = - Phi + MS %*% S
    dL = Phi - epsilon * L + p$ML %*% L
    dI = (1 - pi) * epsilon * L - gammaI * I + MI %*% I
    dA = pi * epsilon * L - gammaA * A + MA %*% A
    dR = gammaI * I + gammaA * A + MR %*% R
    dx = list(c(dS, dL, dI, dA, dR))
    return(dx)
  })
}

# The following data originates from Bluedot.global and shows the average
# daily number of air passengers flying between each of the countries
# listed below. Average computed over one (unspecified) month.
# pop contains the population of the countries.
pop = c(34.017,1348.932,1224.614,173.593,93.261)*1e6
countries = c("Canada","China","India","Pakistan","Philippines")
T = matrix(data = c(0,1268,900,489,200,
                    1274,0,678,859,150,
                    985,703,0,148,58,
                    515,893,144,0,9,
                    209,174,90,2,0),
           nrow =5, ncol = 5, byrow = TRUE)

# We use a list to store parameters.
p = list()

# In order to compute the movement rates, we use the approximation
# explained in Arino & Portet, JMB 2015.
p$M = mat.or.vec(nr = dim(T)[1], nc = dim(T)[2])
for (from in 1:5) {
  for (to in 1:5) {
    p$M[to,from] = -log(1-T[from,to]/pop[from])
  }
  p$M[from,from] = 0
}
p$MS = p$M-diag(colSums(p$M))
# Assume movement is equal for all compartments.
p$ML = p$MS
p$MI = p$MS
p$MA = p$MS
p$MR = p$MS
# Number of patches. (MS should be square.)
p$P = dim(p$MS)[1]

# Set other parameters. Values are chosen mostly arbitrarily.
p$nu = rep(0.1,p$P)
p$epsilon = rep(0.01,p$P)
p$d = rep(1/(70*365.25),p$P) # Could be taken based on World Bank data to be more accurate
p$gammaI = rep(0.05,p$P)
p$gammaA = rep(0.06,p$P)
p$eta = rep(1,p$P)
p$pi = runif(p$P, min = 0.2, max = 0.8)
# Set beta by assuming R0=1.5 in all patches in isolation
p$beta = 1.5 * p$gammaI * 2

# Save index of state variable types in state variables vector (we have to use 
# a vector and thus, for instance, the name "S" needs to be defined)
p$idx_S = 1:p$P
p$idx_L = (p$P+1):(2*p$P)
p$idx_I = (2*p$P+1):(3*p$P)
p$idx_A = (3*p$P+1):(4*p$P)
p$idx_R = (4*p$P+1):(5*p$P)
# Set initial conditions. For example, we start with 2 infectious
# individuals in Canada.
L0 = mat.or.vec(p$P,1)
I0 = mat.or.vec(p$P,1)
I0[1] = 2
A0 = mat.or.vec(p$P,1)
R0 = mat.or.vec(p$P,1)
S0 = pop-(L0+I0+A0+R0)
# Vector of initial conditions to be passed to ODE solver.
IC = c(S = S0, L = L0, I = I0, A = A0, R = R0)
# Time span of the simulation (5 years here).
tspan = seq(from = 0, to = 5*365.25, by = 0.1)

# Call of the ODE solver.
sol <- ode(y = IC, 
           times = tspan, 
           func = SLIAR_metapop_rhs, 
           parms = p,
           method = "ode45")

# Put solution in an easier to use form.
times = sol[,"time"]
S = sol[,p$idx_S]
L = sol[,p$idx_L]
I = sol[,p$idx_I]
A = sol[,p$idx_A]
R = sol[,p$idx_R]
N = S+L+I+A+R

# A sample (and simple) plot: number infected per 100,000 inhabitants.
xlim = range(times)
ylim = c(0,max(I/N*1e5))
plot(times,I[,1]/N[,1]*1e5, 
     col = 1, type = "l",
     xlim = xlim, ylim = ylim,
     xlab = "Time (days)", ylab = "Number infectious per 100,000")
for (i in 2:p$P) {
  lines(times,I[,i]/N[,i]*1e5, col = i)
}
legend("topleft",legend = countries, col = 1:p$P, lty = 1)

# The (potential) issue with not having death (and birth to counterbalance it)
ylim = c(0,max(N))
plot(times, N[,1], 
     col = 1, type = "l",
     ylim = ylim,
     xlab = "Time (days)", ylab = "Total population")
for (i in 2:p$P) {
  lines(times,N[,i], col = i)
}
legend("left",legend = countries,col = 1:p$P, lty = 1)

