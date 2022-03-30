---
marp: true
title: Group models
description: 3MC Course Epidemiological Modelling - Julien Arino - Lecture 04 - Group models
theme: default
paginate: false
size: 4K
---

<style>
  .theorem {
    text-align:justify;
    background-color:#16a085;
    border-radius:20px;
    padding:10px 20px 10px 20px;
    box-shadow: 0px 1px 5px #999;
  }
  .definition {
    text-align:justify;
    background-color:#ededde;
    border-radius:20px;
    padding:10px 20px 10px 20px;
    box-shadow: 0px 1px 5px #999;
  }
</style>

# Lecture 04 - Group models

5 April 2022 

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
    - Age-structured models
    - Models incorporating social structure
    - Model with pathogen heterogeity
- Analysing group models
- Simulating group models

---

<!-- _backgroundImage: "linear-gradient(to bottom, #f1c40f, 20%, white)" -->
# <!--fit-->Formulating group models

---

# Limitations of single population ODE models

- As discussed in [Lecture 03](https://julien-arino.github.io/3MC-course-epidemiological-modelling/2022_04_3MC_EpiModelling_L03_SpreadInGroups_SpreadInSpace.html), basic ODE assume that all individuals in a compartment are roughly the same
- Individuals can spend differing times in a compartment (see [Lecture 09](https://julien-arino.github.io/3MC-course-epidemiological-modelling/2022_04_3MC_EpiModelling_L09_RecentMathematicalModels.html)), but they are all the same
- As we have seen with COVID-19, different age groups are impacted differently

---

# Groups can be used for many things

Groups allow to introduce structure in a population without using PDEs

- Age structure
- Social structure
- Pathogen heterogeneity
- Host heterogeneity (e.g., super spreaders)

In this lecture, we do not consider *spatial heterogeity*; this is done in [Lecture 05](https://julien-arino.github.io/3MC-course-epidemiological-modelling/2022_04_3MC_EpiModelling_L05_MetapopulationModels.html)

We start by considering a few examples

---

<!-- _backgroundImage: "linear-gradient(to bottom, #156C26, 20%, white)" -->
# Age-structured models

---

# First, a remark

In terms of modelling, ODEs are not the best way to incorporate structure such as age. We will come back to this in [Lecture 09](https://julien-arino.github.io/3MC-course-epidemiological-modelling/2022_04_3MC_EpiModelling_L09_RecentMathematicalModels.html), but give one example here

---

# <!--fit-->[A multi-group SIS model with age structure](https://doi.org/10.1016/j.jde.2004.10.009), by Feng, Huang & C$^3$

For $i=1,\ldots,n$ different subgroups
$$
\begin{align*}
\left(
\frac{\partial}{\partial t}+\frac{\partial}{\partial a}
\right)S_i
&= 
-\mu_i(a)S_i(t,a)-\Lambda_i(a,I(t,\cdot))S_i(t,a)+\gamma_i(a)I_i(t,a) \\
\left(
\frac{\partial}{\partial t}+\frac{\partial}{\partial a}
\right)I_i
&= 
-\mu_i(a)I_i(t,a)+\Lambda_i(a,I(t,\cdot))S_i(t,a)-\gamma_i(a)I_i(t,a)
\end{align*}
$$
where
$$
\Lambda_i(a,I(\cdot,t)):=K_i(a)I_i(a,t)+\sum_{j=1}^n
\int_0^\omega K_{ij}(a,s)I_j(s,t)\ ds
$$

---

with boundary and initial conditions, for $i=1,\ldots,n$

$$
\begin{align*}
S_i(t,0) &= \int_0^\omega b_i(a)[S_i(t,a)+(1-q_i)I_i(t,a)]\ da \\
I_i(t,0) &= q_i\int_0^\omega b_i(a)I_i(t,a)\ da,\quad 0<q_1<1 \\
S_i(0,a) &= \psi(a) \\
I_i(0,a) &= \varphi(a)
\end{align*}
$$
($q_i$ fraction of newborns that is infected)

Basic reproduction number in group $i=1,\ldots,n$
$$
\mathcal{R}_i = \int_0^\omega b_i(a)\exp\left(
-\int_0^a \mu_i(\tau)d\tau
\right)\ da
$$

---

- Authors obtain some results in terms of global stability
- Need simplifications to move forward
- No numerics, because numerics for such models are *hard*

---

# Going the ODE route

- ODEs are way less satisfactory but can be used as-is and are much easier numerically
- **Caveat -** ODE models with age structure are *intrinsically wrong*, since sojourn times in an age group is exponentially distributed instead of Dirac distributed! (See [Lecture 09](https://julien-arino.github.io/3MC-course-epidemiological-modelling/2022_04_3MC_EpiModelling_L09_RecentMathematicalModels.html))

---

<!-- _backgroundImage: "linear-gradient(to bottom, #156C26, 20%, white)" -->
# Models incorporating social structure

---

# TB in foreign-born population of Canada

Preventing tuberculosis in the foreign-born population of Canada: a mathematical modelling study.  Varughese, Langlois-Klassen, Long, & Li. [International Journal of Tuberculosis and Lung Disease](https://doi.org/10.5588/ijtld.13.0625) **18** (2014)

---

![bg contain](https://raw.githubusercontent.com/julien-arino/3MC-course-epidemiological-modelling/main/FIGS/VarugheseLangloisklassenLongLi-2014-TB-flow_diagram.png)

---

<!-- _backgroundImage: "linear-gradient(to bottom, #156C26, 20%, white)" -->
# Models with pathogen heterogeity

---

<!-- _backgroundImage: "linear-gradient(to bottom, #156C26, 20%, white)" -->
# Models with immunological component

Global dynamics of a general class of multistage models for infectious diseases. Guo, Li & Shuai. [SIAM Journal on Applied Mathematics](https://doi.org/10.1137/110827028) **72** (2012)

---

![bg contain](https://raw.githubusercontent.com/julien-arino/3MC-course-epidemiological-modelling/main/FIGS/GuoLiShuai-2012-multistage-flow_diagram.png)

---

<!-- _backgroundImage: "linear-gradient(to bottom, #f1c40f, 20%, white)" -->
# <!--fit-->Analysing group models

---

<!-- _backgroundImage: "linear-gradient(to bottom, #f1c40f, 20%, white)" -->
# <!--fit-->Simulating group models

