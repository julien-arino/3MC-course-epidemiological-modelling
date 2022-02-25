---
marp: true
title: History of epidemics and historical epidemics
description: 3MC Course Epidemiological Modelling - Julien Arino - Course 01 - History of epidemics and historical epidemics
theme: default
paginate: false
size: 4K
---

# Course objectives, organisation and an introduction to epidemiology

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

# <!--fit-->Course objectives

- Introduction to mathematical epidemiology
  - Problems
  - Methods

We will look at this with these particular problems in mind
1. Modelling techniques
2. Mathematical analysis of models
3. Computational analysis of models
4. Use of data

It is important to do the 4 interactively

---

<!-- _backgroundImage: "radial-gradient(white,80%,#f1c40f)" -->
# <!--fit-->Organisation of the course

- General notions of epidemiology
  - Emphasis on obtaining real data from public sources
- Basic epidemic models
  - Some history of modelling in Mathematical Epidemiology
  - SIR model of Kermack-McKandrick and the final size of an epidemic
  - SIS model with demography

---

# Reading recommendations

Throughout the course, I will refer to a variety of sources. Some will be papers I have authored or co-authored (I know them better), but I will also recommend other sources where appropriate

---

<!-- _backgroundImage: "linear-gradient(to bottom, #f1c40f, 20%, white)" -->
<!--fit-->Epidemiology

---

# Definition

From *Wikipedia*: Epidemiology is the study and analysis of the distribution (who, when, and where), patterns and determinants of health and disease conditions in defined populations

Epidemiology: "the study of what is upon the people", derived from Greek $\epsilon\pi\iota$ 'upon, among', $\delta\epsilon\omega\sigma$ 'people, district', and $\lambda\omega\gamma\omega\sigma$ 'study, word, discourse'


---

# Some terminology

- Epidemic: diseases that are "visited upon" a population
- Endemic: diseases that "reside within" a population

--- 

<!-- _backgroundImage: "linear-gradient(to bottom, #f1c40f, 20%, white)" -->
<!--fit-->Mathematical Epidemiology

---

<div style = "position: relative; top: -55%; padding-bottom:60px; font-size:40px">
Measles cases in the USA
</div>

![bg contain](https://julien-arino.github.io/assets_pics/measles_US_1944_2019.png)

