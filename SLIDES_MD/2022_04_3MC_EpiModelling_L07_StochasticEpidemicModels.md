---
marp: true
title: Stochastic epidemic models
description: 3MC Course Epidemiological Modelling - Julien Arino - Lecture 07 - Stochastic epidemic models
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

# Stochastic epidemic models

6 April 2022 

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

# Remarks / Resources

This is a *user-oriented* course: I barely, if at all, touch on the algorithms; instead, I focus on how to use them

Code is available in [this Github repo](https://github.com/julien-arino/3MC-course-epidemiological-modelling) in the CODE directory

Some of the slides are inspired from slides given to me by Linda Allen (Texas Tech). I recommend books and articles by Linda for more detail

---

# Running example - SIS model without demography

Constant total population $P^\star$

<span style="display: block; margin-left: auto; margin-right: auto; width: 25%">![width:400px](figure_SIS_base_no_demography.png)</span>

Basic reproduction number:
$$\mathcal{R}_0 = \dfrac{\beta}{\gamma}P^\star$$

---

# In the deterministic world, $\mathcal{R}_0$ rules the world

If $\mathcal{R}_0=\beta P^\star/\gamma<1$, the disease dies out (*disease-free* equilibrium); if $\mathcal{R}_0>1$, it becomes established at an *endemic* equilibrium $I^\star=P^\star-\gamma/\beta=(1-1/\mathcal{R}_0)P^\star$

$P^\star = 100$K, $\gamma=1/5$, $\mathcal{R}_0=\{0.8,1.5,2.5\}$ (and $\beta=\gamma \mathcal{R}_0/P^\star$)

---

![bg contain](https://raw.githubusercontent.com/julien-arino/presentations/main/FIGS/stochastic/ODE_SIS.png)

---

# In the stochastic world, make that ''$\mathcal{R}_0$ rules-*ish*''

![height:600px](https://raw.githubusercontent.com/julien-arino/presentations/main/FIGS/stochastic/several_CTMC_sims.png)

---

# When $I_0=2$, extinctions happen quite frequently

![height:600px](https://raw.githubusercontent.com/julien-arino/presentations/main/FIGS/stochastic/extinctions_fct_R0.png)

---

# Types of stochastic systems discussed today

- Discrete-time Markov chains (DTMC)
- Continuous-time Markov chains (CTMC)

But there are many others. Of note: 
- Branching processes (BP)
- Stochastic differential equations (SDE)

---

# Deterministic systems incorporate uncertainty !

Before proceeding with stochastic systems: one often hears that deterministic systems do not incorporate stochasticity. This is **false** !

However, they do so in a predictable way, e.g., using means of distributions

---

# Small variation on the SIS model

Assume that time of sojourn in $I$ compartment is distributed following $f(t)$ with survival function $\mathcal{P}(t)=1-\int_0^tf(s)ds$, i.e., fraction $\mathcal{P}(t-t_0)$ of individuals who became infectious at time $t_0$ remain infective at time $t\geq t_0$


Integral equation for the number of infectious individuals: 
$$
I(t) = I_0(t)+ \int_0^t\beta[P^\star-I(u)]I(u) \mathcal{P}(t-u) du
$$
- $I_0(t)$ # individuals who were infective at time $t=0$ and still are at time $t$: $I_0(t)$ nonnegative, nonincreasing and s.t. $\lim_{t\to\infty}I_0(t)=0$
- $P(t-u)$ proportion of individuals who became infective at time $u$ and who still are at time $t$

---

# Case of exponentially distributed time to recovery

Suppose sojourn time in $I$ has exponential distribution with mean $1/\gamma$, $f(t) = \gamma e^{−\gamma t}$ 

Then $\mathcal{P}(t) = e^{−\gamma t}$, the initial condition function $I_0(t)$ takes the form
$$
I_0(t)=I_0(0)e^{-\gamma t}
$$
with $I_0(0)$ the number of infective individuals at time $t=0$ (obtained by considering the cohort of initially infectious individuals) and the integral equation becomes
$$
I(t)=I_0(0)e^{-\gamma t}+\int_0^t \beta[P^\star-I(u)]I(u) e^{-\gamma (t-u)}du
$$

---

Taking the time derivative of the integral equation yields
$$
\begin{aligned}
I'(t) &= -\gamma I_0(0)e^{-\gamma t}
-\gamma\int_0^t \beta[P^\star-I(u)]I(u)e^{-\gamma(t-u)}du \\
&\qquad +\beta [P^\star-I(t)]I(t) \\[0.2cm]
&= -\gamma\left(I_0(0)e^{-\gamma t}+
\int_0^t \beta[P^\star-I(u)]I(u)e^{-\gamma(t-u)}du\right) \\
&\qquad +\beta [P^\star-I(t)]I(t) \\[0.2cm]
&= \beta [P^\star-I(t)]I(t)-\gamma I(t) \\[0.5cm]
&= \beta S(t)I(t)-\gamma I(t)
\end{aligned}
$$


--- 

# How to - DTMCs

---

# Discrete-time Markov chains

$p(t)=(p_1(t),\ldots,p_n(t))^T$: probability vector, with $p_i(t)$ describing the probability that at time $t$, the system is in state $S_i$, $i=1,\ldots,n$

$\sum_i p_i(t)=1$ for all $t$, of course

State evolution governed by
$$
p(t+\Delta t) = A(\Delta t)p(t)
$$
where $A(\Delta t)$ is a stochastic matrix (row sums all equal 1), the *transition* matrix, with entry $a_{ij}=\mathbb{P}(X_{t+\Delta t}=s_i|X_t=s_j)$, where $X_1,\ldots$ sequence of random variables describing the state

If $A(\Delta t)=A$ constant, *homogeneous* DTMC

Time often ''recast'' so that $\Delta t=1$

---

# Important remark

The DTMC world lives at the interface between probabilists, who like to think of $p(t)$ as a row vector, $A(\Delta t)$ as a column-stochastic matrix and thus write
$$
p(t+\Delta t) = p(t)A(\Delta t)
$$
and linear algebraists, who prefer column vectors and row-stochastic matrices, 
$$
p(t+\Delta t) = A(\Delta t)p(t)
$$

So check the direction to understand whether you are using $A$ or $A^T$

---

# Advantages of DTMC

As a teacher of modelling: base theory of DTMC uses a lot of linear algebra and graph theory; usually really appreciated by students

*Regular* DTMC (with *primitive* transition matrices) allow to consider equilibrium distribution of probability

*Absorbing* DTMC (with *reducible* transition matrices) allow the consideration of time to absorption, mean first passage time, etc.

See for instance book of Kemeny and Snell

---

# DTMC for example SIS system

Since $S=P^\star-I$, consider only the infected. To simulate as DTMC, consider a random walk on $I$ ($\simeq$ Gambler's ruin problem)

Denote $\lambda_I = \beta (P^\star-I)I\Delta t$, $\mu_I = \gamma I\Delta t$ and $\sigma_I=1-(\lambda_I+\mu_I)\Delta t$

![width:1200px](figure_SIS_random_walk.png)

---

# Transition matrix

$$
A = 
\begin{pmatrix}
1 & 0 \\
\mu_1 & \sigma_1 & \lambda_1 & 0 \\
0 & \mu_2 & \sigma_2 & \lambda_2 & 0 \\
\\
& & & & & \ddots \\
\\
& & & & &  & 0 & \mu_{P^\star-1} & \mu_{P^\star-1} & \lambda_{P^\star-1} & 0 \\
&&&&&&&& 0 & \mu_{P^\star} & \sigma_{P^\star}
\end{pmatrix}
$$

---

```
# Make the transition matrix
T = mat.or.vec(nr = (Pop+1), nc = (Pop+1))
for (row in 2:Pop) {
  I = row-1
  mv_right = gamma*I*Delta_t # Recoveries
  mv_left = beta*I*(Pop-I)*Delta_t # Infections
  T[row,(row-1)] = mv_right
  T[row,(row+1)] = mv_left
}
# Last row only has move left
T[(Pop+1),Pop] = gamma*(Pop)*Delta_t
# Check that we don't have too large values
if (max(rowSums(T))>1) {
  T = T/max(rowSums(T))
}
diag(T) = 1-rowSums(T)
```


---

# Simulating a DTMC

```
library(DTMCPack)
sol = MultDTMC(nchains = 20, tmat = T, io = IC, n = t_f)
```
gives 20 realisations of a DTMC with transition matrix ``T``, initial conditions ``IC`` (a vector of initial probabilities of being in the different $I$ states) and final time ``t_f``

See code on [Github](https://github.com/julien-arino/UK-APASI)

---

![bg contain](https://raw.githubusercontent.com/julien-arino/presentations/main/FIGS/stochastic/several_DTMC_sims.png)

---

# Going a bit further

`DTMCPack` is great for obtaining realisations of a DTMC, but to study it in more detail, `markovchain` is much more comprehensive

```
library(markovchain)
mcSIS <- new("markovchain", 
             states = sprintf("I_%d", 0:Pop),
             transitionMatrix = T,
             name = "SIS")
```

Note that interestingly, `markovchain` overrides the weird default "`*` is Hadamard, `%*%` is usual" `R` matrix product rule, so `mcSIS*mcSIS` does $TT$, not $T\circ T$

---

```
> summary(mcSIS)
SIS  Markov chain that is composed by: 
Closed classes: 
I_0 
Recurrent classes: 
{I_0}
Transient classes: 
{I_1,I_2,I_3,I_4,I_5,I_6,I_7,I_8,I_9,I_10,I_11,I_12,I_13,I_14,I_15,
I_16,I_17,I_18,I_19,I_20,I_21,I_22,I_23,I_24,I_25,I_26,I_27,I_28,
I_29,I_30,I_31,I_32,I_33,I_34,I_35,I_36,I_37,I_38,I_39,I_40,I_41,
I_42,I_43,I_44,I_45,I_46,I_47,I_48,I_49,I_50,I_51,I_52,I_53,I_54,
I_55,I_56,I_57,I_58,I_59,I_60,I_61,I_62,I_63,I_64,I_65,I_66,I_67,
I_68,I_69,I_70,I_71,I_72,I_73,I_74,I_75,I_76,I_77,I_78,I_79,I_80,
I_81,I_82,I_83,I_84,I_85,I_86,I_87,I_88,I_89,I_90,I_91,I_92,I_93,
I_94,I_95,I_96,I_97,I_98,I_99,I_100}
The Markov chain is not irreducible 
The absorbing states are: I_0
```

---

<span style="font-size:25px;">

Function | Role
--- | ---
`absorbingStates` | absorbing states of the transition matrix, if any
`steadyStates` | the vector(s) of steady state(s) in matrix form
`meanFirstPassageTime` | matrix or vector of mean first passage times
`meanRecurrenceTime` | vector of mean number of steps to return to each recurrent state
`hittingProbabilities` | matrix of hitting probabilities for a Markov chain
`meanAbsorptionTime` | expected number of steps for a transient state to be absorbed by any recurrent class
`absorptionProbabilities` | $\mathbb{P}$ transient states being absorbed by each recurrent state
`canonicForm` | canonic form of transition matrix
`period` | the period of an irreducible DTMC
`summary` | DTMC summary

</span>

---

# How to - CTMCs

---

# Continuous-time Markov chains

CTMC similar to DTMC except in way they handle time between events (transitions)

DTMC: transitions occur each $\Delta t$

CTMC: $\Delta t\to 0$ and transition times follow an exponential distribution parametrised by the state of the system

Recall from course last month: CTMC are roughly equivalent to ODE

---

# ODE to CTMC : focus on different components

![width:600px](https://raw.githubusercontent.com/julien-arino/presentations/main/FIGS/flow-diagrams/figure_SIS_no_demography_ODE.png)  ![width:400px](https://raw.githubusercontent.com/julien-arino/presentations/main/FIGS/flow-diagrams/figure_SIS_no_demography_CTMC.png)

---


Weight | Transition | Effect 
--- | --- | ---
$\beta SI$ | $S\to S-1$, $I\to I+1$ | new infection of a susceptible 
$\gamma I$ | $S\to S+1$, $I\to I-1$ | recovery of an infectious 

Will use $S=N^*-I$ and omit $S$ dynamics


---

# Gillespie's algorithm (SIS model with only I eq.)

set $t\leftarrow t_0$ and $I(t)\leftarrow I(t_0)$
while {$t\leq t_f$}
- $\xi_t\leftarrow \beta (P^\star-i)i+\gamma i$
- Draw $\tau_t$ from $T\thicksim \mathcal{E}(\xi_t)$
- $v\leftarrow\left[\beta (P^\star-i)i,\xi_t\right]/\xi_t$
- Draw $\zeta_t$ from $\mathcal{U}([0,1])$
- Find $pos$ such that $v_{pos-1}\leq\zeta_t\leq v_{pos}$
- switch {$pos$}
-- 1: New infection, $I(t+\tau_t)=I(t)+1$
-- 2: End of infectious period, $I(t+\tau_t)=I(t)-1$
- $t\leftarrow t+\tau_t$

---

# Simulating a CTMC

```
library(GillespieSSA2)
IC <- c(S = (Pop-I_0), I = I_0)
params <- c(gamma = gamma, beta = beta)
reactions <- list(
  reaction("beta*S*I", c(S=-1,I=+1), "new_infection"),
  reaction("gamma*I", c(S=+1,I=-1), "recovery")
)
set.seed(NULL)
sol <- ssa(
    initial_state = IC,
    reactions = reactions,
    params = params,
    method = ssa_exact(),
    final_time = t_f,
)
plot(sol$time, sol$state[,"I"], type = "l",
     xlab = "Time (days)", ylab = "Number infectious")
```

---

![bg contain](https://raw.githubusercontent.com/julien-arino/presentations/main/FIGS/stochastic/one_CTMC_sim.png)

---

To see multiple realisations: good idea to parallelise, then interpolate results. Write a function, e.g.,  `run_one_sim` that .. runs one simulation, then..

```
no_cores <- detectCores()-1
cl <- makeCluster(no_cores)
clusterEvalQ(cl,{
  library(GillespieSSA2)
})
clusterExport(cl,
              c("params",
                "run_one_sim"),
              envir = .GlobalEnv)
SIMS = parLapply(cl = cl, 
                 X = 1:params$number_sims, 
                 fun =  function(x) run_one_sim(params))
stopCluster(cl)
```

See `simulate_CTMC_parallel.R` on [Github](https://github.com/julien-arino/UK-APASI)

---

![bg contain](https://raw.githubusercontent.com/julien-arino/presentations/main/FIGS/stochastic/many_CTMC_sims_with_means.png)

---

# Benefit of parallelisation

Run the parallel code for 100 sims between `tictoc::tic()` and `tictoc::toc()`, giving `66.958 sec elapsed`, then the sequential version
```
tictoc::tic()
SIMS = lapply(X = 1:params$number_sims, 
              FUN =  function(x) run_one_sim(params))
tictoc::toc()
```
which gives `318.141 sec elapsed` on a 6C/12T Intel(R) Core(TM) i9-8950HK CPU @ 2.90GHz (4.75$\times$ faster) or `12.067 sec elapsed` versus `258.985 sec elapsed` on a 32C/64T AMD Ryzen Threadripper 3970X 32-Core Processor (21.46$\times$ faster !)

