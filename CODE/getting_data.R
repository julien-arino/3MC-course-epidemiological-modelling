# Example of using wbstats to get World Bank data
library(wbstats)
# By default, wb_data now returns data in the wide format, where the data column 
# has the name of the indicator. We use the old system, where the data is in the
# column "value".
pop_data_CTRY <- wb_data(country = c("ZAF"), indicator = "SP.POP.TOTL",
                         mrv = 100, return_wide = FALSE)
y_range = range(pop_data_CTRY$value)
y_axis <- make_y_axis(y_range)
png(file = "../FIGS/pop_ZAF.png", width = 800, height = 400)
plot(pop_data_CTRY$date, pop_data_CTRY$value * y_axis$factor,
     xlab = "Year", ylab = "Population", type = "b", lwd = 2,
     yaxt = "n")
axis(2, at = y_axis$ticks, labels = y_axis$labels, las = 1)
dev.off()
crop_figure("../FIGS/pop_ZAF.png")
