#  Plot incidence functions
library(dplyr)
library(lattice)
library(latticeExtra)
library(latex2exp)

N = 1000
beta = 0.001

S = seq(0, N, 1)
I = seq(0, N, 1)

SI = expand.grid(S = S, I = I) %>%
    filter(S+I<=N)
SI$betaSI = beta * SI$S * SI*I

  # Prepare plot: colour map
  colorMap = gray.colors(1000, rev = FALSE)

  p1 <- levelplot(betaSI ~ S*I,
                  data = SI,
                  scales = list(x = list(at = pretty(S),
                                         labels = pretty(S),
                                         cex = 1.5),
                                y = list(at = pretty(I),
                                         cex = 1.5)),
                  at = seq(min(SI$betaSI,
                               na.rm = TRUE),
                           max(SI$betaSI,
                               na.rm = TRUE),
                           length.out = 800),
                  # at = quant_grid_z2,
                  region = TRUE,
                  col.regions = colorMap,
                  #xlim = range(desired_R0_values),
                  colorkey = list(title = TeX("$t^*$"),
                                  title.control = list(cex = 2)),
                  # panel = latticeExtra::panel.2dsmoother,args=list(span=0.5),
                  xlab = list(TeX("$S$"), cex = 2),
                  ylab = list(TeX("$I$"), cex = 2),
                  cex = 2)

  p2 <-  contourplot(fraction_extinctions ~ k*threshold_IA_plus_IB,
                     data = result_matrix,
                     labels = list(cex = 1.5),
                     # at = seq(0.01,0.16,by=0.03),
                     at = seq(0, 1, 0.2),
                     col = "red", lwd = 3,
                     # panel = latticeExtra::panel.2dsmoother,
                     # args=list(span=0.5)
                     # plot.axes = {axis(1); axis(2);
                     # lines(rep(1/0.03761688,length(vec_R0)),
                     # vec_R0, col = "green") }
  )
  png(file = "fraction_extinction_intensity_vs_proportion.png",
      width = 1000, height = 800)
  p1+p2
  #p1
  #p2
  dev.off()
  #crop_figure("fraction_extinction_intensity_vs_proportion.png")
