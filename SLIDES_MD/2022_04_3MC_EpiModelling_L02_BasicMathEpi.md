---
marp: true
title: Basic concepts of mathematical epidemiology. Models in one population and their basic properties
description: 3MC Course Epidemiological Modelling - Julien Arino - Course 02 - Basic concepts of mathematical epidemiology. Models in one population and their basic properties
theme: default
paginate: false
size: 4K
math: mathjax
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

# Basic concepts of mathematical epidemiology. Models in one population and their basic properties

4 April 2022 

Julien Arino [![width:32px](https://raw.githubusercontent.com/julien-arino/3MC-course-epidemiological-modelling/main/FIGS/email-round.png)](mailto:Julien.Arino@umanitoba.ca) [![width:32px](https://raw.githubusercontent.com/julien-arino/3MC-course-epidemiological-modelling/main/FIGS/world-wide-web.png)](https://julien-arino.github.io/) [![width:32px](https://raw.githubusercontent.com/julien-arino/3MC-course-epidemiological-modelling/main/FIGS/github-icon.png)](https://github.com/julien-arino)

Department of Mathematics & Data Science Nexus
University of Manitoba*

<div style = "font-size:18px; margin-top:-10px; padding-bottom:30px;"></div>

Canadian Centre for Disease Modelling
Canadian COVID-19 Mathematical Modelling Task Force
NSERC-PHAC EID Modelling Consortium (CANMOD, MfPH, OMNI/RÉUNIS)

<div style = "text-align: justify; position: relative; bottom: -5%; font-size:18px;">
* The University of Manitoba campuses are located on original lands of Anishinaabeg, Cree, Oji-Cree, Dakota and Dene peoples, and on the homeland of the Métis Nation.</div>

<style>
img[alt~="center"] {
  display: block;
  margin: 0 auto;
}
</style>

---

<!-- _backgroundImage: "radial-gradient(white,80%,#f1c40f)" -->
# Outline

- The (epidemic) Kermack and McKendrick SIR model
- SLIAR extension of the KMK model
- Incidence functions
- The (endemic) SIS model
- SLIRS model with constant population
- Effect of vaccination - Herd immunity
- SLIRS model - Global properties

---

# Foreword

- These slides contain much more material than is needed for the first course
- We will only cover some of that material
- Use the remaining slides to learn about aspects not explained *viva voce*

---

<!-- _backgroundImage: "linear-gradient(to bottom, #f1c40f, 20%, white)" -->
# <!--fit-->The (epidemic) Kermack and McKendrick SIR model

---

# This is a particular case!

K-MK formulated the model that follows in a much more general work

Really worth taking a look at this series of papers!
- Kermack & McKendrick. [A contribution to the mathematical theory of epidemics](https://doi.org/10.1098/rspa.1927.0118) (1927)

---

# <!--fit-->The underlying question - What is the *size* of an epidemic?

- Suppose we consider the occurrence of an epidemic peak
  - Does it always take place?
  - When it occurs, how bad is it?
  - If an epidemic moves through a population, is everyone infected?

---

# The SIR model without demography

- The time interval under consideration is sufficiently small that demography can be omitted (we say there is *no vital dynamics*)
- Individuals in the population can be susceptible ($S$) or infected and infectious with the disease ($I$). Upon recovery or death, they are *removed* from the infectious compartment ($R$)
- Incidence is mass action $\beta SI$

Consider the following model, usually called the Kermack-McKendrick model
$$
\begin{align}
S' &= -\beta SI \tag{1a}\label{sys:KMK_dS} \\
I' &= (\beta S-\gamma)I  \tag{1b}\label{sys:KMK_dI} \\
R' &= \gamma I  \tag{1c}\label{sys:KMK_dR}
\end{align}
$$

---

# Reducing the problem

3 compartments, but inspection shows that *removed* individuals do not influence the dynamics of $S$ or $I$

Furthermore, total population $N=S+I+R$ satisfies
$$
N'=(S+I+R)'=0
$$
so $N$ is constant and dynamics of $R$ can deduced from that of $R=N-(S+I)$

So now consider
$$
\begin{align}
S' &= -\beta SI \tag{2a}\\
I' &= (\beta S-\gamma)I  \tag{2b}
\end{align}
$$

---

# Equilibria


Consider the equilibia of
$$
\begin{align}
S' &= -\beta SI \tag{2a}\label{sys:KMK_2d_dS} \\
I' &= (\beta S-\gamma)I  \tag{2b}\label{sys:KMK_2d_dI}
\end{align}
$$

From $\eqref{sys:KMK_2d_dI}$
- either $\bar S=\gamma/\beta$
- or $\bar I=0$

Substitute into $\eqref{sys:KMK_2d_dS}$
- in the first case, $(\bar S,\bar I)=(\gamma/\beta,0)$
- in the second case, any $\bar S\geq 0$ is an equilibrium (*continuum* of EP)

Second case is a **problem**: usual linearisation does not work as EP are not isolated! (See [Practicum 02](https://julien-arino.github.io/3MC-course-epidemiological-modelling/2022_04_3MC_EpiModelling_P02_Analysis_LargeScaleModels.html))


---

# Workaround - Study $dI/dS$

What is the dynamics of $dI/dS$? We have
$$
\tag{3}\label{eq:KMK_dI_over_dS}
\frac{dI}{dS}
=\frac{dI}{dt}\frac{dt}{dS}
=\frac{I'}{S'}
=\frac{\beta SI-\gamma I}{-\beta SI}
=\frac{\gamma}{\beta S}-1
$$
provided $S\neq 0$

**Careful!** Remember that $S$ and $I$ are $S(t)$ and $I(t)$.. equation $\eqref{eq:KMK_dI_over_dS}$ thus describes the relationship between $S$ and $I$ along solutions to the original ODE $\eqref{sys:KMK_2d_dS}$-$\eqref{sys:KMK_2d_dI}$

---

We can integrate equation $\eqref{eq:KMK_dI_over_dS}$, giving trajectories in phase space
$$
I(S)=\frac\gamma\beta \ln S-S+C
$$
with $C\in\mathbb{R}$

The initial condition $I(S_0)=I_0$ gives $C=S_0+I_0-\frac \gamma\beta \ln S_0$, and the solution to $\eqref{sys:KMK_dS}$-$\eqref{sys:KMK_dR}$ is thus, as a function of $S$,
$$
\begin{align*}
I(S)&=S_0+I_0-S+\frac\gamma\beta \ln \frac S{S_0} \\
R(S)&=N-S-I(S)=R_0-\frac\gamma\beta \ln \frac S{S_0}
\end{align*}
$$

---

Trajectories in phase plane $(S,I)$ corresponding to IC $(S_0,1-S_0)$ and $\beta/\gamma=2.5$

![width:1200px center](https://raw.githubusercontent.com/julien-arino/3MC-course-epidemiological-modelling/main/FIGS/KMK_planar_trajectories.png)

---

# The basic reproduction number $\mathcal{R}_0$

Suppose total population $N$ is normalised, i.e., $N=1$. Then $R=1-(S+I)$

Define
$$
\begin{equation}\label{eq:R0_KMK}\tag{4}
\mathcal{R}_0=\frac{\beta}{\gamma}
\end{equation}
$$


---

<div align=justify 
style="background-color:#16a085;
border-radius:20px;
padding:10px 20px 10px 20px;
box-shadow: 0px 1px 5px #999;">

Let $(S(t),I(t))$ be a solution to $\eqref{sys:KMK_dS}$-$\eqref{sys:KMK_dR}$ in proportions and $\mathcal{R}_0$ be defined as in $\eqref{eq:R0_KMK}$. If $\mathcal{R}_0
S_0\leq 1$, then $I(t)$ tends to 0 when $t\to\infty.$ If $\mathcal{R}_0
S_0>1$, then $I(t)$ first reaches a maximum 
$$
1-\frac 1{\mathcal{R}_0}-\frac{\ln(\mathcal{R}_0 S_0)}{\mathcal{R}_0}
$$
then tends to 0 when $t\to\infty$

The proportion $S(t)$ of susceptibles is a nonincreasing function and its limit $S(\infty)$ is the unique solution in $(0,1/\mathcal{R}_0)$ of the equation 
$$
1-S(\infty)+\frac{\ln[S(\infty)/S_0]}{\mathcal{R}_0}=0
$$
</div>

---

<!-- _backgroundImage: "linear-gradient(to bottom, #f1c40f, 20%, white)" -->
# <!--fit-->SLIAR extension of the KMK model

---

# Extensions of the KMK model

Many many works (especially since COVID-19) have used KMK-type models

- Brauer. [The Kermack–McKendrick epidemic model revisited](https://doi.org/10.1016/j.mbs.2005.07.006) (2005)
- Arino, Brauer, PvdD, Watmough & Wu. [Simple models for containment of a pandemic](http://dx.doi.org/10.1098/rsif.2006.0112) (2006), which we'll look into now
- Arino & Portet. [A simple model for COVID-19](http://dx.doi.org/10.1016/j.idm.2020.04.002) (2020)

---

# An extension of KMK - SLIAR models

SIR is a little too simple for many diseases:

- No incubation period
- A lot of infectious diseases (in particular respiratory) have mild and less mild forms depending on the patient

$\implies$ model with SIR but also L(atent) and (A)symptomatic individuals, in which I are now symptomatic individuals

Arino, Brauer, PvdD, Watmough & Wu. [Simple models for containment of a pandemic](http://dx.doi.org/10.1098/rsif.2006.0112) (2006)

---

![width:1200px center](https://raw.githubusercontent.com/julien-arino/3MC-course-epidemiological-modelling/main/FIGS/SLIAR.png)

---

## Basic reproduction number
$$
\tag{5}
\mathcal{R}_0=S_0\beta
\left(
\frac{p}{\alpha}+\frac{\delta(1-p)}{\eta}
\right)
=\frac{S_0\beta\rho}{\alpha}
$$
where 
$$
\rho = \alpha
\left(
\frac{p}{\alpha}+\frac{\delta(1-p)}{\eta}
\right)
$$

## Final size relation

$$\tag{6}
S_0(\ln S_0-\ln S_\infty) =
\mathcal{R}_0(S_0-S_\infty)+\frac{\mathcal{R}_0I_0}{\rho}
$$

---

<!-- _backgroundImage: "linear-gradient(to bottom, #f1c40f, 20%, white)" -->
# <!--fit-->Incidence functions

---

Before proceeding further, worth spending some time discussing **incidence functions**, which describe how contacts between individuals take place and lead to new cases

See in particular McCallum, Barlow & Hone, [How should pathogen transmission be modelled?](https://doi.org/10.1016/S0169-5347(01)02144-9), Trends in Ecology & Evolution **16** (2001)

---

# <!--fit-->Remark - Incidence function versus force of infection

Two different forms for the rate of movement of $S$ individuals from $S$ to whatever infected compartment they end up in:

- $S'=-f(S,I,N)$ is an **incidence function**
- $S'=-\lambda(S,I,N)S$ is a **force of infection**

The two are of course essentially equivalent, the context tends to drive the form used. Advanced PDE models that consider for instance an age-of-infection structure need to integrate over $I(t,a)$ and thus often use force of infection, others are somewhat random..

---

# Interactions - Infection

- Rate at which new cases appear per unit time is the *incidence function*
$$
\tag{7}
f(S,I,N)
$$
- Depends of the number $S$ of susceptible individuals, $I$ of infectious individuals and, sometimes, of the total population $N$
- Incidence includes two main components:
  - a denumeration of the number of contacts taking place
  - a description of the probability that such a contact, when it takes place, results in the transmission of the pathogen
- Choosing an appropriate function is hard and probably one of the flunkiest part of epidemic modelling

---

# Two most frequently used functions

The two most frequently used incidence functions are  **mass action incidence**
$$\tag{8}
f(S,I)=\beta SI
$$
and **standard** (or **proportional**) **incidence**
$$\tag{9}
f(S,I)=\beta\frac{SI}{S+I}
$$

In both cases, $\beta$ is the *disease transmission coefficient*

---

# Units of $\beta$

Recall that if $X(t)$ is the population in compartment $X$ at time $t$, then $X'$ has units $\text{number}/\text{time}$

In a differential equation, left and right hand side must have same units, so..

### Mass action incidence

$$
\beta SI \propto 
\beta\times\text{number}\times\text{number}
$$
has units number/time if $\beta$ has units $1/(\text{number}\times\text{time})$

### Standard incidence

$$
\beta SI/N \propto 
\beta\times\text{number}\times\text{number}/\text{number} \propto \beta \text{number}
$$
has units number/time if $\beta$ has units $1/\text{time}$

---

# Mass action incidence

$$
\begin{equation}
\tag{8}\label{eq:incidence_mass_action}
f(S,I)=\beta SI
\end{equation}
 $$

- There is homogenous mixing of susceptible and infectious individuals 
- Strong hypothesis: each individual potentially meets every other individual

In this case, one of the most widely accepted interpretations is that all susceptible individuals can come across all infectious individuals (hence the name, by analogy with gas dynamics in chemistry/physics) 

When population is large, the hypothesis becomes unrealistic

---

# Standard (proportional) incidence 

The other form used frequently:
$$
\begin{equation}
\tag{9}\label{eq:incidence_proportional}
f(S,I,N)=\beta\frac{SI}{N}
\end{equation}
$$

Each susceptible individual meets a fraction of the infectious individuals

Or vice-versa! See, e.g., Hethcote, [Qualitative analyses of communicable disease models](https://doi-org.uml.idm.oclc.org/10.1016/0025-5564(76)90132-2), *Mathematical Biosciences* (1976)

Case of a larger population

---

# Constant population $\implies$ $\eqref{eq:incidence_mass_action}$ $\equiv$ $\eqref{eq:incidence_proportional}$

When the total population is constant, a lot of incidence function are equivalent (to units)

Suppose $N(t)\equiv N_0$, then
$$
\beta SI = \tilde\beta\frac{SI}{N}
\iff \tilde\beta=N_0\beta
$$
and if the right hand side is satisfied, then $\eqref{eq:incidence_mass_action}$ and $\eqref{eq:incidence_proportional}$ identical

Keep in mind units are different, though

---

# General incidence

$$
\tag{10}
f(S,I,N)=\beta S^q I^p
$$
These functions were introduced with data fitting in mind: fitting to data, find the $p,q$ best matching the available data

---

# Incidence with refuge

The following implements a refuge effect; it assumes that a proportion $0<q<1$ of the population is truly susceptible, because of, e.g., spatial heterogenities

$$
\tag{11}
f(S,I,N)=
\begin{cases}
\beta I\left(N-\dfrac Iq\right),&\textrm{si }I<qN \\
0,&\textrm{si }I\geq qN
\end{cases}
\qquad\qquad
$$


---

# Negative binomial incidence

$$
\tag{12}
f(S,I,N)=kS\ln\left(1+\beta\frac Ik\right)
$$
For small values of $k$, this function describes a very concentrated infection process, while when $k\to\infty$, this function reduces to a mass action incidence

---

# Asymptotic contact

$$
\tag{13}
f(S,I,N)
=\frac{N}{1-\varepsilon+\varepsilon N}
\frac{F(S,I)}{N}
$$
where $F$ is one of the functions we just described

When $\varepsilon=0$, contacts are proportionnal to $N$, whereas when $\varepsilon=1$, contacts are independent from $N$

---

# Asymptomatic transmission

$$
\tag{14}
f(S,I,N)
=\beta\frac{SI}{c+S+I}
$$
where $c$ is a constant. E.g., 
$$
\frac{C(N)}N F(S,I)
$$
with $C(N)=N/(1-\varepsilon+\varepsilon N)$ the function describing the contact rate and $F(S,I)$ the function describing disease spread, assumed here to be of negative binomial incidence-type

---

# Switching incidence

Arino & McCluskey, [Effect of a sharp change of the incidence function on the dynamics of a simple disease](https://doi.org/10.1080/17513751003793017), *Journal of Biological Dynamics* (2010)

Scale population so switch occurs at $N=1$ and suppose
$$
\tag{15}
F(S,I,N) = 
\begin{cases}
\beta SI & \textrm{if }N\leq 1 \\
\beta \dfrac{SI}{N} & \textrm{if }N> 1
\end{cases}
$$

---

<!-- _backgroundImage: "linear-gradient(to bottom, #f1c40f, 20%, white)" -->
# <!--fit--> The (endemic) SIS model

---
 
- Consider a closed population
- Assume individuals in the population can be in one of two states:
  - *susceptible* (to the disease) if they are not currently harbouring the pathogen 
  - *infectious* (and *infected*) if they have contracted the disease and are actively spreading it

$\implies$ there are two compartments and the aim of modelling is to describe evolution of numbers in each compartment

--- 
 
- $S(t)$ the number of susceptibles at time $t$
- $I(t)$ the number of infectious/infected at time $t$
- $N(t)=S(t)+I(t)$ the total population total

The following hypotheses describea disease for which the incubation period is short or even non-existent

We also assume infection has limited duration for each individual

---

# Type of compartments

## Susceptible individuals

- Are born at a *per capita* rate $d$ proportional to the total population $N$
- Die at the *per capita* rate $d$, proportional to the susceptible population $S$
- Newborns are susceptible (*vertical transmission* is ignored)

## Infected and infectious individuals

- Die at the *per capita* rate $d$, proportional to the infected/infectious population $I$
- Recover at the *per capita* rate $\gamma$
- We do not take into account disease-induced death

---

# Model flow diagram

![width:1000px center](https://raw.githubusercontent.com/julien-arino/3MC-course-epidemiological-modelling/main/FIGS/figure_SIS_base_prop_incidence_birthdN.png)

---

# The model

Using standard incidence 
$$
\begin{align}
S' &= \underbrace{bN}_\textrm{birth}
-\underbrace{dS}_\textrm{death} 
-\underbrace{\beta\frac{SI}{N}}_\textrm{infection}
+\underbrace{\gamma I}_\textrm{recovery}
\tag{16a}\label{sys:SIS_base_dS}\\
I' &= \underbrace{\beta\frac{SI}{N}}_\textrm{infection}
-\underbrace{dI}_\textrm{death} 
-\underbrace{\gamma I}_\textrm{recovery} 
\tag{16b}\label{sys:SIS_base_dI}
\end{align}
$$

Consider the initial value problem (IVP) consisting of this system together with the initial conditions $S(0)=S_0\geq 0$ and $I(0)=I_0\geq 0$

---

# Remarks
 
- In what follows, assume $b=d$ to keep population constant
- $\eqref{sys:SIS_base_dS}$-$\eqref{sys:SIS_base_dI}$ is an SIS (Susceptible-Infectious-Susceptible) model
- If $\gamma=0$ (no recovery), then model is SI
  - In this case, infected individual remains infected their whole life (but disease is not lethal since there is no disease-induced death)
- Diseases with these types of characteristics are bacterial diseases such as those caused by *staphylococcus aureus*, *streptococcus pyogenes*, *chlamydia pneumoniae* or *neisseria gonorrhoeae*

---

# Birth and death are *relative*

Remark that the notions of *birth* and *death* are relative to the population under consideration

E.g., consider a model for human immunodeficiency virus (HIV) in an at-risk population of intravenous drug users. Then 
- birth is the moment the at-risk behaviour starts
- death is the moment the at-risk behaviour stops,  whether from "real death" or because the individual stops using drugs



---

# Analysis of the system

System $\eqref{sys:SIS_base_dS}$-$\eqref{sys:SIS_base_dI}$ is planar nonlinear 

Typically, we would use standard planar analysis techniques

However, here we can find an explicit solution

**NB:** while this is useful illustration, this is a rare exception!!

---

# Dynamics of $N$

We have
$$
\begin{align*}
N' &= (S+N)' \\
&= dN-dS\beta\frac{SI}{N}
+\gamma I+\beta\frac{SI}{N}-dI-\gamma I \\
&= dN-d(S+I) \\
&=0
\end{align*} 
$$
As a consequence, for all $t$, $N(t)\equiv N_0:=S_0+I_0$

---

# Proportions

$$
s=\frac{S}{N}\quad\quad i=\frac{I}{N}
$$
Remark that $s+i=(S+I)/N=1$. The derivative of $i$ is
$$
i' = \frac{I'N-IN'}{N^2}=\frac{I'}{N}-\frac{iN'}{N}
$$
Since $N'=0$, 
$$
i'=\frac{I'}{N}
$$
Substite the right hand term of \eqref{sysI} in this equation given
$$
i'=\beta\frac{SI}{N^2}-d\frac{I}{N}-\gamma\frac{I}{N}=\beta si-(d+\gamma)i
$$

---

# The system in proportions

Since $s+i=1$, we can use $s=1-i$ in the latter equation, giving $i'=\beta(1-i)i-(d+\gamma)i$. As a consequence, the *system in proportion* is
$$
\begin{align}
s &= 1-i \tag{17a}\label{sys:SIS_proportion_ds} \\
i' &= \beta(1-i)i-(d+\gamma)i 
\tag{17b}\label{sys:SIS_proportion_di}
\end{align}
$$

Since $N$ constant, solutions of $\eqref{sys:SIS_base_dS}$-$\eqref{sys:SIS_base_dI}$ are deduced directly from those of $\eqref{sys:SIS_proportion_ds}$-$\eqref{sys:SIS_proportion_di}$ and we now consider $\eqref{sys:SIS_proportion_ds}$-$\eqref{sys:SIS_proportion_di}$

---

Rewrite $\eqref{sys:SIS_proportion_di}$ as
$$
\begin{equation} 
\tag{18}\label{eq:SIS_i_as_Bernoulli}
i'-(\beta-(d+\gamma))i=-\beta i^2
\end{equation}
$$
This is a Bernoulli equation and the change of variables $u=i^{-1}$ gives the linear equation
$$
-u'-(\beta-(d+\gamma))u=-\beta
$$
so that finally
$$
\begin{equation}
\tag{19}\label{eq:SIS_true_Bernoulli}
u'+(\beta-(d+\gamma))u=\beta
\end{equation}
$$

---

An integrating factor is 
$$
\mu(t)=\exp\left(\int P(t)dt\right)=e^{(\beta-(d+\gamma))t}
$$
and thus
$$
\mu(t)u=\frac{\beta}{\beta-(d+\gamma)}e^{(\beta-(d+\gamma))t}+C
$$
for $C\in\mathbb{R}$, so finally
$$
u=\frac{\beta}{\beta-(d+\gamma)}+Ce^{-(\beta-(d+\gamma))t}
$$

---

The initial condition $i_0=I_0/N$ takes the form $u(0)=1/i_0$. Thus,
$$
u(0)=\frac{1}{i_0}=\frac{\beta}{\beta-(d+\gamma)}+C
$$
which implies that
$$
C=\frac{\beta-(d+\gamma)-i_0\beta}{i_0(\beta-(d+\gamma))}
$$

---

As a consequence, the solution to the linear equation $\eqref{eq:SIS_true_Bernoulli}$ is
$$
\begin{aligned}
u &= \frac{i_0\beta+(\beta-(d+\gamma)-i_0\beta)e^{-(\beta-(d+\gamma))t}}
{i_0(\beta-(d+\gamma))} \\
&= \frac{i_0\beta(1-e^{-(\beta-(d+\gamma))t})
  +(\beta-(d+\gamma))e^{-(\beta-(d+\gamma))t}}{i_0(\beta-(d+\gamma))}
\end{aligned}
$$
and that of $\eqref{eq:SIS_i_as_Bernoulli}$ is
$$
i(t)=\frac{i_0(\beta-(d+\gamma))}{i_0\beta(1-e^{-(\beta-(d+\gamma))t})
  +(\beta-(d+\gamma))e^{-(\beta-(d+\gamma))t}}
$$

---

In summary, the solution to the system in proportions is given by
$$
s(t)=1-\frac{i_0(\beta-(d+\gamma))}{i_0\beta(1-e^{-(\beta-(d+\gamma))t})
  +(\beta-(d+\gamma))e^{-(\beta-(d+\gamma))t}}
$$
and
$$
i(t)=\frac{i_0(\beta-(d+\gamma))}{i_0\beta(1-e^{-(\beta-(d+\gamma))t})
  +(\beta-(d+\gamma))e^{-(\beta-(d+\gamma))t}}
$$

---

From these solutions, there are two cases: 
 
- If $\beta-(d+\gamma)<0$, then $\lim_{t\to\infty}e^{-(\beta-(d+\gamma))t}=+\infty$, so $\lim_{t\to\infty}s(t)=1$ and $\lim_{t\to\infty}i(t)=0$
- If $\beta-(d+\gamma)>0$, then $\lim_{t\to\infty}e^{-(\beta-(d+\gamma))t}=0$; thus, $\lim_{t\to\infty}s(t)=1-(\beta-(d+\gamma))/\beta$ and $\lim_{t\to\infty}i(t)=(\beta-(d+\gamma))/\beta$



---

# The basic reproduction number $\mathcal{R}_0$

Reformulate in epidemiological terms, using the *basic reproduction number*,
$$
\mathcal{R}_0=\frac{\beta}{d+\gamma}
$$
We have the following equivalencies
$$
\begin{gathered}
\mathcal{R}_0< 1 \Leftrightarrow \beta-(d+\gamma)< 0 \\
\mathcal{R}_0>1 \Leftrightarrow \beta-(d+\gamma)>0
\end{gathered}
$$
Also,
$$
\frac{\beta-(d+\gamma)}{\beta}=1-\frac{1}{\mathcal{R}_0}
$$

---

We have proved the following result

<div class="theorem">

For system $\eqref{sys:SIS_base_dS}$-$\eqref{sys:SIS_base_dI}$, the following alternative holds
 
- If $\mathcal{R}_0< 1$, then
  - $\lim_{t\to\infty}s(t)=1$
  - $\lim_{t\to\infty}i(t)=0$, the disease **goes extinct**
- If $\mathcal{R}_0>1$, then
  - $\lim_{t\to\infty}s(t)={1}/{\mathcal{R}_0}$
  - $\lim_{t\to\infty}i(t)=1-1/{\mathcal{R}_0}$, the disease becomes **endemic**
</div>

---
 
 # Further remarks about $\mathcal{R}_0$

- $\mathcal{R}_0$ determines the propensity of a disease to become established in a population
- The aim of control policies is therefore to reduce $\mathcal{R}_0$ to values less than 1
- The "verbal" definition of $\mathcal{R}_0$ is *the average number of secondary infections produced by the introduction of an infectious individual in a completely naive population 
- Remark that for our basic model, $1/(d+\gamma)$ is the average time of sojourn in the $I$ compartment before death or recovery and $\beta$ is the probability of infection 

---

# Case $\mathcal{R}_0>1$

Remark that the higher $\mathcal{R}_0$, the higher the proportion of infectious individuals in the population

Thus, $\mathcal{R}_0$ is also an indicator of the infectiousness of a pathogen

![width:550px center](https://raw.githubusercontent.com/julien-arino/3MC-course-epidemiological-modelling/main/FIGS/R0.png)

---

# Some values of $\mathcal{R}_0$ (estimated from data)
| Infection | Place | Period | $\mathcal{R}_0$ |
|:---|:---|:---|:---|
| Measles | Cirencester, England | 1947-50 | 13-14 |
|| England & Wales | 1950-68 | 16-18 |
|| Kansas, USA | 1918-21 | 5-6 |
|| Ontario, Canada | 1912-3 | 11-12 |
|| Willesden, England | 1912-3 | 11-12 |
|| Ghana | 1960-8 | 14-15 |
|| East Nigeria | 1960-8 | 16-17 |

---

# Classic way to compute $\mathcal{R}_0$
Take SIS $\eqref{sys:SIS_base_dS}$-$\eqref{sys:SIS_base_dI}$ normalised to $N=1$ 
$$
\begin{align*}
S' &= d-dS-\beta SI+\gamma I \\
I' &= \beta SI-(d+\gamma)I 
\end{align*}
$$
DFE: $(\bar S,\bar I)=(1,0)$
$$
J_{DFE}=\begin{pmatrix}
-d & \gamma-\beta\bar S \\
\beta\bar I & \beta\bar S-(d+\gamma)
\end{pmatrix}
=
\begin{pmatrix}
-d & \gamma-\beta \\
0 & \beta-(d+\gamma)
\end{pmatrix}
$$
When eigenvalues $-d$ and $\beta-(d+\gamma)$
$\Rightarrow$
LAS of the DFE is determined by the sign of $\beta-(d+\gamma)$. We find the same $\mathcal{R}_0$ we had found before

---

# A more efficient way to $\mathcal{R}_0$: next generation matrix

Diekmann and Heesterbeek, characterised in ODE case by PvdD & Watmough (2002)

Consider only compartments $x$ with *infected individuals* and write
$$
x'=\mathcal{F}-\mathcal{V}
$$
 
- $\mathcal{F}$ flows within infected compartments
- $\mathcal{V}$ other flows (with $-$ sign)

Compute the (Frechet) derivatives $F=D\mathcal{F}$ and $V=D\mathcal{V}$ with respect to the infected variables $x$ and evaluate at the DFE

Then
$$
\mathcal{R}_0=\rho(FV^{-1})
$$
where $\rho$ is the spectral radius


---

# The main result of PvdD and Watmough (2002)

<div class="theorem">

Suppose the DFE exists. Let then
$$
\mathcal{R}_0=\rho(FV^{-1})
$$
with matrices $F$ and $V$ obtained as indicated. Assume conditions (A1) through (A5) hold. Then
- if $\mathcal{R}_0<1$, then the DFE is LAS
- if $\mathcal{R}_0>1$, the DFE is unstable
</div>

(We make conditions (A1)-(A5) explicit in [Practicum 02](2022_04_3MC_EpiModelling_P02_Analysis_LargeScaleModels.html) and discuss why it can be important to check they do hold true in [Lecture 09](https://julien-arino.github.io/3MC-course-epidemiological-modelling/2022_04_3MC_EpiModelling_L09_RecentMathematicalModels.html))

---

# Summary thus far
- An SIR *epidemic* model (the KMK SIR) in which the presence or absence of an epidemic wave is characterised by the value of $\mathcal{R}_0$
- An SLIAR *epidemic* model extending the KMK SIR
- An SIS *endemic* model in which the threshold $\mathcal{R}_0=1$ is such that when $\mathcal{R}_0<1$, the disease goes extinct, whereas when $\mathcal{R}_0>1$, the disease becomes established in the population
- Both the KMK SIR and the SIS are integrable in some sense. **This is an exception!!!**


---

<!-- _backgroundImage: "linear-gradient(to bottom, #f1c40f, 20%, white)" -->
# <!--fit-->SLIRS model with constant population

---

# Incubation time

- SIS and SIR: instantaneous progression from  S to I
- Some incubation periods (time from infection to symptoms - often matches beginning of infectiousness):

| Disease | Incubation |
|:----|:----|
| Yersinia Pestis | 2-6 days |
| Ebola hemorragic fever (HF) | 2-21 days |
| Marburg HF | 5-10 days |
| Lassa HF | 1-3 weeks |
| Tse-tse | weeks, months |
| HIV/AIDS | months, years |

---

# Hypotheses

- Suppose there is demography. New individuals are born at a rate proportional to the total population
- Disease is not transmitted to newborns (no *vertical transmission*): all births are to the S compartment
- Disease does not cause additional mortality
- New infections occur at the rate $f(S,I,N)$
- There is an incubation period
- After recovery, individuals are immune to the disease for some time

---

# SLIRS model

The model takes the form
$$
\begin{align}
S' &= d(N-S)-f(S,I,N)+\nu R
\tag{20a}\label{sys:SLIR_dS}\\
L' &= f(S,I,N) -(d+\varepsilon)L 
\tag{20b}\label{sys:SLIR_dL} \\
I' &= \varepsilon L -(d+\gamma)I 
\tag{20c}\label{sys:SLIR_dI} \\
R' &= \gamma I-(d+\nu)R 
\tag{20d}\label{sys:SLIR_dR}
\end{align}
$$

- $1/\varepsilon$ average duration of the incubation period

- $1/\gamma$ average time until recovery

- $1/\nu$ average duration of immunity

---

<!-- _backgroundImage: "linear-gradient(to bottom, #156C26, 20%, white)" -->
# Classic computation of $\mathcal{R}_0$

---

# The basic reproduction number $\mathcal{R}_0$

Indicator often used in epidemiology. Verbally

> average number of new cases generated when an infectious individual is introduced in a completely susceptible population
 
- If $\mathcal{R}_0<1$, then each infectious individual infects on average less than 1 person and the epidemic is quite likely to go extinct
- If $\mathcal{R}_0>1$, then each infectious individual infects on average more than 1 person and an epidemic is quite likely to occur


---

# Computation of $\mathcal{R}_0$

Mathematically

> bifurcation parameter aggregating system parameters, such that the DFE loses it *local* asymptotic stability as $\mathcal{R}_0$ crosses 1 from left to right

- Obtained by considering the linearisation of the system at the DFE
- Quickly becomes unmanageable (matrix size) and we get a non unique form

---

<!-- _backgroundImage: "linear-gradient(to bottom, #156C26, 20%, white)" -->
# Computation of $\mathcal{R}_0$ using the next generation matrix method

---

# Example of the SLIRS model

Variations of the infected variables described by
$$
\begin{align*}
L' &= f(S,I,N)-(\varepsilon+d) L \\
I' &= \varepsilon L -(d+\gamma) I
\end{align*}
$$
Thus
$$
\left(
\begin{matrix}
L \\
I
\end{matrix}
\right)'
=\left(
\begin{matrix}
f(S,I,N) \\
0
\end{matrix}
\right)
-
\left(
\begin{matrix}
(\varepsilon+d) L \\
(d+\gamma) I-\varepsilon L
\end{matrix}
\right)=\mathcal{F}-\mathcal{V}
$$

---

Then compute the Jacobian matrices of vectors $\mathcal{F}$ and $\mathcal{V}$
$$
F=\left(
\begin{matrix}
\dfrac{\partial\overline{f}}{\partial L}
& \dfrac{\partial\overline{f}}{\partial I} \\
0 & 0
\end{matrix}
\right),\quad
V=\left(
\begin{matrix}
\varepsilon+d & 0 \\
-\varepsilon & d+\gamma
\end{matrix}
\right)
$$
where
$$
\dfrac{\partial\overline{f}}{\partial I}:=
\dfrac{\partial f}{\partial I}(\bar
S,\bar I,\bar N)\quad\quad 
\dfrac{\partial\overline{f}}{\partial L}:=
\dfrac{\partial f}{\partial L}(\bar
S,\bar I,\bar N)
$$

---

We have
$$
V^{-1}=\frac{1}{(d+\varepsilon)(d+\gamma)}
\left(
\begin{matrix}
d+\gamma & 0 \\
\varepsilon & d+\varepsilon
\end{matrix}
\right)
$$

Also, when $N$ constant, $\partial f/\partial
L=0$, then
$$
FV^{-1}=\frac{{\partial\overline{f}}/{\partial I}}
{(d+\varepsilon)(d+\gamma)}
\left(
\begin{matrix}
\varepsilon 
& d+\varepsilon  \\
0 & 0
\end{matrix}
\right)
$$
and thus,
$$
\mathcal{R}_0=\varepsilon
\frac{{\partial\overline{f}}/{\partial I}}
{(d+\varepsilon)(d+\gamma)}
$$

---

<div class="theorem">

Let
$$
\mathcal{R}_0=
\dfrac{\varepsilon\dfrac{\partial\overline{f}}{\partial I}}
{(d+\varepsilon)(d+\gamma)}
$$

Then 
- if $\mathcal{R}_0<1$, the DFE is LAS
- if $\mathcal{R}_0>1$, the DFE is unstable
</div>

Important to stress *local* nature of stability that is deduced from this result. We will see later that even when $\mathcal{R}_0<1$, there can be several positive equilibria

---

# Application

The DFE takes the form
$$
(\bar S,\bar L,\bar I,\bar R)=(N,0,0,0)
$$
 
- Frequency-dependent contacts (mass action incidence)
$$
\frac{\partial\overline{f}}{\partial I}=\beta\bar S \Rightarrow\mathcal{R}_0 =
\frac{\varepsilon\beta N}{(\varepsilon+d)(\gamma+d)} 
$$
- Proportion-dependent contacts (standard incidence)
$$
\frac{\partial\overline{f}}{\partial I}=\frac{\beta\bar S}{N}
\Rightarrow\mathcal{R}_0 = \frac{\varepsilon\beta}{(\varepsilon+d)(\gamma+d)}
$$

---

# Remark

Method shown here is easily applied to more complex models

We will see some cases later

---

# Links between model types

<style scoped>
@import url('https://unpkg.com/tailwindcss@^2/dist/utilities.min.css');
</style>
<div class="grid grid-cols-2 gap-4">
<div>

$$
\begin{align*}
S'&=d(1-S)-f(S,I)+\nu R \\
L'&=f(S,I)-(d+\varepsilon) L \\
I'&=\varepsilon L-(d+\gamma)I \\
R'&=\gamma I-(d+\nu)R
\end{align*}
$$
</div>

<div>

- SLIR is SLIRS where $\nu=0$
- SLIS limit of an SLIRS when $\nu\to\infty$
- SLI is SLIR where $\gamma=0$
- SIRS limit of an SLIRS when $\varepsilon\to\infty$
- SIR is SIRS where $\nu=0$
- SIS limit of an SIRS when $\nu\to\infty$
- SIS limit of an SLIS when $\varepsilon\to\infty$
- SI is SIS where $\nu=0$ 
</div>

---

# Expressions of $\mathcal{R}_0$

$(\bar S,\bar I)$ the DFE, denote $\overline{f}_I=\partial f/\partial I(\bar S,\bar I)$

| Model | $\mathcal{R}_0$ | Model | $\mathcal{R}_0$ | Model | $\mathcal{R}_0$ |
|:---|:---:|:---|:---:|:---|:---:|
| SLIRS | $\dfrac{\varepsilon\overline{f}_I}{(d+\varepsilon)(d+\gamma)}$ | SIRS | $\dfrac{\varepsilon\overline{f}_I}{d+\gamma}$ | SIS | $\dfrac{\overline{f}_I}{d+\gamma}$ |
| SIR | $\dfrac{\overline{f}_I}{d+\gamma}$ | SLIS | $\dfrac{\varepsilon\overline{f}_I}{(d+\varepsilon)(d+\gamma)}$ | SI | $\dfrac{\overline{f}_I}{d+\gamma}$ | 
| SLI | $\dfrac{\varepsilon\overline{f}_I}{(d+\varepsilon)(d+\gamma)}$ | SLIR | $\dfrac{\varepsilon\overline{f}_I}{(d+\varepsilon)(d+\gamma)}$ | 

---

<!-- _backgroundImage: "linear-gradient(to bottom, #f1c40f, 20%, white)" -->
# <!--fit-->Effect of vaccination - Herd immunity

---

Take the simple case of an SIR model but assume the following
- Vaccination takes susceptible individuals and moves them directly into the recovered compartment, without them ever becoming infected/infectious
- A fraction $p$ is vaccinated at birth
- $f(S,I,N)=\beta SI$

$$
\begin{align}
S' &= d((1-p)N-S)-\beta SI \tag{21a} \\
I' &= \beta SI -(d+\gamma)I \tag{21b} \\
R' &= dpN+\gamma I-dR \tag{21c}
\end{align}
$$

---

# Computation of $\mathcal{R}_0$
 
- DFE, SIR: 
$$
(\bar S,\bar I,\bar R)=(N,0,0)
$$
- DFE, SIR with vaccination
$$
(\bar S,\bar I,\bar R)=
\left((1-p)N,0,pN\right)
$$

Thus,
- In SIR case
$$
\mathcal{R}_0=\frac{\beta N}{d+\gamma}
$$
- In SIR with vaccination case, denote $\mathcal{R}_0^\textrm{v}$ and
$$
\mathcal{R}_0^\textrm{v}=(1-p)\mathcal{R}_0
$$

---

# Herd immunity

Therefore 
- $\mathcal{R}_0^\textrm{v}<\mathcal{R}_0$ if $p>0$
- To control the disease, $\mathcal{R}_0^\text{v}$ must take a value less than 1, i.e.,
$$
\tag{22}
\mathcal{R}_0^\text{v}<1 \iff p> 1-\frac{1}{\mathcal{R}_0}
$$

By vaccinating a fraction $p>1-1/\mathcal{R}_0$ of newborns, we thus are in a situation where the disease is eventually eradicated

This is *herd immunity*

---

<!-- _backgroundImage: "linear-gradient(to bottom, #f1c40f, 20%, white)" -->
# <!--fit-->SLIRS model - Global properties

---

- As already mentioned, global stability properties are important in a mathematical context, less so in public health
- Understanding that a DFE or an EEP are GAS is however important: this precludes the existence of other types of behaviours

---

# SEIRS - Mukherjee, Chattopadhyay & Tapaswi

SEIRS with constant birth rate $d$, *per capita* death rate $d$ and incidence function
$$
f(S,I,N)=\beta S^q I^p
$$

After establishing uniform boundedness of the system, they define 
$$
V(S,E,I)=\frac 12\left(
(S-S^\star )^2+(E-E^\star )^2+(I-I^\star )^2\right)
$$

<div style = "text-align: justify; position: relative; bottom: -25%; font-size:18px;">

Mukherjee, Chattopadhyay & Tapaswi. [Global stability results of epidemiological models with nonlinear incidence rates](https://doi.org/10.1016/0895-7177(93)90009-N). *Mathematical and Computer Modelling* **18** (1993)
</div>

---

Defining matrix
$$
A=\left(
\begin{array}{ccc}
\beta I^{*p}g(S)+d+\nu & \frac 12 (\nu-\beta I^{*p}g(S)) & \frac 12
(\beta S^q h(I)+\nu) \\
\frac 12(\nu-\beta I^{*p}g(S) & \varepsilon+d & -\frac 12 (\beta S^q
h(I)+\varepsilon) \\
\frac 12 (\beta S^q h(I)+\nu) & -\frac 12(\beta S^qh(I)+\varepsilon) &
\gamma+d
\end{array}
\right)
$$
with functions $g$ and $h$ s.t.
$$
S^q-S^{*q}=(S-S^\star )g(S),\quad I^p-I^{*p}=(I-I^\star )h(I)
$$
they obtain the following result

<div class="theorem">

Function $V$ is s.t. $V'<0$ if
- $4(\beta I^{*p}g(S)+d+\nu)(\varepsilon+d)>(\nu-\beta I^{*p}g(S))^2$
- $\det A>0$
</div>

Clearly, this is hard to use in practice so the system was studied in other ways

---

# [Li & Muldowney (1995)](https://doi.org/10.1016/0025-5564(95)92756-5)

$$
\begin{align}
S' &= d-\beta S^qI^p-dS 
\tag{23a}\label{sys:SLIR_LiMuldowney_dS} \\
L' &= \beta S^qI^p -(\varepsilon+d)L
\tag{23b}\label{sys:SLIR_LiMuldowney_dL} \\
I' &= \varepsilon L-(\gamma+d)I 
\tag{23c}\label{sys:SLIR_LiMuldowney_dI} \\
R' &= \gamma I-dR
\tag{23d}\label{sys:SLIR_LiMuldowney_dR} 
\end{align}
$$

<div style = "text-align: justify; position: relative; bottom: -25%; font-size:18px;">

Li & Muldowney. [Global stability for the SEIR model in epidemiology](https://doi.org/10.1016/0895-7177(93)90009-N). *Mathematical Biosciences* **125** (1995)
</div>

---

# Li, Muldowney & PvdD - CAMQ (1999)

SEIRS with incidence
$$
f(S,I,N)=\beta g(I)S
$$
where $g$ is s.t. $g(0)=0$, $g(I)>0$ for $I\in(0,1]$ and $g\in
C^1(0,1]$

They normalise the total population, so $S+E+I+R=1$. They make an additional hypothesis about $g$:

- **(H)** $c=\lim_{I\to 0^+} \frac{g(I)}{I}\leq +\infty$; when $0<c<+\infty$, $g(I)\leq cI$ for sufficiently small $I$

<div style = "text-align: justify; position: relative; bottom: -15%; font-size:18px;">

Li, Muldowney & van den Driessche. [Global stability of SEIRS models in epidemiology](https://www.researchgate.net/publication/265334017_Global_stability_of_SEIRS_models_in_epidemiology). *CAMQ* **7** (1999)
</div>

---

We have
$$
\frac{\partial\overline{f}}{\partial I}=\beta\frac{\partial\overline{g}}{\partial I}
$$
Since $\dfrac{\partial\overline{g}}{\partial I}=\lim_{I\to 0^+}
\dfrac{g(I)}{I}=c$, 
$$
\mathcal{R}_0=\frac{c\beta\varepsilon}
{(d+\varepsilon)(d+\gamma)}
$$

The local stability results already established are valid here, since $g$ is a particular case of the function $f$ used to establish these results

---

<div class="definition">

The system is **uniformly persistent** if there exists $0<\epsilon_0<1$ s.t. any solution $(S(t),E(t),I(t),R(t))$ of SEIRS with initial condition $(S(0),E(0),I(0),R(0))\in \overset{\circ}{\Gamma}$ satisfies
$$
\begin{array}{c}
\liminf_{t\to\infty} S(t)\geq \epsilon_0,\quad 
\liminf_{t\to\infty} E(t)\geq \epsilon_0 \\
\liminf_{t\to\infty} I(t)\geq \epsilon_0,\quad 
\liminf_{t\to\infty} R(t)\geq \epsilon_0
\end{array}
$$
</div>

<div class="theorem">

If $g(I)$ satisfies hypothesis **(H)**, then system $f(S,I,N)=\beta S^q I^p$ with incidence $f(S,I,N)=\beta S^q I^p$ is uniformly persistent if and only if $\mathcal{R}_0>1$
</div>

---

<div class="theorem">

Suppose that incidence $f(S,I,N)=\beta S^q I^p$ satisfies **(H)** and that
$$
|g'(I)|I\leq g(I) \textrm{ pour }I\in(0,1]
$$
Suppose additionnally that $\mathcal{R}_0>1$ and that one of the conditions
$$
\begin{gather*}
\gamma\nu<\epsilon_0(\beta\eta_0+\gamma+d)(\beta\eta_0+\nu+d) \\
\varepsilon-\gamma-d<\nu
\end{gather*}
$$
is satisfied, where 
$$
\eta_0=\min_{I\in[\epsilon_0,1]}g(I)>0
$$
and $\epsilon_0$ defined by (\ref{eq:SEIRS_persist}). Then there is no closed rectifiable curve that is invariant with respect to SEIRS. Furthermore, each semi-trajectory of SEIRS in $\Gamma$ converges to an equilibrium
</div>

The proof uses compound matrices (see [Practicum 02](https://julien-arino.github.io/3MC-course-epidemiological-modelling/2022_04_3MC_EpiModelling_P02_Analysis_LargeScaleModels.html))

---

# Lyapunov function for SLIR and SLIS

Consider an SLIR with constant population normalised to 1 and vertical transmission

$$
\begin{align}
S' &= d-\beta SI -pdI-qdL-dS 
\tag{23a}\label{sys:SEIR_vert_transmission_dS} \\
L' &= \beta SI +pdI-(\varepsilon+d-qd)L 
\tag{23b}\label{sys:SEIR_vert_transmission_dL} \\
I' &= \varepsilon L-(\gamma+d)I 
\tag{23c}\label{sys:SEIR_vert_transmission_dI}
\end{align}
$$

- $p$ proportion of newborns from $I$ who are $I$ at birth
- $q$ proportion of newborns from $L$ who are $L$ at birth
- $R$ does not influence the dynamics of the system, so not shown

<div style = "text-align: justify; position: relative; bottom: -15%; font-size:18px;">

Korobeinikov. [Lyapunov functions and global properties for SEIR and SEIS epidemic models](https://doi.org/10.1093/imammb/21.2.75). *Mathematical Medicine and Biology* **21** (2004)
</div>

---

# Equilibria
 
- DFE: $E_0=(1,0,0)$
- EEP: $E^\star =(S^\star,L^\star,I^\star)$ with
$$
S^\star =\frac 1{\mathcal{R}_0^v}\quad L^\star =\frac{d}{\varepsilon+d}\left(1-\frac
  1{\mathcal{R}_0^v}\right) 
\quad
I^\star =\frac{d\varepsilon}{(\varepsilon+d)(\gamma+d)}\left(1-\frac
  1{\mathcal{R}_0^v}\right) 
$$

where
$$
\tag{24}
\mathcal{R}_0^v=\frac{\beta\varepsilon}
{(\gamma+d)(\varepsilon+d)-qd(\varepsilon+d)-pd\varepsilon}
$$
is the basic reproduction number with vertical transmission. We have $\mathcal{R}_0=\mathcal{R}_0^v \iff p=q=0$. On the other hand, $\mathcal{R}_0^v=1$ when $\mathcal{R}_0=1$

$E^\star$ is biologically relevant only when $\mathcal{R}_0^v>1$

---


Use the function
$$
\tag{25}
V=\sum a_i(x_i-x_i^\star  \ln x_i)
$$

<div class="theorem">
 
- If $\mathcal{R}_0>1$, then system $\eqref{sys:SEIR_vert_transmission_dS}$-$\eqref{sys:SEIR_vert_transmission_dI}$ has the globally asymptotically stable equilibrium $E^\star$
- If $\mathcal{R}_0\leq 1$, then system $\eqref{sys:SEIR_vert_transmission_dS}$-$\eqref{sys:SEIR_vert_transmission_dI}$ has the globally asymptotically stable DFE $E_0$ and $E^\star$ is not biologically relevant
</div>
