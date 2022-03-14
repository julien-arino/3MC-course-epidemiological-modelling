---
marp: true
title: Practicum - Introduction to R. Collecting data. Solving ODEs in R
description: 3MC Course Epidemiological Modelling - Julien Arino - Practicum 01 - Introduction to R. Collecting data. Solving ODEs in R
theme: default
paginate: false
size: 4K
---

# Practicum 01 - Introduction to R. Collecting data. Solving ODEs in R

April 2022 

Julien Arino [![width:32px](https://raw.githubusercontent.com/julien-arino/presentations/main/FIGS/icons/email-round.png)](mailto:Julien.Arino@umanitoba.ca) [![width:32px](https://raw.githubusercontent.com/julien-arino/presentations/main/FIGS/icons/world-wide-web.png)](https://server.math.umanitoba.ca/~jarino) [![width:32px](https://raw.githubusercontent.com/julien-arino/presentations/main/FIGS/icons/github-icon.png)](https://github.com/julien-arino)

Department of Mathematics & Data Science Nexus
University of Manitoba*

<div style = "font-size:18px; margin-top:-10px; padding-bottom:30px;"></div>

Canadian Centre for Disease Modelling
Canadian COVID-19 Mathematical Modelling Task Force
NSERC-PHAC EID Modelling Consortium (CANMOD, MfPH, OMNI/RÉUNIS)

<div style = "text-align: justify; position: relative; bottom: -5%; font-size:18px;">
* The University of Manitoba campuses are located on original lands of Anishinaabeg, Cree, Oji-Cree, Dakota and Dene peoples, and on the homeland of the Métis Nation.</div>

---

---

<!-- _backgroundImage: "linear-gradient(to bottom, #f1c40f, 20%, white)" -->
# <!--fit-->Foreword: the R language

---

# R was originally for stats but is now more

- Open source version of S
- Appeared in 1993
- Now version 4.1
- One major advantage in my view: uses a lot of C and Fortran code. E.g., `deSolve`:
> The functions provide an interface to the FORTRAN functions 'lsoda', 'lsodar', 'lsode', 'lsodes' of the 'ODEPACK' collection, to the FORTRAN functions 'dvode', 'zvode' and 'daspk' and a C-implementation of solvers of the 'Runge-Kutta' family with fixed or variable time steps
- Very active community on the web, easy to find solutions (same true of Python, I just prefer R)

---

# Development environments

- Terminal version, not very friendly
- Execute R scripts by using `Rscript name_of_script.R`. Useful to run code in `cron`, for instance
- Use IDEs:
    - [RStudio](https://www.rstudio.com/products/rstudio/) has become the reference
    - [RKWard](https://invent.kde.org/education/rkward) is useful if you are for instance using an ARM processor (Raspberry Pi, some Chromebooks..)
- Integrate into jupyter notebooks

---

# Going further

- [RStudio server](https://www.rstudio.com/products/rstudio/#rstudio-server): run RStudio on a Linux server and connect via a web interface
- Shiny: easily create an interactive web site running R code
- [Shiny server](https://www.rstudio.com/products/shiny/shiny-server/): run Shiny apps on a Linux server
- Rmarkdown: markdown that incorporates R commands. Useful for generating reports in html or pdf, can make slides as well..
- RSweave: LaTeX incorporating R commands. Useful for generating reports. Not used as much as Rmarkdown these days

---

# R is a scripted language

- Interactive
- Allows you to work in real time
    - Be careful: what is in memory might involve steps not written down in a script
    - If you want to reproduce your steps, it is good to write all the steps down in a script and to test from time to time running using `Rscript`: this will ensure that all that is required to run is indeed loaded to memory when it needs to..

---

<!-- _backgroundImage: "linear-gradient(to bottom, #f1c40f, 20%, white)" -->
# <!--fit-->Programming in R

---

# Similar to matlab..

.. with some differences, of course! Otherwise, where would the fun be? ;)

---

# Assignment

Two ways:

```
X <- 10
```

or

```
X = 10
```

First version is preferred by R purists.. I don't really care

---

# Lists

A very useful data structure, quite flexible and versatile. Empty list: `L <- list()`. Convenient for things like parameters. For instance

```
L <- list()
L$a <- 10
L$b <- 3
L[["another_name"]] <- "Plouf plouf"
```

```
> L[1]
$a
[1] 10
> L[[2]]
[1] 3
> L$a
[1] 10
> L[["b"]]
[1] 3
> L$another_name
[1] "Plouf plouf"
```

---

# Vectors

```
x = 1:10
y <- c(x, 12)
> y
 [1]  1  2  3  4  5  6  7  8  9 10 12
z = c("red", "blue")
> z
[1] "red"  "blue"
z = c(z, 1)
> z
[1] "red"  "blue" "1"
```
Note that in `z`, since the first two entries are characters, the added entry is also a character. Contrary to lists, vectors have all entries of the same type

---

# Matrices

Matrix (or vector) of zeros
```
A <- mat.or.vec(nr = 2, nc = 3)
```

Matrix with prescribed entries

```
B <- matrix(c(1,2,3,4), nr = 2, nc = 2)
> B
     [,1] [,2]
[1,]    1    3
[2,]    2    4
C <- matrix(c(1,2,3,4), nr = 2, nc = 2, byrow = TRUE)
> C
     [,1] [,2]
[1,]    1    2
[2,]    3    4
```

Remark that here and elsewhere, naming the arguments (e.g., `nr = 2`) allows to use arguments in any order

---

# Matrix operations

Probably the biggest annoyance in R compared to other languages

- The notation `A*B` is the *Hadamard product* $A\circ B$ (what would be denoted `A.*B` in matlab), not the standard matrix multiplication
- Matrix multiplication is written `A %*% B`

---

# Vector operations

Vector addition is also frustrating. Say you write `x=1:10`, i.e., make the vector
```
> x
 [1]  1  2  3  4  5  6  7  8  9 10
```
Then `x+1` gives
```
> x+1
 [1]  2  3  4  5  6  7  8  9 10 11
 ```
 i.e., adds 1 to all entries in the vector

---

<!-- _backgroundImage: "linear-gradient(to bottom, #f1c40f, 20%, white)" -->
# <!--fit-->Dealing with data


<div style = "position: relative; bottom: -40%; font-size:20px;">

- JA. [Mathematical epidemiology in a data-rich world](http://dx.doi.org/10.1016/j.idm.2019.12.008). *Infectious Disease Modelling* **5**:161-188 (2020)
- See also [GitHub repo](https://github.com/julien-arino/modelling-with-data) for that paper

</div>

---

# It is important to be "data aware"

- Using R, it is really easy to grab data from the web, e.g., from Open Data sources
- More and more locations have an open data policy
- As a modeller, you do not need to have data everywhere, but you should be aware of the context
- If you want your work to have an impact, for instance in public health, you cannot be completely disconnected from reality

---

# Data is everywhere 

## Closed data

- Often generated by companies, governments or research labs
- When available, come with multiple restrictions

## Open data

- Often generated by the same entities but "liberated" after a certain period
- More and more frequent with governments/public entities
- Wide variety of licenses, so beware
- Wide variety of qualities, so beware

---

# Open Data initiatives

Recent movement (5-10 years): governments (local or higher) create portals where data are centralised and published

- [Winnipeg](https://data.winnipeg.ca/)
- [Alberta](https://open.alberta.ca/opendata)
- [Canada](https://open.canada.ca/en/open-data)
- [Europe](https://data.europa.eu/euodp/data/)
- [UN](http://data.un.org/)
- [World Bank](https://data.worldbank.org/)
- [WHO](https://www.who.int/gho/database/en/)

---

# Data gathering methods

- By hand
- Using programs such as [Engauge Digitizer](http://markummitchell.github.io/engauge-digitizer/) or [g3data](https://github.com/pn2200/g3data)
- Using APIs
- Using natural language processing and other web scraping methods
- Using R or Python packages

---

# Example: population of South Africa

```
pop_data_CTRY <- wb_data(country = "ZAF", indicator = "SP.POP.TOTL",
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
```

---

![bg contain](https://raw.githubusercontent.com/julien-arino/3MC-course-epidemiological-modelling/main/FIGS/pop_ZAF.png)

---

# Dutch Elm Disease

- Fungal disease that affects Elms
- Caused by the fungus *Ophiostoma ulmi* 
- Transmitted by the Elm bark beetle (*Scolytus scolytus*)
- Has decimated North American urban elm forests

---

![bg contain](https://raw.githubusercontent.com/julien-arino/3MC-course-epidemiological-modelling/main/FIGS/WinnipegOpenDataPortal.png)

---

![bg contain](https://raw.githubusercontent.com/julien-arino/3MC-course-epidemiological-modelling/main/FIGS/WODTreeMap.png)

---

![bg contain](https://raw.githubusercontent.com/julien-arino/3MC-course-epidemiological-modelling/main/FIGS/WODTreeMapZoom.png)

---

# Getting the tree data

```
allTrees = read.csv("https://data.winnipeg.ca/api/views/hfwk-jp4h/ro
```

After this,

```
dim(allTrees)
## [1] 300846
15
```

---

# Let us clean things a little

```
elms_idx = grep("American Elm", allTrees$Common.Name, ignore.case = TRUE)
elms = allTrees[elms_idx, ]
```

We are left with 54,036 American elms

---

![bg contain](https://raw.githubusercontent.com/julien-arino/3MC-course-epidemiological-modelling/main/FIGS/Recap_Diagram.png)

---

![bg contain](https://raw.githubusercontent.com/julien-arino/3MC-course-epidemiological-modelling/main/FIGS/temperature_phase.png)

---

![bg contain](https://raw.githubusercontent.com/julien-arino/3MC-course-epidemiological-modelling/main/FIGS/flow_diagram_DED_beetles.png)

---

![bg contain](https://raw.githubusercontent.com/julien-arino/3MC-course-epidemiological-modelling/main/FIGS/flow_diagram_DED_trees.png)

---

# Computation of root systems interactions

(Pas en temps réel ici, on a besoin d'une machine assez grosse -- environ 50GB de RAM)

- Si les racines d'un arbre infecté touchent les racines d'un arbre sain, le champignon est transmis
- Etendue système racinaire dépend de la hauteur de l'arbre (on a DBH)
- La façon dont les routes sont construites empêche les contacts racinaires d'un côté de la route à l'autre

---

# Distances between all trees

```
elms_xy = cbind(elms$X, elms$Y)
D = dist(elms_xy)
idx_D = which(D<50)
```

`indices_LT` is a large $N(N-1)/2\times 2$ matrix with indices (orig,dest) of trees in the pairs of elms, so
`indices_LT[idx_D]` are the pairs under consideration

On
garde un peu plus..

\begin{verbatim}
indices_LT_kept = as.data.frame(cbind(indices_LT[idx_D,],
                                D[idx_D]))
colnames(indices_LT_kept) = c("i","j","dist")
\end{verbatim}

---

# On crée des segments pour toutes les paires

```
tree_locs_orig = cbind(elms_latlon$lon[indices_LT_kept$i],
                       elms_latlon$lat[indices_LT_kept$i])
tree_locs_dest = cbind(elms_latlon$lon[indices_LT_kept$j],
                       elms_latlon$lat[indices_LT_kept$j])
tree_pairs = do.call(sf::st_sfc,
                     lapply(
                       1:nrow(tree_locs_orig),
                       function(i){
                         sf::st_linestring(
                           matrix(
                             c(tree_locs_orig[i,],
                               tree_locs_dest[i,]), 
                             ncol=2,
                             byrow=TRUE)
                         )
                       }
                     )
)
```

---

# A bit of mapping

```
library(tidyverse)
# Get bounding polygon for Winnipeg
bb_poly = osmdata::getbb(place_name = "winnipeg", 
                         format_out = "polygon")
# Get roads
roads <- osmdata::opq(bbox = bb_poly) %>%
  osmdata::add_osm_feature(key = 'highway', 
                           value = 'residential') %>%
  osmdata::osmdata_sf () %>%
  osmdata::trim_osmdata (bb_poly)
# Get rivers
rivers <- osmdata::opq(bbox = bb_poly) %>%
  osmdata::add_osm_feature(key = 'waterway', 
                           value = "river") %>%
  osmdata::osmdata_sf () %>%
  osmdata::trim_osmdata (bb_poly)
```

---

# Et on termine tranquille

- On a les paires d'arbres potentiellement en contact
- On a les routes et les rivieres de la ville (collection de segments de
  droite)
- Si il y a une intersection entre une paire et une route/riviere, on oublie cette paire

```
st_crs(tree_pairs) = sf::st_crs(roads$osm_lines$geometry)
iroads = sf::st_intersects(x = roads$osm_lines$geometry,
                           y = tree_pairs)
irivers = sf::st_intersects(x = rivers$osm_lines$geometry,
                            y = tree_pairs)
```

---

```
tree_pairs_roads_intersect = c()
for (i in 1:length(iroads)) {
  if (length(iroads[[i]])>0) {
    tree_pairs_roads_intersect = c(tree_pairs_roads_intersect,
                                   iroads[[i]])
  }
}
tree_pairs_roads_intersect = sort(tree_pairs_roads_intersect)
to_keep = 1:dim(tree_locs_orig)[1]
to_keep = setdiff(to_keep,tree_pairs_roads_intersect)
```


---

\maxFrameImageNoFrame{pairs_postproc}

---

\maxFrameImageNoFrame{pairs_postproc_zoom}

---

\maxFrameImageNoFrame{selectedTrees}

---

<!-- _backgroundImage: "linear-gradient(to bottom, #f1c40f, 20%, white)" -->
# <!--fit-->Solving ODE numerically

