gamma = 1/5
beta = 0.5

beta/gamma

S = list()
I = list()
i = 1
for (S0 in seq(0.6, 1, 0.1)) {
  I0 = 0
  S[[i]] = seq(0.001, S0, 0.001)
  I[[i]] = S0+I0-S[[i]]+gamma/beta*log(S[[i]]/S0)
  i = i+1
}
for (S0 in seq(1, 0.05, -0.1)) {
  I0 = 1-S0
  S[[i]] = seq(0.001, S0, 0.001)
  I[[i]] = S0+I0-S[[i]]+gamma/beta*log(S[[i]]/S0)
  i = i+1
}

S[[i]] = seq(0, 1, 0.001)
I[[i]] = 1-S[[i]]

png("KMK_planar_trajectories.png", width = 1000, height = 500)
for (i in 1:length(S)) {
  if (i == 1) {
    plot(S[[i]], I[[i]],
         type = "l",
         xlim = c(0,1), ylim = c(0,1),
         xaxs = "i", yaxs = "i",
         xlab = "S", ylab = "I")
  } else {
    lines(S[[i]], I[[i]])
  }
}
dev.off()
crop_figure("KMK_planar_trajectories.png")
