---
marp: true
title: History of epidemics and Historical epidemics
description: Julien Arino - 3MC Course Epidemiological Modelling - Lecture 01 - History of epidemics and Historical epidemics
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

<!-- _backgroundImage: "linear-gradient(to top, #85110d, 3%, white)" -->
# <!--fit-->History of epidemics and Historical epidemics

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

<!-- _backgroundImage: "radial-gradient(white,80%,#f1c40f)" -->
# Outline
- Epidemiology
- History of epidemics / Historical epidemics
- Who, when and where
- Fighting against infections
- Mathematical Epidemiology
- Computational epidemiology
- Use of data in epidemiology

---

<!-- _backgroundImage: "linear-gradient(to bottom, #f1c40f, 20%, white)" -->
# <!--fit-->Epidemiology

---

# Definition

> **Epidemiology** is the study and analysis of the distribution (who, when, and where), patterns and determinants of health and disease conditions in defined populations [[Wikipedia](https://en.wikipedia.org/wiki/Epidemiology)]

> Epidemiology is the study of how often diseases occur in different groups of people and why. Epidemiological information is used to plan and evaluate strategies to prevent illness and as a guide to the management of patients in whom disease has already developed [[BMJ](https://www.bmj.com/about-bmj/resources-readers/publications/epidemiology-uninitiated/1-what-epidemiology)]

Etymology: *the study of what is upon the people*, derived from the Greek $\varepsilon\pi\iota$ (*upon, among*), $\delta\varepsilon\mu\omega\sigma$ (*people, district*) and $\lambda\omega\gamma\omega\sigma$ (*study, word, discourse*)


---

<!-- _backgroundImage: "linear-gradient(to bottom, #f1c40f, 20%, white)" -->
# <!--fit-->History of epidemics / Historical epidemics

---

# Historical considerations

- Epidemic outbreaks are among the earliest recorded events in history
- Caveat: here, I barely discuss spatial aspects; this is done in [Lecture 03](https://julien-arino.github.io/3MC-course-epidemiological-modelling/2022_04_3MC_EpiModelling_L03_SpreadInGroups_SpreadInSpace.html) and [Lecture 05](https://julien-arino.github.io/3MC-course-epidemiological-modelling/2022_04_3MC_EpiModelling_L05_MetapopulationModels.html). Spatiality does play a very important role, though

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

# Who

- **Epidemiology** typically used when dealing with humans, but sometimes also generically when an easy description is sought; e.g., plant disease epidemiology
- **Epizootic**: denoting or relating to a disease that is temporarily prevalent and widespread in an animal population
- **Panzootic** is like a pandemic for animals
- **One Health**: considers health of humans, animals and their environment (including plants)

---

![bg contain 55%](https://els-jbs-prod-cdn.jbs.elsevierhealth.com/cms/attachment/f4abefee-9839-4a6c-8e19-57ce0e85c304/gr1_lrg.jpg "https://doi.org/10.1016/S0140-6736(20)31027-8")

---

# Incidence & Prevalence (when?)

**Incidence**: number of new cases in a population generated within a certain time period

**Prevalence**: number of cases of a disease at a single time point in a population

---

# Epidemic curves

- Used to record the occurrence of new cases as a function of time
- When not too many cases, usually "individualised" (bar plots)
- When number of cases is large, continuous curve

---

![bg contain](https://media.springernature.com/full/springer-static/image/art%3A10.1038%2Fs41591-020-1092-0/MediaObjects/41591_2020_1092_Fig1_HTML.png?as=webp "https://doi.org/10.1038/s41591-020-1092-0")

---

![bg contain](https://www.science.org/cms/10.1126/science.abf8832/asset/c20b60b8-4867-4cbb-80ba-a4e6a80135e1/assets/graphic/371_27_f1.jpeg "https://doi.org/10.1126/science.abf8832")

---

# Some terminology for "where"

- **Epidemic**: diseases that are *visited upon* a population
- **Pandemic**: (will revisit this later in the course) epidemic that has spread across a large region, e.g., multiple continents or worldwide
- **Endemic**: diseases that *reside within* a population
- We don't say "panendemic"

---

![bg left:50%](https://upload.wikimedia.org/wikipedia/commons/c/c7/Snow-cholera-map.jpg)

# <!--fit--> Where: [1854 cholera outbreak](https://en.wikipedia.org/wiki/1854_Broad_Street_cholera_outbreak)

Cholera outbreak in Broad Street, London (UK)

Studied by [John Snow](https://en.wikipedia.org/wiki/John_Snow)

> I found that nearly all the deaths had taken place within a short distance of the [Broad Street] pump

---

# WHO pandemic (influenza) [phases](https://www.ncbi.nlm.nih.gov/books/NBK143061/)

<style>
    .heatMap {
        overflow:scroll;
    }
    .heatMap th {
        background: grey;
    }
    .heatMap tr:nth-child(1) { background: green;}
    .heatMap tr:nth-child(2) { background: green;}
    .heatMap tr:nth-child(3) { background: yellow;}
    .heatMap tr:nth-child(4) { background: yellow;}
    .heatMap tr:nth-child(5) { background: orange;}
    .heatMap tr:nth-child(6) { background: red;}
</style>

<div class="heatMap">

| Period | Phase | Description |
|:---|:---:|:---|
| Interpandemic | 1 | No animal influenza virus circulating among animals has been reported to cause infection in humans |
| | 2 | Animal influenza virus circulating in domesticated or wild animals known to have caused infection in humans and therefore considered a specific potential pandemic threat |
| Pandemic alert | 3 | Animal or human-animal influenza reassortant virus has caused sporadic cases or small clusters of disease in people, but has not resulted in H2H transmission sufficient to sustain community-level outbreaks |
| | 4 | Human-to-human transmission of an animal or human-animal influenza reassortant virus able to sustain community-level outbreaks has been verified |
| | 5 | Same identified virus has caused sustained community-level outbreaks in at least 2 countries in 1 WHO region |
| Pandemic | 6 | In addition to criteria in Phase 5, same virus has caused sustained community-level outbreaks in at least 1 other country in another WHO region |

</div>

---

![bg](https://upload.wikimedia.org/wikipedia/commons/thumb/b/b3/World_Health_Organisation_regional_offices.svg/1280px-World_Health_Organisation_regional_offices.svg.png)

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
- Started considering malaria eradication using mathematical models; for some history, read [this 2012 paper](https://www.ncbi.nlm.nih.gov/pmc/articles/PMC3320609/pdf/ppat.1002588.pdf)

---

# Kermack and McKendrick (1927+)

- We spend a lot more time on this in [Lecture 02](https://julien-arino.github.io/3MC-course-epidemiological-modelling/2022_04_3MC_EpiModelling_L02_BasicMathEpi.html)
- Groundbreaking set of papers starting in 1927
  - We will see one particular case, the most well known, but I point out here and point out in Lecture 02 that this is just the tip of the iceberg of their work

---

# Some activity later, but not much until 1990s

- In recent years, explosion
- Since the beginning of COVID-19: just nuts..

---

<!-- _backgroundImage: "linear-gradient(to bottom, #f1c40f, 20%, white)" -->
# <!--fit-->Computational epidemiology

---

# A more recent trend

- Some rare numerical work $\leq$ 1980s, mostly simulation of math models
  - Baroyan, Rvachev et al. [Computer modelling of influenza epidemics for the whole country (USSR)](https://doi.org/10.2307/1426167). *Advances in Applied Probability* (1971)
  - Rvachev & Longini. [A mathematical model for the global spread of influenza](https://doi.org/10.1016/0025-5564(85)90064-1). *Mathematical Biosciences* (1986)
  - Flahault, Letrait et al.[Modelling the 1985 influenza epidemic in France](https://doi.org/10.1002/sim.4780071107). *Statistics in Medicine* (1988)
- More and more frequent now, to the point that some modelling studies are purely simulation-based

---

<!-- _backgroundImage: "linear-gradient(to bottom, #f1c40f, 20%, white)" -->
# <!--fit-->Use of data in epidemiology

---

# <!-- fit -->Has happened all along, undergoind a transformation

- Epidemiology has long relied on data
- Many developments in statistics originate there
- Data has traditionally been better for chronic diseases than for infectious ones
- Near-real-time surveillance of infectious diseases ongoing since the 1980s (e.g., Réseau Sentinelles)
- SARS-CoV-1 saw the beginning of a move towards real-time emerging infectious disease data
- With SARS-CoV-2, the system has really progressed a lot, both in terms of "citizen science" and governmental initiatives