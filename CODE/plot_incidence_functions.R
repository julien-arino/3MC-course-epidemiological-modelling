#  Plot incidence functions
library(dplyr)
library(lattice)
library(latticeExtra)
library(latex2exp)
library(viridis)

source("useful_functions.R")

N = 1000
beta = 0.001

x = seq(0, N, length.out = 200)
y = seq(0, N, length.out = 200)

grid = expand.grid(x=x, y=y)
grid$betaSI = beta * grid$x * grid$y
grid$betaSIoverN = beta * grid$x * grid$y / N
q = 0.4
grid$incid_refuge = beta*grid$y*(N-grid$y/q)
idx_I_geq_qN = which(grid$y >= q*N)
grid$incid_refuge[idx_I_geq_qN] = 0
k1 = 0.1
grid$negative_binomial = k1*grid$x*log(1+beta*grid$y/k1)

# Prepare plot: colour map
colorMap = viridis(1000)

p1 <- levelplot(betaSI ~ x * y,
                data = grid, 
                region = TRUE,
                cuts = 1000,
                col.regions = colorMap,
                xlab = list(TeX("$S$"), cex = 1.5),
                ylab = list(TeX("$I$"), cex = 1.5),
                scales = list(x = list(at = pretty(x),
                                       labels = pretty(x),
                                       cex = 1.5),
                              y = list(at = pretty(y),
                                       cex = 1.5)))
p2 <-  contourplot(betaSI ~ x * y,
                   data = grid,
                   labels = FALSE,
                   at = seq(min(grid$betaSI), max(grid$betaSI), length.out = 10),
                   col = "red", lwd = 3
)
png(file = "heatmap_betaSI.png",
    width = 800, height = 600)
p1+p2
dev.off()
crop_figure("heatmap_betaSI.png")

# Proportional incidence
p1 <- levelplot(betaSIoverN ~ x * y,
                data = grid, 
                region = TRUE,
                cuts = 1000,
                col.regions = colorMap,
                xlab = list(TeX("$S$"), cex = 1.5),
                ylab = list(TeX("$I$"), cex = 1.5),
                scales = list(x = list(at = pretty(x),
                                       labels = pretty(x),
                                       cex = 1.5),
                              y = list(at = pretty(y),
                                       cex = 1.5)))
p2 <-  contourplot(betaSIoverN ~ x * y,
                   data = grid,
                   labels = FALSE,
                   at = seq(min(grid$betaSIoverN), 
                            max(grid$betaSIoverN), 
                            length.out = 10),
                   col = "red", lwd = 3
)
png(file = "heatmap_betaSIoverN.png",
    width = 800, height = 600)
p1+p2
dev.off()
crop_figure("heatmap_betaSIoverN.png")

# Incidence with refuge
p1 <- levelplot(incid_refuge ~ x * y,
                data = grid, 
                region = TRUE,
                cuts = 1000,
                col.regions = colorMap,
                xlab = list(TeX("$S$"), cex = 1.5),
                ylab = list(TeX("$I$"), cex = 1.5),
                scales = list(x = list(at = pretty(x),
                                       labels = pretty(x),
                                       cex = 1.5),
                              y = list(at = pretty(y),
                                       cex = 1.5)))
p2 <-  contourplot(incid_refuge ~ x * y,
                   data = grid,
                   labels = FALSE,
                   at = c(1e-1, max(grid$incid_refuge)),
                   # at = seq(min(grid$incid_refuge), 
                   #          max(grid$incid_refuge), 
                   #          length.out = 5),
                   col = "red", lwd = 3
)
png(file = "heatmap_incidence_refuge.png",
    width = 800, height = 600)
p1+p2
dev.off()
crop_figure("heatmap_incidence_refuge.png")

# Negative binomial incidence
p1 <- levelplot(negative_binomial ~ x * y,
                data = grid, 
                region = TRUE,
                cuts = 1000,
                col.regions = colorMap,
                xlab = list(TeX("$S$"), cex = 1.5),
                ylab = list(TeX("$I$"), cex = 1.5),
                scales = list(x = list(at = pretty(x),
                                       labels = pretty(x),
                                       cex = 1.5),
                              y = list(at = pretty(y),
                                       cex = 1.5)))
p2 <-  contourplot(negative_binomial ~ x * y,
                   data = grid,
                   labels = FALSE,
                   # at = c(1e-1, max(grid$negative_binomial)),
                   at = seq(min(grid$negative_binomial),
                            max(grid$negative_binomial),
                            length.out = 5),
                   col = "red", lwd = 3
)
png(file = "heatmap_negative_binomial_incidence.png",
    width = 800, height = 600)
p1+p2
dev.off()
crop_figure("heatmap_negative_binomial_incidence.png")

