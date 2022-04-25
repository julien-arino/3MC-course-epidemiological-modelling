# 3MC Course on Epidemiological Modelling
You will find here material for the [3MC Course on Epidemiological Modelling](http://natural-sciences.nwu.ac.za/paa/3MC-Course-EM) that is to be held in South Africa in April 2022. Most of the material is arranged in 5 main subdirectories. Note that you can also access a web version of this site by following [this link](https://julien-arino.github.io/3MC-course-epidemiological-modelling/). In that version, the slides will open properly in a browser.

- `CODE` contains the `R` code that will be used during the School as well as some additional code that might prove useful. 
- `DATA` contains a few datasets that will be used. These datasets will also be available online directly, but for the convenience of participants, they are collected here.
- `FIGS` contains some figures. These are mostly used internally in the slides and should not be useful.
- `OUTPUT` will contain any output generated by the code (figures, tables, etc.).
- `SLIDES_MD` contains all written material for the course, including slides and any other material. To compile the slides, you could for instance use the command `npx @marp-team/marp-cli@latest --html 2022_04_3MC_EpiModelling*.md` from within this directory.

### Preparing for the school
All of my code is in `R`. If I have time, I will try to produce `Python` versions of some of it, but there is no guarantee that this will happen. You should therefore install `R`, which can be downloaded [here](https://www.r-project.org/). Although not strictly necessary, downloading `RStudio` is also a good idea. This can be done from [this website](https://www.rstudio.com/products/rstudio/download/). Once you have installed `R` (and perhaps `RStudio`), run the file [`CODE/install_required_libraries.R`](https://raw.githubusercontent.com/julien-arino/CIMPA-SA-MathEpi-2022/main/CODE/install_required_libraries.R) either from `RStudio` or from the command line so that the libraries we will be using are installed on your machine. See details in the file itself.
