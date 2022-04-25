---
marp: true
title: Course organisation
description: Julien Arino - 3MC Course Epidemiological Modelling - Lecture 00 - Course organisation
theme: default
math: mathjax
paginate: false
size: 4K
---

<style>
  .theorem {
    text-align:justify;
    background-color:#16a085;
    border-radius:20px;
    padding:10px 20px 10px 20px;
    box-shadow: 0px 1px 5px #999;  margin-bottom: 10px;
  }
  .definition {
    text-align:justify;
    background-color:#ededde;
    border-radius:20px;
    padding:10px 20px 10px 20px;
    box-shadow: 0px 1px 5px #999;
    margin-bottom: 10px;
  }
  img[alt~="center"] {
    display: block;
    margin: 0 auto;
  }
</style>

# Course organisation

4 April 2022 

Julien Arino [![width:32px](https://raw.githubusercontent.com/julien-arino/presentations/main/FIGS/icons/email-round.png)](mailto:Julien.Arino@umanitoba.ca) [![width:32px](https://raw.githubusercontent.com/julien-arino/presentations/main/FIGS/icons/world-wide-web.png)](https://julien-arino.github.io/) [![width:32px](https://raw.githubusercontent.com/julien-arino/presentations/main/FIGS/icons/github-icon.png)](https://github.com/julien-arino)

Department of Mathematics & Data Science Nexus
University of Manitoba*

<div style = "font-size:18px; margin-top:-10px; padding-bottom:30px;"></div>

Canadian Centre for Disease Modelling
Canadian COVID-19 Mathematical Modelling Task Force
NSERC-PHAC EID Modelling Consortium (CANMOD, MfPH, OMNI/RÉUNIS)

<div style = "text-align: justify; position: relative; bottom: -5%; font-size:18px;">
* The University of Manitoba campuses are located on original lands of Anishinaabeg, Cree, Oji-Cree, Dakota and Dene peoples, and on the homeland of the Métis Nation.</div>

---

![bg right:40%](https://raw.githubusercontent.com/julien-arino/3MC-course-epidemiological-modelling/main/FIGS/FredBrauer_2007-05-13.jpg)
# In Memoriam - Fred Brauer

Fred Brauer was a friend and mentor to many worldwide and an *éminence grise* of Mathematical Epidemiology in Canada

I was privileged to learn from him and teach math epi with him in a wide variety of settings

Fred passed away 2021-10-17. This course is dedicated to his memory!

> When you learn to use a hammer, everything looks like a nail

---

<!-- _backgroundImage: "linear-gradient(to bottom, #85110d, 20%, white)" -->
# <!--fit-->About the course

---

# Getting in touch

- Just email me (email is on the title page)
- Do add something like [3MC] in your subject line, I get (too) many emails

---

# GitHub repository for the course

Most course material is available from a GitHub repository/page I set up: 
[https://julien-arino.github.io/3MC-course-epidemiological-modelling](https://julien-arino.github.io/3MC-course-epidemiological-modelling)

This includes the slides, code and data samples

This *does not* include bibliographic references, although there are links to articles and books. As much as possible, I link to Open Access sources

One remark: I sometimes refer to Wikipedia. For the younger students here: this can be where you first look, not what you cite in proper work

---

# Slides

- Slides are written in `Markdown` and `LaTeX` and are rendered as `html` files using [Marp](https://marp.app/) running in the [Visual Studio Code](https://code.visualstudio.com/) editor

- Image files are mostly not hosted locally and thus require internet access

- As much as possible, I have indicated provenance (by linking the file on the original website); when not possible, the file is saved with the name of the source indicated

- Figure sources are added as html comments which appear as "speakers notes" in the presentation version

- For convenience, `pdf` versions of the slides are available in the GitHub repo; the `pdf` versions embed image files. However, movies and Shiny code do not function in the `pdf` version of the slides

---

# Videos

- Videos will be recorded shortly for the course
- They will be posted on YouTube
- When they are ready, I will add a link here

---

# Code

- I use `R` - `Python` would be a good choice as well but I prefer `R`
- Instructions on setting up `R` for the course can be found in the GitHub repo
- Some code is in the repo
- For the epi side of things, a very useful open reference: [R for applied epidemiology and public health](https://epirhandbook.com/en/index.html)

---

# Reading recommendations (math epi)

The following are *my* favourite references:

- Waltman. [Deterministic threshold models in the theory of epidemics](https://doi.org/10.1007/978-3-642-80820-3) (1974)
- Capasso. [Mathematical structures of epidemic systems](https://doi.org/10.1007/978-3-540-70514-7) (1993)
- Hethcote. [The mathematics of infectious diseases](https://doi.org/10.1137/S0036144500371907) SIAM Review (2000)
- Daley & Gani. [Epidemic modelling]() (2001)
- Brauer, PvdD & Wu. [Mathematical Epidemiology](https://doi.org/10.1007/978-3-540-78911-6) (2008)
- Brauer & C$^3$. [Mathematical Models in Population Biology and Epidemiology](https://doi.org/10.1007/978-1-4614-1686-9) (2012)
- Brauer, C$^3$ & Feng. [Mathematical Models in Epidemiology](https://doi.org/10.1007/978-1-4939-9828-9) (2019)

---

# Course objectives

Introduction to Mathematical Epidemiology
 - Problems
 - Methods

We will have these particular problems in mind:
1. Modelling techniques
2. Mathematical analysis of models
3. Computational analysis of models
4. Use of data

It is important to do the 4 interactively

---

# About modelling

- Do not neglect this step
- Think outside the box
- Take the time
- Try to remain simple

---

# About mathematical analysis

- Used to be the sole purpose of most papers
- Judge your audience: global stability is cool, but is it really required if you want to present work to a public health person?
- Do as much as possible (for instance, knowing the value of $\mathcal{R}_0$ can be useful to set parameters), do not hesitate to move to an appendix 

---

# About numerics

- Numerics should be used to complement the mathematical analysis

- If you have shown the global stability of some equilibrium point, no need to show a simulation where solutions converge to this equilibrium

- In fact, it is rarely useful to show a solution (cases where it is okay: before going to zero the number of infectious does something really cool, you have a period doubling, etc.)

- Instead, use numerics to investigate scenarios or test the effect of varying parameters

- A good figure tells a story, it is worth spending time thinking about how to make good figures

---

# About data

- Acquiring data has become much easier than even 20 years ago
- As a modeller, it is not necessary that everything be data-driven, but it is necessary to be "context-aware" (this means getting a sense of the quantities involved in the process you want to model)

---

# Organisation of the course

L1: History of epidemics and Historical epidemics
L2: Basic concepts of Mathematical Epidemiology. Models in one population
P1: Introduction to R. Collecting data. Solving ODEs in R
L3: Epidemics spreading among groups. Epidemics spreading in space and time                                     
L4: Group models
L5: Metapopulation models
P2: Model analysis, studying large-scale models in R
L6: Stochastic aspects in the spread of epidemics
L7: Stochastic epidemic models
L8: Agent-based models
P3: Analysis, studying stochastic models in R. Simulating agent-based models                   
L9: Some recent mathematical models for COVID-19, HIV/AIDS, TB, Malaria, etc.

---

# <!--fit-->Colour codes for course organisation

![bg](https://raw.githubusercontent.com/julien-arino/3MC-course-epidemiological-modelling/main/FIGS/bg_colour_red.png) 
![bg](https://raw.githubusercontent.com/julien-arino/3MC-course-epidemiological-modelling/main/FIGS/bg_colour_yellow.png) 
![bg](https://raw.githubusercontent.com/julien-arino/3MC-course-epidemiological-modelling/main/FIGS/bg_colour_green.png)

