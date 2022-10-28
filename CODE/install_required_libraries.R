# Install (and load) the libraries required for running the code in this repository.
# 
# This script works best if no library has yet been loaded, so run from a fresh session or call
# from the command line. For example, in Linux:
# Rscript install_required_libraries.R
# 
# In Linux, you may also want to run the script as sudo so that it is installed for all users. 
# In this case, the command line would be
# sudo Rscript install_required_libraries.R

required_liraries = c(
  "countrycode",
  "deSolve",
  "formatR",
  "GA",
  "geosphere",
  "htmltab",
  "ISOweek",
  "kableExtra",
  "knitr",
  "lubridate",
  "magrittr",
  "maps",
  "mapdata",
  "measurements",
  "methods",
  "sqldf",
  "wbstats",
  "XML"
)

for (l in required_liraries) {
  installed = require(l, character.only = TRUE)
  if (!installed) {
    install.packages(l)
  }
}
