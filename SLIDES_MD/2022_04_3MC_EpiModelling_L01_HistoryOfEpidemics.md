---
marp: true
title: History of epidemics and Historical epidemics
description: 3MC Course Epidemiological Modelling - Julien Arino - Course 01 - History of epidemics and Historical epidemics
theme: default
paginate: false
size: 4K
---

# History of epidemics and Historical epidemics

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

<!-- _backgroundImage: "radial-gradient(white,80%,#85110d)" -->
# <!--fit-->About the course


---

![bg right:40%](https://raw.githubusercontent.com/julien-arino/presentations/main/FIGS/epidemio/FredBrauer_2007-05-13.jpg)
# In Memoriam - Fred Brauer

Fred Brauer was a friend and mentor to many worldwide and a driving force of Mathematical Epidemiology in Canada

I was priviledged to learn from him and teach math epi with him in a wide variety of settings

Fred passed away 2021-10-17. This course is dedicated to his memory!

> When you learn to use a hammer, everything looks like a nail

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

# GitHub repository for the course

Most course material is available from a GitHub repository/page I set up: 
[https://julien-arino.github.io/3MC-course-epidemiological-modelling](https://julien-arino.github.io/3MC-course-epidemiological-modelling)

This includes the slides, code and data samples

This *does not* include bibliographic references, although there are links to articles and books. As much as possible, I link to Open Access sources

One remark: I sometimes refer to Wikipedia. For the younger students here: this can be the beginning of your work, not what you cite in proper work

---

# Slides

- The slides are written in `Markdown` and `LaTeX` and are rendered as `html` files using [Marp](https://marp.app/) running in the [Visual Studio Code](https://code.visualstudio.com/) editor

- Image files are not hosted locally and thus require internet access. As much as possible, I have left provenance information (by linking the file on the original website); when not possible, the file is saved with the name of the source indicated

- For convenience, `pdf` versions of the slides are also available in the GitHub repo; the `pdf` versions embed image files. However, movies and Shiny code do not function in the `pdf` version of the slides

---

# Code

- I use `R`
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

<!-- _backgroundImage: "radial-gradient(white,80%,#85110d)" -->
# <!--fit-->On to the course!!

---

<!-- _backgroundImage: "linear-gradient(to bottom, #f1c40f, 20%, white)" -->
# <!--fit-->Epidemiology

---

# Definition

> **Epidemiology** is the study and analysis of the distribution (who, when, and where), patterns and determinants of health and disease conditions in defined populations [[Wikipedia](https://en.wikipedia.org/wiki/Epidemiology)]

> Epidemiology is the study of how often diseases occur in different groups of people and why. Epidemiological information is used to plan and evaluate strategies to prevent illness and as a guide to the management of patients in whom disease has already developed [[BMJ](https://www.bmj.com/about-bmj/resources-readers/publications/epidemiology-uninitiated/1-what-epidemiology)]

Etymology: *the study of what is upon the people*, derived from the Greek $\varepsilon\pi\iota$ (*upon, among*), $\delta\varepsilon\mu\omega\sigma$ (*people, district*) and $\lambda\omega\gamma\omega\sigma$ (*study, word, discourse*)


---

# Some terminology

- Epidemic: diseases that are *visited upon* a population
- Endemic: diseases that *reside within* a population

---

<!-- _backgroundImage: "linear-gradient(to bottom, #f1c40f, 20%, white)" -->
# <!--fit-->History of epidemics / Historical epidemics

---

# Historical considerations

- Epidemic outbreaks are among the earliest recorded events in history
- Caveat: here, I barely discuss spatial aspects; there is another lecture devoted specifically to spatial aspects. Spatiality does play a very important role, though

---

![bg contain](https://upload.wikimedia.org/wikipedia/commons/c/c1/Difference_between_outbreak%2C_endemic%2C_epidemic_and_pandemic-en.png)

---

# First known epidemics ([from Wikipedia](https://en.wikipedia.org/wiki/List_of_epidemics))

<style scoped>
table {
    height: 100%;
    width: 100%;
    font-size: 20px;
}
</style>

| Event | Date | Location | Disease | Death toll (estimate) |
|---|---|---|---|---|
| Plague of Megiddo | 1350 BCE | Megiddo, land of Canaan | Unknown | Unknown | 
| [Plague of Athens](https://en.wikipedia.org/wiki/Plague_of_Athens) | 429–426 BCE | Greece, Libya, Egypt, Ethiopia | Possibly typhus, typhoid fever or VHF |  75,000–100,000 |
| [412 BCE epidemic](https://en.wikipedia.org/wiki/412_BC_epidemic) |412 BCE | Greece, Roman Republic | Possibly influenza | Unknown |
| [Antonine Plague](https://en.wikipedia.org/wiki/Antonine_Plague) | 165–180 CE (possibly up to 190 CE) | Roman Empire | Possibly smallpox | 5–10 million |
| Jian'an Plague | 217 CE | Han dynasty | Possibly typhoid fever or VHF | Unknown |
| [Plague of Cyprian](https://en.wikipedia.org/wiki/Plague_of_Cyprian) | 250–266 CE | Europe | Possibly smallpox | Unknown |
| [Plague of Justinian](https://en.wikipedia.org/wiki/Plague_of_Justinian) (1st plague pandemic) | 541–549 CE | Europe and West Asia | Bubonic plague | 15–100 million (25–60% of population of Europe) | 
| [Roman Plague of 590](https://en.wikipedia.org/wiki/Roman_Plague_of_590) (1st plague pandemic) | 590 CE | Rome, Byzantine Empire | Bubonic plague | Unknown |
| [Plague of Sheroe](https://en.wikipedia.org/wiki/Plague_of_Sheroe) (1st plague pandemic) | 627–628 CE | Bilad al-Sham | Bubonic plague | 25,000+ |
| [Plague of Amwas](https://en.wikipedia.org/wiki/Plague_of_Amwas) (1st plague pandemic) | 638–639 CE | Byzantine Empire, West Asia, Africa | Bubonic plague | 25,000+ |
| [Plague of 664](https://en.wikipedia.org/wiki/Plague_of_664) (1st plague pandemic)  | 664–689 CE | British Isles | Bubonic plague | Unknown |
| Plague of 698–701 (1st plague pandemic) | 698–701 CE | Byzantine Empire, West Asia, Syria, Mesopotamia | Bubonic plague |Unknown |
| [735–737 Japanese smallpox epidemic](https://en.wikipedia.org/wiki/735%E2%80%93737_Japanese_smallpox_epidemic) | 735–737 CE | Japan | Smallpox | 2 million (approx. 1/3 of Japanese population) | 
| Plague of 746–747 (1st plague pandemic) | 746–747 CE | Byzantine Empire, West Asia, Africa | Bubonic plague |Unknown |

---

<!-- _backgroundImage: "linear-gradient(to bottom, #f1c40f, 20%, white)" -->
# <!--fit-->Who, when and where

---

# Who, when and where

Recall part of the definition on Wikipedia
> **Epidemiology** is the study and analysis of the distribution (who, when, and where)

---

Domain is terminologically heavy. A few pointers:
- Milwid et al. [Toward standardizing a lexicon of infectious disease modeling terms](https://doi.org/10.3389/fpubh.2016.00213). Frontiers in Public Health 2016
- Moghadas and Laskowski. [Review of terms used in modelling influenza infection](https://nccid.ca/wp-content/uploads/sites/2/2015/03/ReviewTermsFluWEB.pdf). NCCID 2014

---

# Incidence & Prevalence

**Incidence**: number of new cases in a population generated within a certain time period

**Prevalence**: number of cases of a disease at a single time point in a population

---

# Epidemic curves

---

![bg left:50%](https://upload.wikimedia.org/wikipedia/commons/c/c7/Snow-cholera-map.jpg)

# <!--fit--> Where: [1854 cholera outbreak](https://en.wikipedia.org/wiki/1854_Broad_Street_cholera_outbreak)

Cholera outbreak in Broad Street, London (UK)

Studied by [John Snow](https://en.wikipedia.org/wiki/John_Snow)

> I found that nearly all the deaths had taken place within a short distance of the [Broad Street] pump

---

<!-- _backgroundImage: "linear-gradient(to bottom, #f1c40f, 20%, white)" -->
# <!--fit-->Fighting against infections

---

# Fighting against infections

> Epidemiological information is used to plan and evaluate **strategies to prevent illness** and as a guide to the **management of patients** in whom disease has already developed

- Preventing illness
    - Prophylactic measures
    - Vaccination
- Managing illness
    - Prevention of further spread (e.g., in hospital)
    - Treatment

---

# Immunisation

- Smallpox first disease for which it was known 
- Mentioned in a 1549 Chinese book
- China: powdered smallpox scabs blown up noses of the healthy; variolation-induced mortality not negligible (0.5-2%) but lower than normal (20%)
- 1798:  Edward Jenner introduces safer inoculation with cowpox (vaccination)
- 1880s: Pasteur extends vaccination to chicken cholera and anthrax in animals and human rabies

At the time, *herd immunity* was not understood so this was for personal protection

---

<div style = "position: relative; top: -55%; padding-bottom:60px; font-size:40px">
Measles cases in the USA
</div>

![bg contain](https://julien-arino.github.io/assets/img/measles_US_1944_2019.png)

--- 

<!-- _backgroundImage: "linear-gradient(to bottom, #f1c40f, 20%, white)" -->
# <!--fit-->Mathematical Epidemiology

---

# Domain is quite old ..

.. but has only become a thing in recent years!

---

![bg right:40%](https://raw.githubusercontent.com/julien-arino/3MC-course-epidemiological-modelling/main/FIGS/Bernoulli-1760-first_page.jpg)

# Daniel Bernoulli (1760)

- [BNF scan](https://gallica.bnf.fr/ark:/12148/bpt6k3558n/f220.item) or [pdf](https://julien-arino.github.io/assets/pdf/Bernoulli-1760.pdf)
- Probably the first epidemic model
- About petite vérole (smallpox) inoculation

---

![bg left:30%](https://raw.githubusercontent.com/julien-arino/3MC-course-epidemiological-modelling/main/FIGS/RonaldRoss_WellcomeCollection.jpg)
# Ross (early 1900)

- On 20 August 1897, observed malaria parasites in the gut of a mosquito fed several days earlier on a malaria positive human
- Nobel Prize for Medicine 1902
- Started considering malaria eradication using mathematical models

---

# Kermack and McKendrick (1927+)