---
marp: true
title: Group models
description: 3MC Course Epidemiological Modelling - Julien Arino - Lecture 04 - Group models
theme: default
paginate: false
size: 4K
---

# Lecture 04 - Group models

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

<!-- _backgroundImage: "radial-gradient(white,80%,#f1c40f)" -->
# Outline

- Formulating group models
- Analysing group models
- Simulating group models

---

<!-- _backgroundImage: "linear-gradient(to bottom, #f1c40f, 20%, white)" -->
# <!--fit-->Formulating group models

---

# Limitations of single population ODE models

- As discussed in [Lecture 03](https://julien-arino.github.io/3MC-course-epidemiological-modelling/2022_04_3MC_EpiModelling_L03_SpreadInGroups_SpreadInSpace.html)

---

# Groups can be used for many things

Groups allow to introduce structure in a population without using PDEs

- Age structure
- Social structure
- Pathogen heterogeneity

In this lecture, we do not consider *spatial heterogeity*; this is done in [Lecture 05](https://julien-arino.github.io/3MC-course-epidemiological-modelling/2022_04_3MC_EpiModelling_L05_MetapopulationModels.html)

Let us start by considering a few examples

---

# Age-structured model

---

# Model incorporating social structure

Preventing tuberculosis in the foreign-born population of Canada: a mathematical modelling study.  Varughese, Langlois-Klassen, Long, & Li. [The International Journal of Tuberculosis and Lung Disease](https://doi.org/10.5588/ijtld.13.0625) **18** (2014)

---

![bg contain](https://raw.githubusercontent.com/julien-arino/3MC-course-epidemiological-modelling/main/FIGS/VarugheseLangloisklassenLongLi-2014-TB-flow_diagram.png)

---

# Model with pathogen heterogeity

---

# Model with immunological component

Global dynamics of a general class of multistage models for infectious diseases. Guo, Li & Shuai. [SIAM Journal on Applied Mathematics](https://doi.org/10.1137/110827028) **72** (2012)

---

![bg contain](https://raw.githubusercontent.com/julien-arino/3MC-course-epidemiological-modelling/main/FIGS/GuoLiShuai-2012-multistage-flow_diagram.png)

---

<!-- _backgroundImage: "linear-gradient(to bottom, #f1c40f, 20%, white)" -->
# <!--fit-->Analysing group models

---

<!-- _backgroundImage: "linear-gradient(to bottom, #f1c40f, 20%, white)" -->
# <!--fit-->Simulating group models

