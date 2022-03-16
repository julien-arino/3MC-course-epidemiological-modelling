---
marp: true
title: Some recent mathematical models for Covid-19, HIV/AIDS, TB, Hepatitis, Malaria
description: 3MC Course Epidemiological Modelling - Julien Arino - Course 09 - Some recent mathematical models for Covid-19, HIV/AIDS, TB, Hepatitis, Malaria
theme: default
paginate: false
size: 4K
---

# Some recent mathematical models for COVID-19, HIV/AIDS, TB, Hepatitis, Malaria, etc.

7 April 2022 

Julien Arino [![width:32px](https://raw.githubusercontent.com/julien-arino/presentations/main/FIGS/icons/email-round.png)](mailto:Julien.Arino@umanitoba.ca) [![width:32px](https://raw.githubusercontent.com/julien-arino/presentations/main/FIGS/icons/world-wide-web.png)](https://server.math.umanitoba.ca/~jarino) [![width:32px](https://raw.githubusercontent.com/julien-arino/presentations/main/FIGS/icons/github-icon.png)](https://github.com/julien-arino)

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

- Back to sojourn times
- Models of COVID-19

---

<!-- _backgroundImage: "linear-gradient(to bottom, #f1c40f, 20%, white)" -->
# <!--fit-->Back to sojourn times

---

- Most models considered in this course (ODE or CTMC) assume exponential sojourn times in compartments
- Acceptable as first approximation in many cases, but needs tweaking at times
- Has led to interesting models

---

<!-- _backgroundImage: "radial-gradient(white,80%,#156C26)" -->
# Back to sojourn times - Outline

- Some probability theory
- The exponential distribution
- A cohort model
- Sojourn times in an SIS disease transmission model
- An $SL_1L_2I_1I_2A_1A_2R$ COVID-19 model

---

<!-- _backgroundImage: "linear-gradient(to bottom, #156C26, 20%, white)" -->
# Some probability

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

From this, deduce a model, which in this context is called a **probability distribution**

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

Since $T$ is continuous, it has a continuous **probability density function**, $f$.

- $f\geq 0$
- $\int_{-\infty}^{+\infty}f(s)ds=1$
- $\mathbb{P}{a\leq T\leq b}=\int_a^bf(t)dt$

![width:450px center](https://raw.githubusercontent.com/julien-arino/3MC-course-epidemiological-modelling/main/FIGS/distrib_a_b.png)

---

# Cumulative distribution function

The cumulative distribution function (c.d.f.) is a function $F(t)$ that characterizes the distribution of $T$, and defined by
$$
F(s)=\mathbb{P}{T\leq s}=\int_{-\infty}^sf(x)dx
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
E(T)=\int_{-\infty}^{+\infty} tf(t)dt
$$

---

# Survival function

Another characterization of the distribution of the random variable $T$ is through the **survival** (or **sojourn**) function


The survival function of state $S_1$ is given by
$$
\begin{equation}
  \mathcal{S}(t)=1-F(t)=\mathbb{P}{T>t}
  \label{eq:survival}
\end{equation}
$$
This gives a description of the **sojourn time** of a system in a particular state (the time spent in the state)

$\mathcal{S}$ is a nonincreasing function (since $\mathcal{S}=1-F$ with $F$ a c.d.f.), and $\mathcal{S}(0)=1$ (since $T$ is a positive random variable)

---

The **average sojourn time** $\tau$ in state $S_1$ is given by
$$
\tau=E(T)=\int_0^\infty tf(t)dt
$$
Assuming that $\lim_{t\to\infty}t\mathcal{S}(t)=0$ (which is verified for most probability distributions), 
$$
\tau=\int_0^\infty \mathcal{S}(t)dt
$$

---

<!-- _backgroundImage: "linear-gradient(to bottom, #156C26, 20%, white)" -->
# The exponential distribution

---

# The exponential distribution

The random variable $T$ has an \textbf{exponential} distribution if its probability density function takes the form

$$
\begin{equation}\label{eq:exp_distrib}
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

If on the other hand, for some constant $\omega>0$,
$$
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
\begin{equation}\label{eq:N_general}
N(t)=N_0P(t)
\end{equation}
$$

$N_0P(t)$ gives the proportion of $N_0$, the initial population, that is still alive at time $t$

---

# Case where $T$ is exponentially distributed

Suppose that $T$ has an exponential distribution with mean $1/d$ (or parameter $d$), $f(t)=de^{-dt}$. Then the survival function is $P(t)=e^{-dt}$, and \eqref{eq:N_general} takes the form

$$
\begin{equation}\label{eq:N}
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
Then \eqref{eq:N_general} takes the form
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

![bg 80% right:40%](https://raw.githubusercontent.com/julien-arino/3MC-course-epidemiological-modelling/main/FIGS/SIS_general_P.png)

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
\label{eq:SIS_I} 
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

# Case of an exponentially distributed time to recovery
Suppose that $P(t)$ is such that the sojourn time in the infective state has an exponential distribution with mean $1/\gamma$, i.e., $P(t)=e^{-\gamma t}$

Then the initial condition function $I_0(t)$ takes the form
$$
I_0(t)=I_0(0)e^{-\gamma t}
$$
with $I_0(0)$ the number of infective individuals at time $t=0$. This is obtained by considering the cohort of initially infectious individuals, giving a model such as \eqref{eq:N_general}

Equation (\ref{eq:SIS_I}) becomes
$$
\begin{equation}\label{eq:I_ODE}
I(t)=I_0(0)e^{-\gamma t}+\int_0^t \beta\frac{(N-I(u))I(u)}{N} e^{-\gamma (t-u)}du
\end{equation}
$$

---

Taking the time derivative of \eqref{eq:I_ODE} yields
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
 
In this case (\ref{eq:SIS_I}) becomes
$$
\begin{equation}\label{eq:I_DDE}
I(t)=I_0(t)+\int_{t-\omega}^t \beta\frac{(N-I(u))I(u)}{N} du
\end{equation}
$$
Here, it is more difficult to obtain an expression for $I_0(t)$. It is however assumed that $I_0(t)$ vanishes for $t>\omega$

---

When differentiated, \eqref{eq:I_DDE} gives, for $t\geq\omega$
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

# Conclusion

- The time of sojourn in compartments plays an important role in determining the type of model that we deal with
- All ODE models, when they use terms of the form $\kappa X$, make the assumption that the time of sojourn in compartments is exponentially distributed
- At the other end of the spectrum, delay differential with discrete delay make the assumption of a constant sojourn time, equal for all individuals
- Both can be true sometimes.. but reality is often somewhere in between

---

Survival function, $\mathcal{S}(t)=\mathbb{P}(T>t)$, for an exponential distribution with mean 80 years

![width:800px center](https://raw.githubusercontent.com/julien-arino/3MC-course-epidemiological-modelling/main/FIGS/survival_exp_80years.png)

---

<!-- _backgroundImage: "linear-gradient(to bottom, #156C26, 20%, white)" -->
# An $SL_1L_2I_1I_2A_1A_2R$ COVID-19 model

<div style = "position: relative; bottom: -40%; font-size:20px;">

JA & Portet. [A simple model for COVID-19](http://dx.doi.org/10.1016/j.idm.2020.04.002). *Infectious Disease Modelling* **5**:309-315 (2020)
</div>

---

# <!--fit-->One way to fix "bad" sojourn times: sums of exponential distributions

- Exponential distribution of sojourn times is acceptable if what matters is mean duration of sojourn over long time period
- For COVID-19, were trying to give "predictions" over 2-4 weeks period, so we need more than the mean

$\implies$ Use a property of exponential distributions, namely, that the sum of i.i.d. exponential distributions is Erlang distributed

---

# Sum of exponential distributions

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

The EP $A_0=(0,0,0)$ is never an omega-limit point of a solution of \eqre{sys:SEI_TB_prop} with initial conditions s.t. $N>0$, $e,i\geq 0$ and $e+i\leq 1$
</div>

<div align=justify 
style="background-color:#16a085;
border-radius:20px;
padding:10px 20px 10px 20px;
box-shadow: 0px 1px 5px #999;">

If $\mathcal{R}_1<1$, alors $(0,0,0)$ n'est pas un point omega-limite de toute solution de \eqref{sys:SEI_TB} avec conditions initiales dans $\mathcal{R}^3_+\setminus\{(0,0,0)\}$
</div>

<div align=justify 
style="background-color:#16a085;
border-radius:20px;
padding:10px 20px 10px 20px;
box-shadow: 0px 1px 5px #999;">

Pour le syst\`eme \eqref{sys:SEI_TB}, si $\mathcal{R}_0\leq 1$ alors
$X_0=(N_0,0,0)$ est globalement asymptotiquement stable.
</div>

In the case $\mathcal{R}_0,\mathcal{R}_2>1$, global stability of $X_*$ is established in "esoteric" conditions..

---

<!-- _backgroundImage: "linear-gradient(to bottom, #f1c40f, 20%, white)" -->
# <!--fit-->SLIRS with non-constant population

---

# Liu, Levin & Iwasa

SIRS model of the form

$$
\begin{align*}
S' &= B(N)-dS-f(S,I)I+\nu R \\
I' &= f(S,I)I-(d+\gamma)I \\
R' &= \gamma I-(d+\nu)R
\end{align*}
$$

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

