---
marp: true
title: Basic concepts of mathematical epidemiology. Models in one population and their basic properties
description: 3MC Course Epidemiological Modelling - Julien Arino - Course 02 - Basic concepts of mathematical epidemiology. Models in one population and their basic properties
theme: default
paginate: false
size: 4K
---

# Basic concepts of mathematical epidemiology. Models in one population and their basic properties

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

- The Kermack and McKendrick SIR model
- KMK-type epidemic models and epidemic final size
- SIS endemic model
- SLIRS model with constant population
- SLIRS model with non constant population
- Other ODE models
  - Role of vaccination
  - Bistability
  - Logistic demography

---

# Foreword

- These slides contain much more material than is needed for the first course
- We will only cover some of that material
- Use the remaining slides to learn about aspects not explained *viva voce*

---

<!-- _backgroundImage: "linear-gradient(to bottom, #f1c40f, 20%, white)" -->
# <!--fit-->The Kermack and McKendrick SIR model

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
- Incidence is mass action

Consider the following model, usually called the Kermack-McKendrick model
$$
\begin{align}
S' &= -\beta SI \qquad\qquad\qquad  \tag{1a} \\
I' &= (\beta S-\gamma)I  \tag{1b} \\
R' &= \gamma I  \tag{1c}
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
S' &= -\beta SI \qquad\qquad\qquad \tag{2a}\\
I' &= (\beta S-\gamma)I  \tag{2b}
\end{align}
$$

---

# Equilibria


Consider the equilibia of
$$
\begin{align}
S' &= -\beta SI \qquad\qquad\qquad \tag{2a}\\
I' &= (\beta S-\gamma)I  \tag{2b}
\end{align}
$$

From (2b)
- either $\bar S=\gamma/\beta$
- or $\bar I=0$

Substitute into (2a)
- in the first case, $(\bar S,\bar I)=(\gamma/\beta,0)$
- in the second case, any $\bar S\geq 0$ is an equilibrium (*continuum* of EP)

Second case is a **problem**: usual linearisation does not work as EP are not isolated!

---

# Workaround - Study $dI/dS$

What is the dynamics of $dI/dS$? We have
$$
\frac{dI}{dS}
=\frac{dI}{dt}\frac{dt}{dS}
=\frac{I'}{S'}
=\frac{\beta SI-\gamma I}{-\beta SI}
=\frac{\gamma}{\beta S}-1
$$
provided $S\neq 0$

**Careful!** Remember that $S$ and $I$ are $S(t)$ and $I(t)$.. the equation above thus describes the relationship between $S$ and $I$ along solutions to the original ODE (2)

---

So we can integrate this equation, giving trajectories in phase space
$$
I(S)=\frac\gamma\beta \ln S-S+C
$$
with $C\in\mathbb{R}$

The initial condition $I(S_0)=I_0$ gives $C=S_0+I_0-\frac \gamma\beta \ln S_0$, and the solution to (1) is thus, as a function of $S$,
$$
\begin{align*}
I(S)&=S_0+I_0-S+\frac\gamma\beta \ln \frac S{S_0} \\
R(S)&=N-S-I(S)=R_0-\frac\gamma\beta \ln \frac S{S_0}
\end{align*}
$$

---

Trajectories in the phase plane $(S,I)$ corresponding to initial conditions $(S_0,1-S_0)$ (and $R_0=0$)
\begin{figure}[htbp]
  \begin{center}
    \includegraphics[width=\figfullwidth]{Simuls/SIR_simple}
  \end{center}
\end{figure}

---

# The basic reproduction number $\mathcal{R}_0$

Suppose the total population $N$ is normalised, i.e., $N=1$. Then $R=1-(S+I)$

Let
$$
\mathcal{R}_0=\frac{\beta}{\gamma}
$$

---

<div align=justify 
style="background-color:#16a085;
border-radius:20px;
padding:10px 20px 10px 20px;
box-shadow: 0px 1px 5px #999;">

Let $(S(t),I(t))$ be a solution to (1) in proportions. If $\mathcal{R}_0
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

# Extensions of the KMK model

Many many works (especially since COVID-19) have used KMK-type models

- Brauer. [The Kermack–McKendrick epidemic model revisited](https://doi.org/10.1016/j.mbs.2005.07.006) (2005)


---

<!-- _backgroundImage: "linear-gradient(to bottom, #f1c40f, 20%, white)" -->
# <!--fit--> The SIS model

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

# Interactions - Infection

When a contact takes place between an infectious and a susceptible individual, the pathogen can be transmitted. The  function $f(S,I,N)$ of $S$, $I$ and $N$ that describes the rate at which this process happens is the *incidence function*

Incidence includes two main components:
- a denumeration of the number of contacts taking place
- a description of the probability that such a contact, when it takes place, results in the transmission of the pathogen

---

The two most frequently used incidence functions are  *mass action incidence*
$$
f(S,I)=\beta SI
$$
and *standard* (or *proportional*) incidence
$$
f(S,I)=\beta\frac{SI}{S+I}
$$

In both cases, $\beta$ is the *disease transmission coefficient*. Note that units of $\beta$ change depending on the functional form used

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
f(S,I,N)=\beta SI
$$

In this case, one of the most widely accepted interpretations is that all susceptible individuals can come across all infectious individuals (hence the name, by analogy with gas dynamics in chemistry/physics) 

When population is large, the hypothesis becomes unrealistic

---

# Standard (or proportional) incidence

$$
f(S,I)=\beta\frac{SI}{N}
$$

Case of a larger population

Each infectious individual meets a proportion of the susceptibles

Remark that the interpretation and units of $\beta$ varies depending on the case


---

# Back to the model

\begin{figure}[htbp]
\begin{center}
\includegraphics[width=\figfullwidth]{Figures/SIS}
\end{center}
\end{figure}

---

# The model

Using standard incidence 
$$
\begin{align}
S' &= \underbrace{dN}_\textrm{birth}
-\underbrace{dS}_\textrm{death} 
-\underbrace{\beta\frac{SI}{N}}_\textrm{infection}
+\underbrace{\gamma I}_\textrm{recovery} \qquad\qquad\\
I' &= \underbrace{\beta\frac{SI}{N}}_\textrm{infection}
-\underbrace{dI}_\textrm{death} 
-\underbrace{\gamma I}_\textrm{recovery}
\end{align}
$$

Consider the initial value problem (IVP) consisting of this system together with the initial conditions $S(0)=S_0\geq 0$ and $I(0)=I_0\geq 0$

---

# Remarks
 
- \eqref{sys:SIS_simple} is an SIS (Susceptible-Infectious-Susceptible) model
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

System \eqref{sys:SIS_simple} is planar nonlinear 

Typically, we would use standard planar analysis techniques

However, here we can find an explicit solution

**NB:** while this is useful to illustrate some stuff, this is a rare exception!!

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
s &= 1-i \tag{3a} \\
i' &= \beta(1-i)i-(d+\gamma)i \tag{3b}\qquad\qquad
\end{align}
$$

Since $N$ constant, solutions of (2) are deduced directly from those of (3) and we now consider (3) 

---


Rewrite (3b) as
$$
\begin{equation} \tag{4}
i'-(\beta-(d+\gamma))i=-\beta i^2\qquad\qquad
\end{equation}
$$
This is a Bernoulli equation and the change of variables $u=i^{-1}$ gives the linear equation
$$
-u'-(\beta-(d+\gamma))u=-\beta
$$
so that finally
$$
\begin{equation}\tag{5}
u'+(\beta-(d+\gamma))u=\beta\qquad\qquad
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

As a consequence, the solution to the linear equation (5) is
$$
\begin{aligned}
u &= \frac{i_0\beta+(\beta-(d+\gamma)-i_0\beta)e^{-(\beta-(d+\gamma))t}}
{i_0(\beta-(d+\gamma))} \\
&= \frac{i_0\beta(1-e^{-(\beta-(d+\gamma))t})
  +(\beta-(d+\gamma))e^{-(\beta-(d+\gamma))t}}{i_0(\beta-(d+\gamma))}
\end{aligned}
$$
and that of (4) is
$$
i(t)=\frac{i_0(\beta-(d+\gamma))}{i_0\beta(1-e^{-(\beta-(d+\gamma))t})
  +(\beta-(d+\gamma))e^{-(\beta-(d+\gamma))t}}
$$

---

In summary, the solution to \eqref{sys_prop} is given by
$$
\begin{equation}\label{eq:sol_s}
s(t)=1-\frac{i_0(\beta-(d+\gamma))}{i_0\beta(1-e^{-(\beta-(d+\gamma))t})
  +(\beta-(d+\gamma))e^{-(\beta-(d+\gamma))t}}
\end{equation}
$$
and
$$
\begin{equation}\label{eq:sol_i}
i(t)=\frac{i_0(\beta-(d+\gamma))}{i_0\beta(1-e^{-(\beta-(d+\gamma))t})
  +(\beta-(d+\gamma))e^{-(\beta-(d+\gamma))t}}
\end{equation}
$$

---

From \eqref{eq:sol_sys_sis}, we see there are two cases: 
 
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

<div align=justify 
style="background-color:#16a085;
border-radius:20px;
padding:10px 20px 10px 20px;
box-shadow: 0px 1px 5px #999;">

For system \eqref{sys:SIS_simple}, the following alternative holds
 
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

\begin{figure}[htbp]
\begin{center}
\includegraphics[width=\figfullwidth]{Figures/R0}
\end{center}
\end{figure}

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

# <!--fit-->Summary thus far
- An SIR *epidemic* model in which the presence or absence of an epidemic wave is characterised by the value of $\mathcal{R}_0$
- An SIS *endemic* model in which the threshold $\mathcal{R}_0=1$ is such that when $\mathcal{R}_0<1$, the disease goes extinct, whereas when $\mathcal{R}_0>1$, the disease becomes established in the population
- Both examples are integrable in some sense. **This is an exception!!!**


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
S' &= d(N-S)-f(S,I,N)+\nu R\qquad\qquad \\
L' &= f(S,I,N) -(d+\varepsilon)L \\
I' &= \varepsilon L -(d+\gamma)I \\
R' &= \gamma I-(d+\nu)R
\end{align}
$$

$1/\varepsilon$ average duration of the incubation period

$1/\gamma$ average time until recovery

$1/\nu$ average duration of immunity


---

<!-- _backgroundImage: "linear-gradient(to bottom, #f1c40f, 20%, white)" -->
# <!--fit-->Incidence functions

---

# Incidence functions

Assume transmission takes place at the rate
$$
f(S,I,N)
$$
 
- $f$ is the rate at which new cases appear per unit time, the *incidence* (or *incidence function*)
- Depends of the number $S$ of susceptible individuals, $I$ of infectious individuals and, sometimes, of the total population $N$
- Choosing an appropriate function is hard and probably one of the flunkiest part of epidemic modelling

---

# Mass action incidence

$$
\begin{equation}
f(S,I)=\beta SI\qquad\qquad
\end{equation}
 $$

- There is homogenous mixing of susceptible and infectious individuals 
- Strong hypothesis: each individual potentially meets every other individual

---

# Standard (proportional) incidence 

The other form used frequently:
$$
\begin{equation}
f(S,I,N)=\beta\frac{SI}{N}\qquad\qquad
\end{equation}
$$

Each susceptible individual meets a fraction of the infectious individuals

Or vice-versa!
[Papier a citer]

---

# When all is good, all is good

When the total population is constant, a lot of incidence function are equivalent (to units)

Suppose $N(t)\equiv N_0$, then
$$
\beta SI = \tilde\beta\frac{SI}{N}
\iff \tilde\beta=N_0\beta
$$
and if the right hand side is satisfied, then the two functions are identical

---

# General incidence

$$
f(S,I,N)=\beta S^q I^p
$$
These functions were introduced with data fitting in mind: fitting to data, find the $p,q$ best matching the available data

---

# Incidence with refuge

The following implements a refuge effect; it assumes that a proportion $0<q<1$ of the population is truly susceptible, because of, e.g., spatial heterogenities

$$
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
f(S,I,N)=kS\ln\left(1+\beta\frac Ik\right)
$$
For small values of $k$, this function describes a very concentrated infection process, while when $k\to\infty$, this function reduces to a mass action incidence

---

# Asymptotic contact

$$
f(S,I,N)
=\frac{N}{1-\varepsilon+\varepsilon N}
\frac{F(S,I)}{N}
$$
where $F$ is one of the functions we just described

When $\varepsilon=0$, contacts are proportionnal to $N$, whereas when $\varepsilon=1$, contacts are independent from $N$

---

# Asymptomatic transmission

$$
f(S,I,N)
=\beta\frac{SI}{c+S+I}
$$
where $c$ is a constant. E.g., 
$$
\frac{C(N)}N F(S,I)
$$
with $C(N)=N/(1-\varepsilon+\varepsilon N)$ the function describing the contact rate and $F(S,I)$ the function describing disease spread, assumed here to be of negative binomial incide-type

---

<!-- _backgroundImage: "linear-gradient(to bottom, #f1c40f, 20%, white)" -->
# Computation of $\mathcal{R}_0$

# Computation of $\mathcal{R}_0$ using the next generation operator method

# Example of the SLIRS model

---

# The basic reproduction number $\mathcal{R}_0$

Indicator often used in epidemiology. Verbally
``
average number of new cases generated when an infectious individul is introduced in a completely susceptible population
``
 
- If $\mathcal{R}_0<1$, then each infectious individual infects on average less than 1 person and the epidemic is quite likely to go extinct
- If $\mathcal{R}_0>1$, then each infectious individual infects on average more than 1 person and an epidemic is quite likely to occur


---

# Computation of $\mathcal{R}_0$

Mathematically
``
bifurcation parametre aggregating system parameters, such that the DFE loses it *local* asymptotic stability as $\mathcal{R}_0$ crosses 1 from left to right
``

- Obtained by considering the linearisation of the system at the DFE
- Quickly becomes unmanageable (matrix size) and we get a non unique form

---

# Example of the SIS model
Take SIS normalised to $N=1$ 
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

# Next generation matrix/operator

Diekmann and Heesterbeek, characterised in the ODE case by PvdD and Watmough

Consider only compartments $x$ with infected individuals and write
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

# A result of van den Driessche and Watmough


<div align=justify 
style="background-color:#16a085;
border-radius:20px;
padding:10px 20px 10px 20px;
box-shadow: 0px 1px 5px #999;">

Suppose the DFE exists. Let then
$$
\mathcal{R}_0=\rho(FV^{-1})
$$
with matrices $F$ and $V$ obtained as indicated. Assume conditions 1 through 5 hold. Then
- if $\mathcal{R}_0<1$, then the DFE is LAS
- if $\mathcal{R}_0>1$, the DFE is unstable
</div>

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
\frac{\partial\overline{f}}{\partial L}
& \frac{\partial\overline{f}}{\partial I} \\
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
\frac{\partial\overline{f}}{\partial I}:=
\frac{\partial f}{\partial I}(\bar
S,\bar I,\bar N)\quad\quad 
\frac{\partial\overline{f}}{\partial L}:=
\frac{\partial f}{\partial L}(\bar
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

<div align=justify 
style="background-color:#16a085;
border-radius:20px;
padding:10px 20px 10px 20px;
box-shadow: 0px 1px 5px #999;">

Let
$$
\mathcal{R}_0=
\frac{\varepsilon\frac{\partial\overline{f}}{\partial I}}
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

$$
\begin{align*}
S'&=d(1-S)-f(S,I)+\nu R \\
L'&=f(S,I)-(d+\varepsilon) L \\
I'&=\varepsilon L-(d+\gamma)I \\
R'&=\gamma I-(d+\nu)R
\end{align*}
$$

SLIR is SLIRS where $\nu=0$
SLIS is limit of an SLIRS when $\nu\to\infty$
SLI is SLIR where $\gamma=0$
SIRS is limit of an SLIRS when $\varepsilon\to\infty$
SIR is SIRS where $\nu=0$
SIS is limit of an SIRS when $\nu\to\infty$
SIS is limit of an SLIS when $\varepsilon\to\infty$
SI is SIS where $\nu=0$ 


---

# Expressions of $\mathcal{R}_0$

$(\bar S,\bar I)$ the DFE, denote $\overline{f}_I=\partial f/\partial I(\bar
S,\bar I)$

| Model | $\mathcal{R}_0$ |
|:---|:---:|
| SLIRS | $\frac{\varepsilon\overline{f}_I}{(d+\varepsilon)(d+\gamma)}$ |
| SLIR | $\frac{\varepsilon\overline{f}_I}{(d+\varepsilon)(d+\gamma)}$ |
| SLIS | $\frac{\varepsilon\overline{f}_I}{(d+\varepsilon)(d+\gamma)}$ |
| SLI | $\frac{\varepsilon\overline{f}_I}{(d+\varepsilon)(d+\gamma)}$ |
| SIRS | $\frac{\varepsilon\overline{f}_I}{d+\gamma}$ |
| SIR | $\frac{\overline{f}_I}{d+\gamma}$ |
| SIS | $\frac{\overline{f}_I}{d+\gamma}$ |
| SI | $\frac{\overline{f}_I}{d+\gamma}$ |

---

<!-- _backgroundImage: "linear-gradient(to bottom, #f1c40f, 20%, white)" -->
# <!--fit-->SLIRS model - Global properties

---

# Lyapunov function for SLIR and SLIS

Andrei Korobeinikov. Considers an SLIR with constant population normalised to 1 and vertical transmission

$$
\begin{align}
S' &= d-\beta SI -pdI-qdL-dS \\
L' &= \beta SI +pdI-(\varepsilon+d-qd)L \qquad\qquad\\
I' &= \varepsilon L-(\gamma+d)I
\end{align}
$$
$p$ proportion of newborns from $I$ who are $I$ at birth
$q$ proportion of newborns from $E$ who are $E$ at birth
$R$ does not influence the dynamics of \eqref{sys:SEIR_vert_transmission}, so not shown

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
\mathcal{R}_0^v=\frac{\beta\varepsilon}
{(\gamma+d)(\varepsilon+d)-qd(\varepsilon+d)-pd\varepsilon}
$$
is the basic reproduction number with vertical transmission. We have $\mathcal{R}_0=\mathcal{R}_0^v \iff p=q=0$. On the other hand, $\mathcal{R}_0^v=1$ when $\mathcal{R}_0=1$

$E^\star$ is biologically relevant only when $\mathcal{R}_0^v>1$

---


Use the function
$$
V=\sum a_i(x_i-x_i^\star  \ln x_i)
$$

<div align=justify 
style="background-color:#16a085;
border-radius:20px;
padding:10px 20px 10px 20px;
box-shadow: 0px 1px 5px #999;">
 
- If $\mathcal{R}_0>1$, then system \eqref{sys:SEIR_vert_transmission} has the globally asymptotically stable equilibrium $E^\star$
- If $\mathcal{R}_0\leq 1$, then system \eqref{sys:SEIR_vert_transmission} has the globally asymptotically stable DFE $E_0$ and $E^\star$ is not biologically relevant
</div>


---

# SEIRS - Mukherjee et al

Mukherjee, Chattopadhyay and Tapaswi consider system \eqref{sys:SEIRS} with an incidence function taking the form
$$
f(S,I,N)=\beta S^q I^p
$$

After establishing uniform boundedness of the system, they define the following function
$$
V(S,E,I)=\frac 12\left(
(S-S^\star )^2+(E-E^\star )^2+(I-I^\star )^2\right)
$$

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

<div align=justify 
style="background-color:#16a085;
border-radius:20px;
padding:10px 20px 10px 20px;
box-shadow: 0px 1px 5px #999;">

Function $V$ is s.t. $V'<0$ if
- $4(\beta I^{*p}g(S)+d+\nu)(\varepsilon+d)>(\nu-\beta I^{*p}g(S))^2$
- $\det A>0$
</div>

Clearly, this is hard to use in practice so the system was studied in other ways

---

Li, Muldowney and van den Driessche study an SLIRS with incidence
$$
f(S,I,N)=\beta g(I)S
$$
wheere $g$ is s.t. $g(0)=0$, $g(I)>0$ for $I\in(0,1]$ and $g\in
C^1(0,1]$

They normalise the total population, so $S+L+I+R=1$. They make an additional hypothesis about $g$:

- **(H)** $c=\lim_{I\to 0^+} \frac{g(I)}{I}\leq +\infty$; when $0<c<+\infty$, $g(I)\leq cI$ for sufficiently small $I$

---

We have
$$
\frac{\partial\overline{f}}{\partial I}=\beta\frac{\partial\bar g}{\partial I}
$$
Since $\frac{\partial\bar g}{\partial I}=\lim_{I\to 0^+}
\frac{g(I)}{I}=c$, 
$$
\mathcal{R}_0=\frac{c\beta\varepsilon}
{(d+\varepsilon)(d+\gamma)}
$$

The local stability results already established are valid here, since (\ref{eq:g_incidence}) is a particular case of the function $f$ used to establish these results

---

<div align=justify 
style="background-color:#16a085;
border-radius:20px;
padding:10px 20px 10px 20px;
box-shadow: 0px 1px 5px #999;">

If $g(I)$ satisfies hypothesis **(H)**, then system (\ref{sys:SEIRS}) with incidence (\ref{eq:g_incidence}) is uniformly persistent if and only if $\mathcal{R}_0>1$
</div>

The system is **uniformly persistent** if there exists $0<\epsilon_0<1$ s.t. any solution $(S(t),L(t),I(t),R(t))$ of (\ref{sys:SEIRS}) with initial condition $(S(0),L(0),I(0),R(0))\in \overset{\circ}{\Gamma}$ satisfies
$$
\begin{array}{c}
\liminf_{t\to\infty} S(t)\geq \epsilon_0,\quad 
\liminf_{t\to\infty} E(t)\geq \epsilon_0 \\
\liminf_{t\to\infty} I(t)\geq \epsilon_0,\quad 
\liminf_{t\to\infty} R(t)\geq \epsilon_0
\end{array}
$$

---

<div align=justify 
style="background-color:#16a085;
border-radius:20px;
padding:10px 20px 10px 20px;
box-shadow: 0px 1px 5px #999;">

Suppose that incidence (\ref{eq:g_incidence}) satisfies **(H)** and that
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
et $\epsilon_0$ d\'efini par (\ref{eq:SEIRS_persist}). Alors il n'y a pas de courbe ferm\'ee rectifiable qui soit invariante par rapport \`a (\ref{sys:SEIRS}). De plus, chaque semi-trajectoire de (\ref{sys:SEIRS}) dans $\Gamma$ converge vers un \'equilibre.
</div>

---

Nous ne donnons pas la preuve de ce r\'esultat. Elle utilise la m\'ethode des matrices compos\'ees. Toutefois, l'application est ici difficile, et nous pr\'eferrons illustrer cette m\'ethode en l'utilisant dans un cas plus simple. Le cas d'un mod\`ele SEIR (sans perte d'immunit\'e) en population non constante est trait\'e plus loin

---

# Remarks
 
- Le mod\`ele SEIRS, et plus encore ses sous-syst\`emes, ont fait l'objet de beaucoup de travail. Les premiers travaux remontent \`a Kermack et McKendrick, et concernent le mod\`ele SIR sans d\'emographie (mais avec infection des individus remis).
- Je ne connais pas de SEIRS \`a population constante qui ait un comportement exotique.

---

<!-- _backgroundImage: "linear-gradient(to bottom, #f1c40f, 20%, white)" -->
# <!--fit-->SLIRS with non-constant population

---

{Liu, Levin et Iwasa}
Mod\`ele SIRS de la forme
\begin{subequations}\label{sys:SIRS_LLI}
\begin{align}
S' &= B(N)-dS-f(S,I)I+\nu R \\
I' &= f(S,I)I-(d+\gamma)I \\
R' &= \gamma I-(d+\nu)R
\end{align}
\end{subequations}
Les auteurs font quelques consid\'erations sur le cas g\'en\'eral d'une fonction $f$ diff\'erentiable, et telle que $f(0,I)=0$ pour tout $I$ et $\partial f/\partial S>0$. Ils supposent que la composante d\'emographique du syst\`eme, qui est r\'egie par l'\'equation
$$
N'=B(N)-dN
$$
admet un \'equilibre stable. 


---


Utilisant le fait que $N$ a un \'equilibre stable, ils r\'eduisent la dimension du syst\`eme. Apr\`es avoir \'etabli des conditions g\'en\'eriques conduisant \`a une bifurcation de Hopf, ils se livrent \`a une analyse plus d\'etaill\'ee du syst\`eme lorsque la fonction d'incidence prend la forme
$$
f(S,I)=\beta I^{p-1}S^q
$$


---

# Liu and van den Driessche
Liu et van den Driessche traitent d'un mod\`ele SEIS et d'un mod\`ele SEIRS dans lesquels la population est non constante et la p\'eriode de latence est une fonction qui d\'epend du nombre d'infect\'es dans la population. Dans le cas d'un mod\`ele SEIS, le comportement n'est pas modifi\'e par cette fonction. Par contre, dans le cas d'une immunit\'e temporaire (SEIRS), les auteurs trouvent (num\'eriquement) une bifurcation de Hopf.

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
S' &= d((1-p)N-S)-\beta SI  \qquad\qquad\\
I' &= \beta SI -(d+\gamma)I\\
R' &= dpN+\gamma I-dR
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
\mathcal{R}_0^\text{v}<1 \iff p> 1-\frac{1}{\mathcal{R}_0}
$$

By vaccinating a fraction $p>1-1/\mathcal{R}_0$ of newborns, we thus are in a situation where the disease is eventually eradicated

This is *herd immunity*

---

<!-- _backgroundImage: "linear-gradient(to bottom, #f1c40f, 20%, white)" -->
# <!--fit-->Effect of vaccination - Bistable states

---

# Another SIRS model with vaccination

\begin{figure}[htbp]
\begin{center}
\includegraphics[width=\figfullwidth]{Figures/SIRV_newborns}
\end{center}
\end{figure}

---

# SIRSV epidemic model

$$
\begin{align}
S' &= (1-\alpha)dN-dS-\beta\frac{SI}{N}-\phi S+\theta
V+\nu R \qquad\qquad\\
I' &= \beta\frac{SI}{N}
+\sigma\beta\frac{VI}{N} -(d+\gamma)I \\
R' &= \gamma I-(d+\nu)R \\
V' &= \alpha dN+\phi S-(d+\theta)V
-\sigma\beta\frac{VI}{N} 
\end{align}
$$

- $\alpha$ proportion of newborns vaccinated
- $\phi$ vaccination rate of susceptibles
- $\theta$ rate of vaccine efficacy loss
- $1-\sigma$ vaccine efficacy


---

Since the total population is constant, the system in proportions takes the form
$$
\begin{align}
S' &= (1-\alpha)d-dS-\beta SI-\phi S+\theta
(1-S-I-R)+\nu R \qquad\qquad \\
I' &= \beta SI
+\sigma\beta(1-S-I-R)I -(d+\gamma)I \\
R' &= \gamma I-(d+\nu)R \\
V &= 1-(S+I+R) 
\end{align}
$$
where $S$, $I$, $R$, $V$ are the proportions of individuals who are in the susceptible, infectious, recovered and vaccinated, respectively

---

# Equilibrium and bifurcations

The system always has the DFE
$$
(S,I,R,V)=\left(
\frac{\theta+d(1-\alpha)}{d+\theta+\phi},0,0,
\frac{\phi+d\alpha}{d+\theta+\phi}
\right)
$$

We now consider endemic equilibria with $I=I^\star >0$

When $\sigma=0$ (vaccine 100% efficacious), there is at most one endemic equilibrium. From now on, assume (realistic) that $0<\sigma<1$, i.e., vaccine is not 100% efficacious

---

# Existence of endemic equilbria

The existence of endemic equilibria is determined by the number of positive roots of the polynomial
$$
P(I)=AI^2+BI+C
$$
where
$$
A=-\sigma\beta^2\frac{d+\nu+\gamma}{d+\nu}<0
$$
$$
B=\sigma\beta^2-\beta(d+\theta+\sigma(d+\gamma+\phi))
-\frac{\beta\gamma}{d+\nu}(d+\theta+\sigma\phi)
$$
$$
C=(d+\theta+\sigma\phi-d\alpha(1-\sigma))\beta
-(d+\gamma)(d+\theta+\phi)
$$

---

# Case of a forward bifurcation

\begin{figure}[htbp]
  \begin{center}
    \includegraphics[width=\fighalfwidth]{Figures/PI_vs_I_forward}
    \includegraphics[width=\fighalfwidth]{Figures/SIRV_bif_forward}
  \end{center}
\end{figure}

---

# Case of a backward bifurcation

\begin{figure}[htbp]
  \begin{center}
    \includegraphics[width=\fighalfwidth]{Figures/PI_vs_I_backward}
    \includegraphics[width=\fighalfwidth]{Figures/SIRV_bif_backward}
  \end{center}
\end{figure}

---

# Bistable region
 
- Concavity of the curve is fixed (since $A<0$), so a necessary condition for existence of two endemic equilibria is: 
  - $P'(0)=B>0$ and $P(0)=C<0$
  - The roots of $P(I)$ must be real

$\implies$ region of bistability is $\Delta=B^2-4AC\geq 0$, $B>0$ and $C<0$

---

# Bifurcation in the $(\sigma,\phi)$ plane

\begin{figure}[htbp]
\begin{center}
\includegraphics[width=\figfullwidth]{Figures/bif_sigma_vs_phi}
\end{center}
\end{figure}

---

# EEP

S'il existe de telles solutions $I^\star$ \`a l'\'equation $P(I)=0$ (potentiellement une racine double), les PEE du syst\`eme \eqref{sys:SIR_vacc_AMV} est/sont donn\'es par $(S,I,R,V)=$
$$
\left(
\frac{(1-\alpha)d+\frac{(\nu-\theta)\gamma
    I^\star }{d+\nu}+(1-I^\star )\theta}{d+\beta
  I^\star +\phi+\theta},I^\star ,\frac{\gamma
  I^\star }{d+\nu},1-S^\star -I^\star -R^\star  
\right)
$$

---

# $\mathcal{R}_0$

En utilisant l'op\'erateur de prochaine g\'en\'eration, le nombre de reproduction \'el\'ementaire est donn\'e par 
$$
\mathcal{R}_\phi=\mathcal{R}_0
\frac{d+\theta+\sigma\phi-d\alpha(1-\sigma)}{d+\theta+\phi}
$$
where
$$
\mathcal{R}_0=\frac{\beta}{d+\gamma}
$$
and as a consequence
$$
\mathcal{R}
(\alpha,\phi,1,\theta)=\mathcal{R}_0
$$

---

# Stability - DFE
 
- Using Th\'eor\`eme~\ref{th:R0_VdDW}, the DFE is
  - locally asymptotically stable for $\mathcal{R}_\phi<1$
  - unstable for $\mathcal{R}_\phi>1$
- Furthermore, when $\mathcal{R}_0<1$, using $I$ as a Lyapunov function, it is easily shown the the DFE is globally asymptotically stable

---

# Local stability - EEP

En lin\'earisant (\ref{sys3dS})-(\ref{sys3dR}) en l'\'equilibre end\'emique
 
- avec la plus petite valeur de $I$, la matrice jacobienne a une trace n\'egative et un d\'eterminant positif. Elle a par cons\'equent une valeur propre strictement positive, et la branche inf\'erieure de la bifurcation est instable.  
- Sur la branche sup\'erieure, on conclut de la lin\'earisation qu'il y a soit une soit trois valeurs propres \`a partie r\'eelle n\'egative. Par cons\'equent, la stabilit\'e de cet \'equilibre est ind\'etermin\'ee. Toutefois, les r\'esultats num\'eriques semblent indiquer que la branche sup\'erieure est localement stable.

---

# Module de stabilit\'e en les \'equilibres

Module de stabilit\'e $s(J)$ (maximum des parties r\'eeles des valeurs propres de la matrice jacobienne $J$) de la lin\'earisation en l'DFE et en les deux PEE, quand on varie $\theta$.
\begin{figure}[htbp]
\begin{center}
\includegraphics[width=\figfullwidth]{Figures/evalues_SIRbif}
\end{center}
\end{figure}


---

# Global behaviour

<div align=justify 
style="background-color:#16a085;
border-radius:20px;
padding:10px 20px 10px 20px;
box-shadow: 0px 1px 5px #999;">

Suppose that in the system \eqref{sys:SIR_vacc}, parameters satisfy
$$
\begin{aligned}
  \theta &< d + 2 \nu                   \\
2 \gamma &< d + \phi + \theta + \nu     \\
  \gamma &< d + \phi + \nu
\end{aligned}
$$
Then all positive semi-trajectories of \eqref{sys3dS}-\eqref{sys3dR} in $\bar D$, where
$$
D=\{(S,I,R): S,R\geq 0, I>0, S+I+R\leq 1\}
$$
limit to a unique equilibrium point
</div>

---

<!-- _backgroundImage: "linear-gradient(to bottom, #f1c40f, 20%, white)" -->
# <!--fit-->Tuberculosis (TB) model with non-trivial behaviour at the origin

---

# Demographic model

Model of McCluskey et van den Driessche, 2004. 
En l'absence de maladie, supposent que la population totale $N$ est r\'egie par l'equation diff\'erentielle 
$$
N'=B(N)-dN
$$
o\`u $B(N)$ satisfait les propri\'et\'es suivantes:
\begin{enumerate}
- Il existe un unique $N_0>0$ tel que $B(N_0)-dN_0=0$.
- $B'(N)<B(N)/N$ pour $N\in ]0,N_0]$.
- $b_0:=\lim_{N\to 0^+}B(N)/N >d$, o\`u $b_0\in\overline{\mathbb{R}}$. 
\end{enumerate}


---

{Propagation de la TB}
\begin{figure}[htbp]
\begin{center}
\includegraphics[width=\figfullwidth]{Figures/SEI_TB}
\end{center}
Diagramme de flot du mod\`ele SEI pour la tuberculose.
\end{figure}


---


En utilisant le fait que $N=S+E+I$, on \'ecrit le mod\`ele en les
variables $N$, $E$ et $I$ de la fa\c{c}on suivante.
\begin{subequations}\label{sys:SEI_TB}
\begin{align}
N' &= B(N)-dN-\delta I \\
E' &= c\beta\frac{(N-E-I)I}{N}-(\varepsilon+\rho_1+d)E \\
I' &= \varepsilon E-(\rho_2+\delta+d)I
\end{align}
\end{subequations}


---


Le probl\`eme ici est pour l'\'equilibre sans maladie: on peut avoir
des solutions limitant en $(0,0,0)$. On consid\`ere le syst\`eme en
proportions
\begin{subequations}\label{sys:SEI_TB_prop}
\begin{align}
N' &= \left(\frac{B(N)}{N}-d-\delta i\right)N \\
e' &=
c\beta(1-e-i)i-\left(\varepsilon+\rho_1+\frac{B(N)}{N}+di\right)e \\
I' &= \varepsilon e-\left(\delta+\rho_2+\frac{B(N)}{N}+\delta
  i\right)i
\end{align}
\end{subequations}
On \'etend le syst\`eme en $\{N=0\}$ en rempla\c{c}ant
$\left.\frac{B(N)}{N}\right|_{N=0}$ par $b_0$ (3\eme hypoth\`ese sur
$B$).


---


R\'egion biologiquement int\'eressante est l'ensemble compact
positivement invariant
$$
\mathcal{B}=\{(N,e,i)\in\R^3_+: N\leq N_0,e+i\leq 1\}
$$
Si $b_0=\infty$ ($B(N)=\Lambda$ constant), $N=0$ est
r\'epulsif. Dor\'enavant, on le suppose fini.

Deux \'equilibres tels que $N=0$:
 
- $A_0=(0,0,0)$.
- $A_*=(0,e_*,i_*)$, avec $e_*,i_*>0$.

Ainsi, en $A_*$, la population s'\'eteint, mais de fa\c{c}on
``contr\^ol\'ee''.


---


Soit
$$
\mathcal{R}_0=\frac{c\beta\varepsilon}
{(\delta+\rho_2+d)(\varepsilon+\rho_1+d)}
$$
$$
\mathcal{R}_1=\frac{c\beta\varepsilon}
{(\delta+\rho_2+b_0)(\varepsilon+\rho_1+b_0)}
$$
et, si $\mathcal{R}_0>1$,
$$
\mathcal{R}_2=\frac{b_0}{d+\delta i_*}
$$



---

# Equilibres

$X_0=(N_0,0,0)$, $X_*=(N_*,E_*,I_*)$ (unique).

\begin{center}
\begin{tabular}{l|cccc}
\hline
& $A_0$ & $X_0$ & $A_*$ & $X_*$ \\
\hline
$\mathcal{R}_0<1$ & instable & LAS & & \\
$\mathcal{R}_2<1<\mathcal{R}_0,\mathcal{R}_1$ & instable & instable & LAS &
\\
$\mathcal{R}_1<1<\mathcal{R}_0,\mathcal{R}_2$ & instable & instable & & LAS
\\ 
$1<\mathcal{R}_0,\mathcal{R}_1,\mathcal{R}_2$ & instable & instable &
instable & LAS
\end{tabular}
\end{center}


---

# Global results

<div align=justify 
style="background-color:#16a085;
border-radius:20px;
padding:10px 20px 10px 20px;
box-shadow: 0px 1px 5px #999;">

L'\'equilibre $A_0=(0,0,0)$ n'est jamais un point omega-limite d'une solution de \eqre{sys:SEI_TB_prop} avec conditions initiales telles que $N>0$, $e,i\geq 0$ et $e+i\leq 1$.
<div>

<div align=justify 
style="background-color:#16a085;
border-radius:20px;
padding:10px 20px 10px 20px;
box-shadow: 0px 1px 5px #999;">

Si $\mathcal{R}_1<1$, alors $(0,0,0)$ n'est pas un point omega-limite de toute solution de \eqref{sys:SEI_TB} avec conditions initiales dans $\R^3_+\setminus\{(0,0,0)\}$.
<div>

<div align=justify 
style="background-color:#16a085;
border-radius:20px;
padding:10px 20px 10px 20px;
box-shadow: 0px 1px 5px #999;">

Pour le syst\`eme \eqref{sys:SEI_TB}, si $\mathcal{R}_0\leq 1$ alors
$X_0=(N_0,0,0)$ est globalement asymptotiquement stable.
</div>

Dans le cas $\mathcal{R}_0,\mathcal{R}_2>1$, la stabilit\'e globale de $X_*$
est \'etablie dans des conditions ``\'esot\'eriques''..

---

<!-- _backgroundImage: "linear-gradient(to bottom, #f1c40f, 20%, white)" -->
# <!--fit-->Compound matrices

---


On peut se r\'ef\'erer par exemple \`a Fiedler, 1998.
Soit $A=(a_{ij})$, $i=1,\ldots,m$, $j=1,\ldots,n$ une $m\times
n$-matrice, et soit $k$ un entier, $1\leq k\leq\min(m,n)$. 
Soit $M=\{1,\ldots,m\}$ et $N=\{1,\ldots,n\}$, $M^{(k)}$
(respectivement, $N^{(k)}$) les ensembles ordon\'es lexicographiquement
de $k$-tuples ordon\'es d'\'el\'ements de $M$ (respectivement, $N$).


---


La $k$\eme matrice compos\'ee $A^{(k)}$ de $A$ est alors la
$C(m,k)\times C(n,k)$ matrice, de lignes index\'ees par les
\'el\'ements de $M^{(k)}$ et de colonnes index\'ees par les
\'el\'ements de $N^{(k)}$, telle que l'\'el\'ement $A^{(k)}(I,J)$,
$I\in M^{(k)}$, $J\in N^{(k)}$ soit le d\'eterminant $\det A(I,J)$.
Le symbole $A(I,J)$ repr\'esente la sous-matrice de $A$ form\'ee par
les lignes appartenant \`a $I$ et les colonnes appartenant \`a $J$.

\begin{remark}
Une autre interpr\'etation de $A^{(k)}$ est en tant que $k$\eme
produit ext\'erieur de la matrice $A$.
\end{remark}


---


Supposons maintenant que $A$ soit une $n\times n$-matrice. La matrice
$(I+tA)^{(k)}$ est une $C(n,k)\times C(n,k)$-matrice, dont chaque
\'el\'ement est un polyn\^ome en $t$ de degr\'e au plus $k$. En
regroupant les termes de m\^eme degr\'e en $t$, on peut \'ecrire
$$
(I+tA)^{(k)}=A^{(k,0)}+tA^{(k,1)}+\cdots+t^kA^{(k,k)}
$$
o\`u les matrices $A^{(k,s)}$ ne d\'ependent pas de $t$. La matrice
$A^{(k,1)}$ est appel\'ee la $k$\eme *matrice compos\'ee
  additive} de $A$, et est not\'ee $A^{[k]}$. Elle satisfait la
relation
$$
A^{[k]}=\lim_{h\to 0}
\left(\frac 1h\left((I+hA)^{(k)}-I^{(k)}\right)\right)
$$


---

{Remarque}
On note \'egalement cette derni\`ere \'egalit\'e sous la forme
$$
A^{[k]}=D_+(I+hA)^{(k)}|_{h=0}
$$
o\`u $D_+$ est la d\'eriv\'ee \`a droite.


---


\begin{property}\label{prop:construction_MC}
Supposons que $A=(a_{pq})$. Alors, pour $I,J\in N^{(k)}$,
$$
A^{[k]}(I,J)=\left\{
\begin{array}{ll}
\sum_{p\in I}a_{pp} & \textrm{si } J=I \\
0 & \textrm{si }|I\cap J|\leq k-2 \\
(-1)^\sigma a_{pq} & \textrm{si } |I\cap J|=k-1
\end{array}
\right.
$$
o\`u $p$ est l'entr\'ee dans $I\setminus(I\cap J)$, $q$ est l'entr\'ee
dans $J\setminus(I\cap J)$, et $\sigma$ est le nombre d'\'el\'ements
de $I\cap J$ entre $p$ et $q$.
\end{property}


---


Dans le cas $k=2$, on a donc la
caract\'erisation suivante.
\begin{property}\label{prop:construction_MC2}
Supposons que $A=(a_{ij})$. Pour tout entier $i=1,\ldots,C(n,2)$, soit
$(i)=(i_1,i_2)$ le $i$\eme membre de l'ordre lexicographique des
couples d'entiers $(i_1,i_2)$ tel que $1\leq i_1<i_2\leq n$. Alors
l'\'el\'ement dans la $i$\eme ligne et $j$\eme colonne de $A^{[2]}$ est
$$
a_{ij}=\left\{
\begin{array}{ll}
a_{i_1i_1}+a_{i_2i_2} & \textrm{si } (j)=(i) \\
(-1)^{r+s}a_{i_rj_s} & \textrm{si exactement un \'el\'ement }
i_r\textrm{ de }(i)\textrm{ n'appara\^it pas}\\
&\textrm{dans }(j)\textrm{ et }j_s
\textrm{ n'appara\^it pas dans }(i) \\
0 & \textrm{si aucun \'el\'ement de }(i)
\textrm{ n'appara\^it dans }(j) 
\end{array}
\right.
$$
o\`u $p$ est l'entr\'ee dans $I\setminus(I\cap J)$, $q$ est l'entr\'ee
dans $J\setminus(I\cap J)$, et $\sigma$ est le nombre d'\'el\'ements
de $I\cap J$ entre $p$ et $q$.
\end{property}




---

# Example

Let
$$
A_2=\left(
\begin{matrix}
a_{11} & a_{12} \\
a_{21} & a_{22} 
\end{matrix}
\right),\quad
A_3=\left(
\begin{matrix}
a_{11} & a_{12} & a_{13} \\
a_{21} & a_{22} & a_{23} \\
a_{31} & a_{32} & a_{33}
\end{matrix}
\right)
$$
$$
A_4=\left(
\begin{matrix}
a_{11} & a_{12} & a_{13} & a_{14} \\
a_{21} & a_{22} & a_{23} & a_{24} \\
a_{31} & a_{32} & a_{33} & a_{34} \\
a_{41} & a_{42} & a_{43} & a_{44}
\end{matrix}
\right)
$$

---

Then
$$
A_2^{[2]}=a_{11}+a_{22},\quad
A_3^{[2]}=\left(
\begin{matrix}
a_{11}+a_{22} & a_{23} & -a_{13} \\
a_{32} & a_{11}+a_{33} & a_{12} \\
-a_{31} & a_{21} & a_{22}+a_{33}
\end{matrix}
\right)
$$


---

$$
A_4^{[2]}=\left(
\begin{matrix}
a_{11}+a_{22} & a_{23} & a_{24} & -a_{13} & -a_{14} & 0 \\
a_{32} & a_{11}+a_{33} & a_{34} & a_{12} & 0 & -a_{14} \\
a_{42} & a_{43} & a_{11}+a_{44} & 0 & a_{12} & a_{13} \\
-a_{31} & a_{21} & 0 & a_{22}+a_{33} & a_{34} & -a_{24} \\
-a_{41} & 0 & a_{21} & a_{43} & a_{22}+a_{44} & a_{23} \\
0 & -a_{41} & a_{31} & -a_{42} & a_{32} & a_{33}+a_{44}
\end{matrix}
\right)
$$
$$
A_3^{[3]}=a_{11}+a_{22}+a_{33}
$$
$$
A_4^{[3]}=\left(
\right)
$$

---

<div align=justify 
style="background-color:#16a085;
border-radius:20px;
padding:10px 20px 10px 20px;
box-shadow: 0px 1px 5px #999;">

Soit $A,B$ deux $n\times n$-matrices. Alors,
 
- Le nombre d'\'el\'ements non nuls hors diagonale de $A^{[k]}$
  est \'egal \`a $C(n-2,k-1)$ fois le nombre d'\'el\'ements non nuls
  hors diagonale de $A$.
- $A^{[1]}=A$, $A^{[n]}=\tr A$.
- $(A+B)^{[k]}=A^{[k]}+B^{[k]}$ (d'o\`u le suffixe
  *additive}).
- Soit $S$ une $n\times n$-matrice non singuli\`ere. Alors
  $(SAS)^{[k]}=S^{{k}}A^{[k]}(S^{-1})^{(k)}$.
</div>

---

Soit $A$ une $m\times m$-matrice. On note $A^{[2]}$ la seconde matrice compound de $A$ (sur le sujet des matrices compos\'ees, on consultera par exemple ...).

<div align=justify 
style="background-color:#16a085;
border-radius:20px;
padding:10px 20px 10px 20px;
box-shadow: 0px 1px 5px #999;">

Soit $A$ une $m\times m$-matrice \`a entr\'ees r\'eelles. Pour que $A$
ait ses valeurs propres \`a parties r\'eelles strictement n\'egatives,
il faut et il suffit que
1. la deuxi\`eme matrice compound additive $A^{[2]}$ ait ses valeurs propres \`a parties r\'eelles strictement n\'egatives
2. $(-1)^m\det(A)>0$
</div>

---

# Role in stability

Soit le syst\`eme diff\'erentiel
\begin{equation}\label{sys:diff_general}
x'=f(x)
\end{equation}
On a le th\'eor\`eme qui suit.
<div align=justify 
style="background-color:#16a085;
border-radius:20px;
padding:10px 20px 10px 20px;
box-shadow: 0px 1px 5px #999;">

[Li \& Muldowney, 1995]\label{th:LM1}
Une condition suffisante pour qu'une orbite p\'eriodique $\gamma=\{p(t):0\leq t\leq\omega\}$ de (\ref{sys:diff_general}) soit asymptotiquement orbitalement stable avec phase asymptotique est que le syst\`eme lin\'eaire
$$
z'(t)=\left(\frac{\partial f^{[2]}}{\partial x}
  \left(p(t)\right)\right)z(t)
$$
soit asymptotiquement stable
</div>

---

{Mod\`eles multigroupes}
Mod\`eles sensiblement similaires aux mod\`eles de m\'etapopulations. 
 
- Individus vivant dans un m\^eme lieu.
- Diff\'erents groupes (sociaux, pratiques sexuelles, etc.).
- Param\`etres de m\'elange entre les groupes.

Mod\`eles de maisonn\'ees.
 
- Individu infect\'e est retir\'e de la population g\'en\'erale et
  plac\'e dans une maison, o\`u les taux d'infections sont
  compl\`etement diff\'erents.

Mod\`ele avec un groupe noyau.
 
- 
Vient de l'observation que certaines maladies semblent \^etre mieux  propag\'ees par quelques individus (**super spreaders**)



