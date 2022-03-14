library(wbstats)
pop_data_CTRY <- wb_data(country = c("SEN"), indicator = "SP.POP.TOTL",
                         mrv = 100)
y_range = range(pop_data_CTRY$value)
y_axis <- make_y_axis(y_range)
pdf(file = "FIGS/pop_SEN.pdf", width = 11, height = 8.5)
plot(pop_data_CTRY$date, pop_data_CTRY$value * y_axis$factor,
     xlab = "Année", ylab = "Population", type = "b", lwd = 2,
     yaxt = "n")
axis(2, at = y_axis$ticks, labels = y_axis$labels, las = 1, cex.axis = 0)