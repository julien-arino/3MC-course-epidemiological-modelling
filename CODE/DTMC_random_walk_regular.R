# Example simulation of a simple SIS model
library(markovchain)

# Source a file with a few helpful functions for plotting (nice axes labels, crop figure)
source("useful_functions.R")

# Total population
nb_states = 10
# Parameters
proba_left = 0.5
proba_right = 0.5
proba_stay = 1-(proba_left+proba_right)

# Make the transition matrix
T = mat.or.vec(nr = nb_states, nc = nb_states)
for (row in 2:(nb_states-1)) {
  T[row,(row-1)] = proba_left
  T[row,(row+1)] = proba_right
  T[row, row] = proba_stay
}
# First row only has move right
T[1,2] = 1
# Last row only has move left
T[nb_states, (nb_states-1)] = 1

mcRW <- new("markovchain", 
            states = sprintf("S_%d", 1:nb_states),
            transitionMatrix = T,
            name = "RW_reg")

# Show some info about the chain
summary(mcRW)

# The vector of steady states.
steadyStates(mcRW)

# 
meanRecurrenceTime(mcRW)

meanFirstPassageTime(mcRW)
