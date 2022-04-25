---
marp: true
title: Stochastic aspects in the spread of epidemics
description: Lecture 06 - 3MC Course Epidemiological Modelling - Julien Arino - Stochastic aspects in the spread of epidemics
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
# Lecture 06 - Stochastic aspects in the spread of epidemics

6 April 2022 

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
- Why stochastic systems?
- More on sojourn times
- What types of stochastic systems?

---

<!-- _backgroundImage: "linear-gradient(to bottom, #f1c40f, 20%, white)" -->
# <!-- fit -->Why stochastic systems?

---

# Why stochastic systems?

- Life results from the interaction of countless processes

- Each process happens with some degree of imprecision. E.g., when a virus replicates, it misses a base here and there; when a cell undergoes mitosis, material is not split 50-50; when you meet another human, you *forget* to shake their hand. Etc.

- Because of repetition, this gives rise to uncertainty

- Stochastic systems incorporate uncertainty

---

<!-- _backgroundImage: "linear-gradient(to bottom, #f1c40f, 20%, white)" -->
# <!--fit-->More on sojourn times

## <!--fit-->Deterministic models incorporate stochasticity, they just hide it

- Some (simple) probability theory
- The exponential distribution
- A cohort model
- Sojourn times in an SIS disease transmission model
- An $SL_1L_2I_1I_2A_1A_2R$ COVID-19 model : "making Erlangs"

---

- Contrary to common claim, ODEs and the like do incorporate stochasticity, they simply do so in a way that makes it not apparent
- Most models considered in this course (ODE or CTMC) assume exponential sojourn times in compartments

---

<!-- _backgroundImage: "linear-gradient(to bottom, #156C26, 20%, white)" -->
# Some (simple) probability theory

---

# Some probability theory

Suppose that a system can be in two states, $S_1$ and $S_2$

- At time $t=0$, system is in state $S_1$
- An event happens at some time $t=\tau$, which triggers the switch from state $S_1$ to state $S_2$

A **random variable** is a variable that takes random values, that is, a mapping from random experiments to numbers

Let us call $T$ the random variable 
> time spent in state $S_1$ before switching into state $S_2$

---

States can be anything:

- $S_1$: working, $S_2$: broken;
- $S_1$: infected, $S_2$: recovered;
- $S_1$: alive, $S_2$: dead;
- $\ldots$

We take a collection of objects or individuals in state $S_1$ and want some law for the **distribution** of the times spent in $S_1$, i.e., a law for $T$

For example, we make light bulbs and would like to tell our customers that on average, our light bulbs last 200 years..

For this, we conduct an **infinite** number of experiments, and observe the time that it takes, in every experiment, to switch between $S_1$ and $S_2$

From this, deduce a *model*, which in this context is called a **probability distribution**

---

![bg contain](https://raw.githubusercontent.com/julien-arino/3MC-course-epidemiological-modelling/main/FIGS/random_length_sample.png)

---

# Discrete vs continuous random variables

We assume that $T$ is a **continuous** random variable, that is, $T$ takes continuous values. Examples of continuous r.v.: 

- height or age of a person (if measured very precisely)
- distance
- time


Another type of random variables are **discrete** random variables, which take values in a denumerable set. Examples of discrete r.v.:

- heads or tails on a coin toss
- the number rolled on a dice
- height of a person, if expressed rounded without subunits, age of a person in years (without subunits)

---

# Probability

A **probability** is a function $\mathcal{P}$, from a probability space to $[0,1]$

Formally: $(\Omega,\mathcal{F},\mathcal{P})$ is a probability space, with $\Omega$ the **sample** space, $\mathcal{F}$ a $\sigma$-algebra of subsets of $\Omega$ whose elements are the **events**, and $\mathcal{P}$ a **measure** from $\mathcal{F}$ to $[0,1]$ such that $\mathcal{P}(E)\geq 0$, $\forall E\subset\Omega$, $\mathcal{P}(\Omega)=1$ and $\mathcal{P}(E_1\cup E_2\cup\cdots)=\sum_i\mathcal{P}(E_i)$

Gives the likelihood of an event occurring, among all the events that are possible, in that particular setting. For example, $\mathbb{P}(\textrm{getting heads when tossing a coin})=1/2$ and $\mathbb{P}(\textrm{getting tails when tossing a coin})=1/2$

---

# Probability density function

Assume $T$ continuous; it has a continuous **probability density function** $f$

- $f\geq 0$
- $\int_{-\infty}^{+\infty}f(s)ds=1$
- $\mathbb{P}(a\leq T\leq b)=\int_a^bf(t)dt$

![width:450px center](https://raw.githubusercontent.com/julien-arino/3MC-course-epidemiological-modelling/main/FIGS/distrib_a_b.png)

---

# Cumulative distribution function

The cumulative distribution function (c.d.f.) is a function $F(t)$ that characterizes the distribution of $T$, and defined by
$$
F(s)=\mathbb{P}(T\leq s)=\int_{-\infty}^sf(x)dx
$$

![width:500px center](https://raw.githubusercontent.com/julien-arino/3MC-course-epidemiological-modelling/main/FIGS/cdf_auc.png)

---

# Properties of the c.d.f.

- Since $f$ is a nonnegative function, $F$ is nondecreasing
- Since $f$ is a probability density function, $\int_{-\infty}^{+\infty}f(s)ds=1$, and thus $\lim_{t\to\infty}F(t)=1$

![width:550px center](https://raw.githubusercontent.com/julien-arino/3MC-course-epidemiological-modelling/main/FIGS/cdf_plot.png)

---

# Mean value

For a continuous random variable $T$ with probability density function $f$, the **mean** value of $T$, denoted $\bar T$ or $E(T)$, is given by
$$
\tag{1}\label{eq:mean_value}
E(T)=\int_{-\infty}^{+\infty} tf(t)dt
$$

---

# Survival function

Another characterization of the distribution of the random variable $T$ is through the **survival** (or **sojourn**) function


The survival function of state $S_1$ is given by
$$
\begin{equation}\tag{2}\label{eq:survival}
  \mathcal{S}(t)=1-F(t)=\mathbb{P}(T>t)
\end{equation}
$$
This gives a description of the **sojourn time** of a system in a particular state (the time spent in the state)

$\mathcal{S}$ is a nonincreasing function (since $\mathcal{S}=1-F$ with $F$ a c.d.f.), and $\mathcal{S}(0)=1$ (since $T$ is a positive random variable)

---

The **average sojourn time** $\tau$ is
$$
\tau=E(T)=\int_0^\infty tf(t)dt
$$
Since $\lim_{t\to\infty}t\mathcal{S}(t)=0$,
$$
\tag{3}\label{eq:mean_sojourn_time}
\tau=\int_0^\infty \mathcal{S}(t)dt
$$

**Expected future lifetime**
$$
\tag{4}\label{eq:expected_future_lifetime}
\frac{1}{\mathcal{S}(t_0)} \int_0^{\infty} t\,f(t+t_0)\,dt 
$$

---

# Hazard (or failure) rate

The **hazard rate** (or **failure rate**) is
$$
\begin{align*}
h(t) &= \lim_{\Delta t\to 0}\frac{\mathcal{S}(t)-\mathcal{S}(t+\Delta t)}{\Delta t} \\
& = \lim_{\Delta t\to 0} \frac{\mathbb{P}( T<t+\Delta t | T\geq t)}{\Delta t} \\
&= \frac{f(t)}{\mathcal{S}(t)}
\end{align*}
$$

Gives probability of failure between $t$ and $\Delta t$, given survival to $t$

We have
$$
\tag{5}\label{eq:hazard_rate}
h(t)=-\frac{d}{dt}\ln\mathcal{S}(t)
$$

---

<!-- _backgroundImage: "linear-gradient(to bottom, #156C26, 20%, white)" -->
# The exponential distribution

---

# The exponential distribution

The random variable $T$ has an **exponential** distribution if its probability density function takes the form

$$
\begin{equation}\label{eq:exp_distrib}\tag{6}
f(t)=\begin{cases}0&\textrm{if }t<0,\\
\theta e^{-\theta t}&\textrm{if }t\geq 0,
\end{cases}
\end{equation}
$$
with $\theta>0$. Then the survival function for state $S_1$ is of the form $\mathcal{S}(t)=e^{-\theta t}$, for $t\geq 0$, and the average sojourn time in state $S_1$ is
$$
\tau=\int_0^\infty e^{-\theta t}dt=\frac 1\theta
$$

---

# The Dirac distribution

If on the other hand, for some constant $\omega>0$,
$$\tag{7}\label{eq:diract_distribution}
\mathcal{S}(t)=
\left\{
\begin{array}{ll}
1, & 0\leq t\leq\omega \\
0, & \omega<t
\end{array}
\right.
$$
which means that $T$ has a Dirac delta distribution $\delta_\omega(t)$, then the average sojourn time is a constant, namely
$$
\tau=\int_0^\omega dt=\omega
$$
These two distributions can be regarded as extremes

---

<!-- _backgroundImage: "linear-gradient(to bottom, #156C26, 20%, white)" -->
# A cohort model

---

# A model for a cohort with one cause of death 

We consider a population consisting of individuals born at the same time (a **cohort**), for example, the same year

We suppose

- At time $t=0$, there are initially $N_0>0$ individuals
- All causes of death are compounded together
- The time until death, for a given individual, is a random variable $T$, with continuous probability density distribution $f(t)$ and survival function $P(t)$

---

# The model

Denote $N(t)$ the population at time $t\geq 0$. Then

$$
\begin{equation}\label{eq:N_general}\tag{8}
N(t)=N_0P(t)
\end{equation}
$$

$N_0P(t)$ gives the proportion of $N_0$, the initial population, that is still alive at time $t$

---

# Case where $T$ is exponentially distributed

Suppose that $T$ has an exponential distribution with mean $1/d$ (or parameter $d$), $f(t)=de^{-dt}$. Then the survival function is $P(t)=e^{-dt}$ and $\eqref{eq:N_general}$ takes the form

$$
\begin{equation}\label{eq:N}\tag{9}
N(t)=N_0e^{-dt}
\end{equation}
$$
Now note that
$$
\begin{align*}
\frac{d}{dt} N(t) &= -dN_0e^{-dt} \\
&= -dN(t),
\end{align*}
$$
with $N(0)=N_0$

$\implies$ The ODE $N'=-dN$ makes the assumption that the life expectancy at birth is exponentially distributed

---

# Case where $T$ has a Dirac delta distribution

Suppose that $T$ has a Dirac delta distribution at $t=\omega$, giving the survival function 
$$
P(t)=\begin{cases}
1, & 0\leq t\leq\omega\\
0, & t>\omega
\end{cases}
$$
Then $\eqref{eq:N_general}$ takes the form
$$
\begin{equation}\label{eq:N2}
N(t)=\begin{cases}
N_0, & 0\leq t\leq\omega\\
0, & t>\omega
\end{cases}
\end{equation}
$$
All individuals survive until time $\omega$, then they all die at time $\omega$

Here, we have $N'=0$ everywhere except at $t=\omega$, where it is undefined

---

<!-- _backgroundImage: "linear-gradient(to bottom, #156C26, 20%, white)" -->
# <!--fit-->Sojourn times in an SIS disease transmission model

---

![bg 80% right:40%](https://raw.githubusercontent.com/julien-arino/3MC-course-epidemiological-modelling/main/FIGS/figure_SIS_base_no_demography_general_recovery_vertical.png)

# <!--fit-->An SIS with tweaked recovery

Traditional ODE models assume recovery from disease at *per capita* rate (often denoted $\gamma$)

Here, assume that, of the individuals who have become infective at time $t_0$, a fraction $P(t-t_0)$ remain infective at time $t\geq t_0$

Thus, considered for $t\geq 0$, the function $P(t)$ is a survival function

---

# Reducing the dimension of the problem

We have
$$
S(t)+I(t)=N, \textrm{ or equivalently, }S(t)=N-I(t)
$$

$N$ is constant (equal total population at time $t=0$), so we can deduce the value of $S(t)$, once we know $I(t)$, from the equation $S(t)=N-I(t)$

---

# Model for infectious individuals

Integral equation for the number of infective individuals:
$$
\begin{equation}
I(t) = I_0(t)+ \int_0^t\beta\frac{(N-I(u))I(u)}{N} P(t-u) du
\label{eq:SIS_I}\tag{10} 
\end{equation}
$$

- $I_0(t)$ number of individuals who were infective at time $t=0$ and still are at time $t$
  - $I_0(t)$ is nonnegative, nonincreasing, and such that $\lim_{t\to\infty}I_0(t)=0$
- $P(t-u)$ proportion of individuals who became infective at time $u$ and
who still are at time $t$
- $\beta (N-I(u))S(u)/N$ is $\beta S(u)I(u)/N$ with $S(u)=N-I(u)$, from the reduction of dimension

---

# Expression under the integral

Integral equation for the number of infective individuals: 

$$
\begin{equation}
I(t) = I_0(t)+ \int_0^t\beta\frac{(N-I(u))I(u)}{N} P(t-u) du
\tag{\ref{eq:SIS_I}} 
\end{equation}
$$
The term
$$
\beta\frac{(N-I(u))I(u)}{N} P(t-u)
$$

- $\beta (N-I(u))I(u)/N$ is the rate at which new infectives are created, at time $u$,
- multiplying by $P(t-u)$ gives the proportion of those who became infectives at time $u$ and who still are at time $t$

Summing over $[0,t]$ gives the number of infective individuals at time $t$

---

# <!--fit-->Case of an exponentially distributed time to recovery
Suppose that $P(t)$ is such that the sojourn time in the infective state has an exponential distribution with mean $1/\gamma$, i.e., $P(t)=e^{-\gamma t}$

Then the initial condition function $I_0(t)$ takes the form
$$
I_0(t)=I_0(0)e^{-\gamma t}
$$
with $I_0(0)$ the number of infective individuals at time $t=0$. This is obtained by considering the cohort of initially infectious individuals, giving a model such as $\eqref{eq:N_general}$

Equation $\eqref{eq:SIS_I}$ becomes
$$
\begin{equation}\label{eq:I_ODE}\tag{11}
I(t)=I_0(0)e^{-\gamma t}+\int_0^t \beta\frac{(N-I(u))I(u)}{N} e^{-\gamma (t-u)}du
\end{equation}
$$

---

Taking the time derivative of $\eqref{eq:I_ODE}$ yields
$$
\begin{align*}
I'(t) &= -\gamma I_0(0)e^{-\gamma t}-\gamma\int_0^t \beta\frac{(N-I(u))I(u)}{N}e^{-\gamma(t-u)}du \\
&\quad +\beta \frac{(N-I(t))I(t)}{N} \\
&= -\gamma\left(I_0(0)e^{-\gamma t}+
\int_0^t \beta\frac{(N-I(u))I(u)}{N}e^{-\gamma(t-u)}du\right) \\
&\quad +\beta \frac{(N-I(t))I(t)}{N} \\
&= \beta \frac{(N-I(t))I(t)}{N}-\gamma I(t)
\end{align*}
$$
which is the classical logistic type ordinary differential equation (ODE) for $I$ in an SIS model without vital dynamics (no birth or death)

---

# Case of a step function survival function

Consider case where the time spent infected has survival function 
$$
P(t)=\begin{cases}
1, & 0\leq t\leq\omega\\
0, & t>\omega
\end{cases}
$$
i.e., the sojourn time in the infective state is a constant $\omega>0$
 
In this case $\eqref{eq:SIS_I}$ becomes
$$
\begin{equation}\label{eq:I_DDE}\tag{12}
I(t)=I_0(t)+\int_{t-\omega}^t \beta\frac{(N-I(u))I(u)}{N} du
\end{equation}
$$
Here, it is more difficult to obtain an expression for $I_0(t)$. It is however assumed that $I_0(t)$ vanishes for $t>\omega$

---

When differentiated, $\eqref{eq:I_DDE}$ gives, for $t\geq\omega$
$$
I'(t)=I_0'(t)+\beta\frac{(N-I(t))I(t)}{N}
-\beta\frac{\left(N-I(t-\omega)\right)I(t-\omega)}{N}
$$
Since $I_0(t)$ vanishes for $t>\omega$, this gives the delay differential equation (DDE)
$$
I'(t)=\beta\frac{(N-I(t))I(t)}{N}
-\beta\frac{(N-I(t-\omega))I(t-\omega)}{N}
$$

---

# What we know this far

- The time of sojourn in compartments plays an important role in determining the type of model that we deal with
- All ODE compartmental models, when they use terms of the form $\kappa X$, make the assumption that the time of sojourn in compartments is exponentially distributed with mean $1/\kappa$
- At the other end of the spectrum, delay differential with discrete delay $\tau$ make the assumption of a constant sojourn time $\tau$, equal for all individuals
- Both can be true sometimes.. but reality is often somewhere in between

---

Survival function, $\mathcal{S}(t)=\mathbb{P}(T>t)$, for an exponential distribution with mean 80 years

![width:800px center](https://raw.githubusercontent.com/julien-arino/3MC-course-epidemiological-modelling/main/FIGS/survival_exp_80years.png)

---

# The problems with the exponential distribution

- Survival drops quickly: in previous graph, 20% mortality of a cohort at age 20 years
- Survival extends way past the mean: in previous graph, almost 25% survival to age 120 years
- Acceptable if what matters is mean duration of sojourn over long time period
- Less so if interested in short term dynamics
- Exponential distribution with parameter $\theta$ has mean $1/\theta$ and variance $1/\theta^2$, i.e., one parameter controls both the mean and dispersion

---

<!-- _backgroundImage: "linear-gradient(to bottom, #156C26, 20%, white)" -->
# <!--fit-->An $SL_1L_2I_1I_2A_1A_2R$ COVID-19 model : "making Erlangs"

<div style = "position: relative; bottom: -40%; font-size:20px;">

JA & Portet. [A simple model for COVID-19](http://dx.doi.org/10.1016/j.idm.2020.04.002). *Infectious Disease Modelling* **5**:309-315 (2020)
</div>

---

# <!--fit-->Simple way to "fix" sojourn times: sums of exponential distributions

- Exponential distribution of sojourn times is acceptable if what matters is mean duration of sojourn over long time period
- For COVID-19, were trying to give "predictions" over 2-4 weeks period, so we need more than the mean

$\implies$ Use a property of exponential distributions, namely, that the sum of i.i.d. (independent and identically distributed) exponential distributions is Erlang distributed

---

# Sum of exponential distributions

$X_1$ and $X_2$ independent exponential r.v. with rate parameters $\theta_1$ and $\theta_2$. Then the p.d.f. of $Z=X_1+X_2$ is the convolution
$$
\begin{align}
 f_Z(z) &= \int_{-\infty}^\infty f_{X_1}(x_1) f_{X_2}(z - x_1)\,dx_1\\
   &= \int_0^z \theta_1 e^{-\theta_1 x_1} \theta_2 e^{-\theta_2(z - x_1)} \, dx_1 \\
   &= \theta_1 \theta_2 e^{-\theta_2 z} \int_0^z e^{(\theta_2 - \theta_1)x_1}\,dx_1 \\
   &= \begin{cases}
        \dfrac{\theta_1 \theta_2}{\theta_2-\theta_1} \left(e^{-\theta_1 z} - e^{-\theta_2 z}\right) & \text{ if } \theta_1 \neq \theta_2 \\[0.15cm]
        \theta^2 z e^{-\theta z} & \text{ if } \theta_1 = \theta_2 =: \theta
      \end{cases}
 \end{align}
 $$

---

# The Erlang distribution

P.d.f. of the Erlang distribution
$$
f(x; k,\lambda)={\lambda^k x^{k-1} e^{-\lambda x} \over (k-1)!},\quad x,\lambda \geq 0
$$
$k$ **shape parameter**, $\lambda$ **rate parameter** (sometimes use **scale parameter** $\beta = 1/\lambda$)

So, if $\theta_1=\theta_2$, $Z=X_1+X_2$ has distribution
$$
f_Z(z)=\theta^2e^{-\theta z}
$$
i.e., an Erlang distribution with shape parameter $k=2$ and rate parameter $\theta$

---

# Continuing..

$X_i$, $i=1,\ldots,N$, be exponential i.i.d. random variables with parameter $\theta$

Then $\sum_i X_i$ Erlang distributed with rate parameter $\theta$ and shape parameter $N$


---

# Properties of the Erlang distribution

An Erlang is a Gamma with shape parameter $k\in\mathbb{N}$. P.d.f. of the Erlang distribution
$$
f(t; k,\lambda)={\lambda^k t^{k-1} e^{-\lambda t} \over (k-1)!},\quad t,\lambda \geq 0
$$
$k$ **shape parameter**, $\lambda$ **rate parameter**

Mean $k/\lambda$, variance $k/\lambda^2$, c.d.f.
$$
F(t; k,\lambda) = 1 - \sum_{n=0}^{k-1}\frac{1}{n!}e^{-\lambda t}(\lambda t)^n
$$
and thus survival function
$$
\mathcal{S}(t; k,\lambda) = 
\sum_{n=0}^{k-1}\frac{1}{n!}e^{-\lambda t}(\lambda t)^n
$$

---

![width:1000px center](https://raw.githubusercontent.com/julien-arino/3MC-course-epidemiological-modelling/main/FIGS/expo_vs_erlang.png)

---

![bg contain drop-shadow](https://raw.githubusercontent.com/julien-arino/3MC-course-epidemiological-modelling/main/FIGS/flow_diagram_SLLIIAARRD.png)


---

<!-- _backgroundImage: "linear-gradient(to bottom, #f1c40f, 20%, white)" -->
# <!-- fit -->What types of stochastic systems?

---

# Chain binomial models

- Reed-Frost model from circa 1920
  - Infection spread from I individuals to others after adequate contact
  - Any S individual, after contact with an I individual in a given period, develops the infection and is infectious to others only within the following time period; in subsequent time periods, become R
  - Each individual has a fixed probability of coming into adequate contact with any other specified individual in the group within one time interval, and this probability is the same for every member of the group
  - Closed population
- Many variations since

---

# Discrete time Markov chains (DTMC)

- Will discuss later
- Equivalent of discrete time system but includes stochasticity
- Jump to next state depends only on current state(*memoryless property*)
- Easy to study using linear algebra

---

# Continuous time Markov chains (CTMC)

- Almost exact stochastic equivalent to ODE
- Conversion from ODE to CTMC and vice-versa is very easy for compartmental models
- Harder to study than DTMC but still quite amenable to analysis

---

# Branching processes

- Special case of CTMC .. or are CTMC special cases of BP?

---

# Stochastic differential equations

- Will confess some bias against these: "ODEs with noise added"

