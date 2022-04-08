---
marp: true
title: Practicum 02 - Model analysis, studying large-scale models in R
description: 3MC Course Epidemiological Modelling - Julien Arino - Practicum 02 - Model analysis, studying large-scale models in R
theme: default
paginate: false
math: mathjax
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

# Practicum 02 - Model analysis, studying large-scale models in R

5 April 2022 

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

<!-- _backgroundImage: "linear-gradient(to bottom, #f1c40f, 20%, white)" -->
# <!--fit-->Steps of the analysis

---

# Step 1 - Epidemic model or endemic model ?

- Often a source of confusion: analysis of epidemic models differs from analysis of endemic models!!
- Important to determine what you are dealing with
- Easy first test (can be wrong): is there demography?
  - Demography can lead to constant population, but if there is "flow" through the system (with, e.g., births = deaths), then there is demography
- Other (more complex) test: what is the nature of the DFE?

---

# Step 1 and a half - Computing the DFE

- If you are not yet sure whether you have an epidemic or endemic model, you need to compute the DFE (you will need it/them anyway)
- **Usually**: set all *infected* variables to 0 (I, L and I, etc.)
  - If you find a single or denumerable number of equilibria for the remaining variables, this is an endemic model
  - If you get something of the form "any value of $S$ works", this is an epidemic model

---

# Step 2 - Epidemic case

- Compute $\mathcal{R}_0$
- Usually: **do not** consider LAS properties of DFE, they are given
- Compute a final size (if feasible)

# Step 2 - Endemic case

- Compute $\mathcal{R}_0$ and deduce LAS properties of DFE
- (Optional) Determine direction of bifurcation at $\mathcal{R}_0=1$
- (Sometimes impossible) Determine GAS properties of DFE or EEP

---

# <!--fit-->Why considering LAS properties of epidemic model is wrong

Consider the IVP
$$
x'=f(x),\qquad x(t_0)=x_0
$$
and denote $x(t,x_0)$ its solution at time $t\geq t_0$ through the initial condition $(t_0,x_0)$

$x^\star$ is an **equilibrium point** if $f(x^\star)=0$

$x^\star$ is locally asymptotically stable (LAS) if $\exists\mathcal{S}\ni x^\star$ open in the domain of $f$ s.t. for all $x_0\in\mathcal{S}$, $x(t,x_0)\in\mathcal{S}$ for all $t\geq 0$ and furthermore, $\lim_{t\to\infty}x(t,x_0)=x^\star$

If there is a continuum of equilibria, then $x^\star\in\mathcal{C}$, some curve in the domain of $f$, s.t. $f(y^\star)=0$ for all $y^\star\in\mathcal{C}$. We say $x^\star$ is **not isolated**. But then any open neighbourhood of $x^\star$ contains elements of $\mathcal{C}$ and taking $x_0\in\mathcal{C}$, $x_0\neq x^\star$, implies that $\lim_{t\to\infty}x(t,x_0)=x_0\neq x^\star$. $x^\star$ is *locally stable* but not *locally asymptotically stable*!

---

<!-- _backgroundImage: "linear-gradient(to bottom, #f1c40f, 20%, white)" -->
# <!--fit-->Epidemic models

# Computation of $\mathcal{R}_0$

# Final size relation

---

# A method for computing $\mathcal{R}_0$ in epidemic models

- Arino, Brauer, PvdD, Watmough & Wu. [A final size relation for epidemic models](https://julien-arino.github.io/assets/pdf/papers/ArinoBrauerVdDWatmoughWu-2007-MBE4.pdf) (2007)
- This method is not universal! It works in a relatively large class of models, but not everywhere. If it doesn't work, the next generation matrix method (see later) does work, **but** should be considered only for obtaining the reproduction number, not to deduce LAS (cf. my remark earler)
- Here, I change the notation in the paper, for convenience

---

# Standard form of the system 

Suppose system can be written in the form

$$
\begin{align*}
\mathbf{S}' &= \mathbf{b}(\mathbf{S},\mathbf{I},\mathbf{R})-\mathbf{D}\beta(\mathbf{S},\mathbf{I},\mathbf{R})\mathsf{diag}(\mathbf{S})\mathbf{h}\mathbf{I} \\
\mathbf{I}' &= \mathbf{\Pi}\mathbf{D}\beta(\mathbf{S},\mathbf{I},\mathbf{R})\mathsf{diag}(\mathbf{S})\mathbf{h}\mathbf{I}-\mathbf{V}\mathbf{I} \\
\mathbf{R}' &= \mathbf{f}(\mathbf{S},\mathbf{I},\mathbf{R})+\mathbf{W}\mathbf{I}
\end{align*}
$$

where $\mathbf{S}\in\mathbb{R}^m$, $\mathbf{I}\in\mathbb{R}^n$ and $\mathbf{R}\in\mathbb{R}^k$ are susceptible, infected and removed compartments, respectively

IC are $\geq 0$ with at least one of the components of $\mathbf{I}(0)$ positive

---

$$
\mathbf{S}' = \mathbf{b}(\mathbf{S},\mathbf{I},\mathbf{R})-\mathbf{D}\beta(\mathbf{S},\mathbf{I},\mathbf{R})\mathsf{diag}(\mathbf{S})\mathbf{h}\mathbf{I}
$$
- $\mathbf{b}:\mathbb{R}_+^m\times\mathbb{R}_+^n\times\mathbb{R}_+^k\to\mathbb{R}^m$ continuous function encoding recruitment and death of uninfected individuals
- $\mathbf{D}\in\mathbb{R}^{m\times m}$ diagonal with diagonal entries $\sigma_i>0$ the relative susceptibilities of susceptible compartments, with convention that $\sigma_1=1$
- Matrix valued function $\beta:\mathbb{R}_+^m\times\mathbb{R}_+^n\times\mathbb{R}_+^k\to\mathbb{R}_+^{m\times m}$ represents infectivity, with $\beta_i$ scalar-valued and
$$
\beta(\mathbf{S},\mathbf{I},\mathbf{R})=\mathsf{diag}(
\beta_1(\mathbf{S},\mathbf{I},\mathbf{R}),\ldots,
\beta_m(\mathbf{S},\mathbf{I},\mathbf{R}))
$$
- $\mathsf{diag}(\mathbf{S})=\mathsf{diag}(S_1,\ldots,S_m)$
- $\mathbf{h}\in\mathbb{R}^{m\times n}$ has $i$th row the relative horizontal transmissions involved in $\beta_i$

---

$$
\mathbf{I}' = \mathbf{\Pi}\mathbf{D}\beta(\mathbf{S},\mathbf{I},\mathbf{R})\mathsf{diag}(\mathbf{S})\mathbf{h}\mathbf{I}-\mathbf{V}\mathbf{I} \\
$$

- $\mathbf{\Pi}\in\mathbb{R}^{n\times m}$ has $(i,j)$ entry the fraction of individuals in $j^{\textrm{th}}$ susceptible compartment that enter $i^{\textrm{th}}$ infected compartment upon infection
- $\mathbf{V}\in\mathbb{R}^{n\times n}$ describes transitions between infected states and removals from these states due to recovery or death

---

$$
\mathbf{R}' = \mathbf{f}(\mathbf{S},\mathbf{I},\mathbf{R})+\mathbf{W}\mathbf{I}
$$

- $\mathbf{f}:\mathbb{R}_+^m\times\mathbb{R}_+^n\times\mathbb{R}_+^k\to \mathbb{R}^k$ continuous function encoding flows into and out of removed compartments because of immunisation or similar processes
- $\mathbf{W}\in\mathbb{R}^{k\times n}$ has $(i,j)$ entry the rate at which individuals in the $j^{\textrm{th}}$ infected compartment move into the $i^{\textrm{th}}$ removed compartment

---

Suppose that $\mathbf{I}=\mathbf{0}$. The set $\{(\mathbf{S},\mathbf{0},\mathbf{R}), \mathbf{S}\in\mathbb{R}_+^m,\mathbf{R}\in\mathbb{R}_+^k\}$ is invariant under the flow of the system and defines the system without disease,

$$
\begin{align*}
\mathbf{S}' &= \mathbf{b}(\mathbf{S},\mathbf{0},\mathbf{R}) \\
\mathbf{R}' &= \mathbf{f}(\mathbf{S},\mathbf{0},\mathbf{R})
\end{align*}
$$

Let us suppose that $\mathbf{E}_0:=(\mathbf{S}_0,\mathbf{0},\mathbf{R}_0)$ is a locally stable equilibrium of the system without disease, i.e., one at which the Jacobian matrix
$$
J^\textrm{no dis}(\mathbf{S}_0,\mathbf{0},\mathbf{R}_0) =
\begin{pmatrix}
\frac{\partial}{\partial\mathbf{S}}\mathbf{b}(\mathbf{S}_0,\mathbf{0},\mathbf{R}_0) & \frac{\partial}{\partial\mathbf{R}}\mathbf{b}(\mathbf{S}_0,\mathbf{0},\mathbf{R}_0) \\
\frac{\partial}{\partial\mathbf{S}}\mathbf{f}(\mathbf{S}_0,\mathbf{0},\mathbf{R}_0) & \frac{\partial}{\partial\mathbf{R}}\mathbf{f}(\mathbf{S}_0,\mathbf{0},\mathbf{R}_0)
\end{pmatrix}
$$
has all its eigenvalues with nonpositive real parts

---

As $(\mathbf{S}_0,\mathbf{0},\mathbf{R}_0)$ is an equilibrium of the system without disease, it is such that $\mathbf{b}(\mathbf{S}_0,\mathbf{0},\mathbf{R}_0)=\mathbf{0}$ and $\mathbf{f}(\mathbf{S}_0,\mathbf{0},\mathbf{R}_0)=\mathbf{0}$; as a consequence, $(\mathbf{S}_0,\mathbf{0},\mathbf{R}_0)$ is also an equilibrium of the general system.
Let 
$$
\mathbf{f} = \mathbf{\Pi}\mathbf{D}\beta(\mathbf{S},\mathbf{I},\mathbf{R})\mathsf{diag}(\mathbf{S})\mathbf{h}
$$
Then $\mathbf{I}'$ eq. in the general system takes the form $\mathbf{I}' = (\mathbf{f}-\mathbf{V})\mathbf{I}$ and it follows that $(\mathbf{S}_0,\mathbf{0},\mathbf{R}_0)$ is locally stable if $\mathbf{f}|_{\mathbf{E}_0}-\mathbf{V}$ has all its eigenvalues with negative real parts and locally asymptotically stable if $J(\mathbf{S}_0,\mathbf{0},\mathbf{R}_0)$ has all its eigenvalues with negative real parts

---

Indeed, the Jacobian matrix of the original system with equations and variables presented in the order $\mathbf{I},\mathbf{S},\mathbf{R}$ takes the form of the block matrix
$$
J(\mathbf{S}_0,\mathbf{0},\mathbf{R}_0)
=
\begin{pmatrix}
\mathbf{f}|_{\mathbf{E}_0}-\mathbf{V} & \mathbf{0}  \\
\mathbf{*} & J^\textrm{no dis}(\mathbf{S}_0,\mathbf{0},\mathbf{R}_0)
\end{pmatrix}
$$

Let $A$ be a square matrix and $\sigma(A)$ is its spectrum; denote $\rho(A)=\max_{\lambda\in\sigma(A)}\{|\lambda|\}$ and $s(A)=\max_{\lambda\in\sigma(A)}\{\Re(\lambda)\}$ its spectral radius and spectral abscissa, respectively

It is shown in [PvdD & Watmough (2002)](https://doi.org/10.1016/S0025-5564(02)00108-6) that when $\mathbf{f}|_{\mathbf{E}_0}$ is a nonnegative matrix and $\mathbf{V}$ is a nonsingular M-matrix, then 
$$
s(\mathbf{f}|_{\mathbf{E}_0}-\mathbf{V})<\iff \rho(\mathbf{f}|_{\mathbf{E}_0}\mathbf{V}^{-1})<1
$$

---

At this point, similarly to [PvdD & Watmough (2002)](https://doi.org/10.1016/S0025-5564(02)00108-6), we cannot proceed much further in terms of the expression for $\mathcal{R}_0$. 
Indeed, in \cite{ArinoBrauerVdDWatmoughWu2007}, the matrix $\mathbf{f}|_{\mathbf{E}_0}$ has rank 1, which allows to much improve the expression for the spectral radius.
Here, in general, the matrix $\mathbf{D}\beta(\mathbf{S}_0,\mathbf{0},\mathbf{R}_0)\mathsf{diag}(\mathbf{S}_0)$ has full rank $m$ and in general, $\mathbf{f}|_{\mathbf{E}_0}$ has full rank $n$.

<div class="theorem">

Let
$$
\mathcal{R}_0 = \rho\left(
\mathbf{\Pi}\mathbf{D}\beta(\mathbf{S}_0,\mathbf{0},\mathbf{R}_0)\mathsf{diag}(\mathbf{S}_0)\mathbf{h}\mathbf{V}^{-1}
\right)
$$
If $\mathcal{R}_0<1$, the DFE $\mathbf{E}_0$ is locally asymptotically stable; if $\mathcal{R}_0>1$, the DFE $\mathbf{E}_0$ is unstable

</div>

---

# Final size relations

- Still use the same method
- But now need to assume that there is no demography, i.e., $\mathbf{b}(\mathbf{S},\mathbf{I},\mathbf{R})=\mathbf{0}_m$ and $\mathbf{f}(\mathbf{S},\mathbf{I},\mathbf{R})=\mathbf{0}_k$

---

Define the row vector $\mathbb{R}^m\ni\mathbf{\Gamma}=(\Gamma_1,\ldots,\Gamma_m)=\beta(\mathbf{S}_0,\mathbf{0},\mathbf{R}_0)\mathbf{h}\mathbf{V}^{-1}\mathbf{\Pi}\mathbf{D}$, then $\mathcal{R}_0=\mathbf{\Gamma}\mathbf{S}(0)$

If incidence is mass action, i.e., $\beta(\mathbf{S},\mathbf{I},\mathbf{R})=\beta$, then for $i=1,\ldots,m$,
$$
\frac{1}{\sigma_i}
\ln\left(\frac{\mathbf{S}_i(0)}{\mathbf{S}_i(\infty)}\right)
=
\mathbf{\Gamma}\mathbf{D}^{-1}\left(\mathbf{S}(0)-\mathbf{S}(\infty)\right)
+\beta(\mathbf{S}_0,\mathbf{0},\mathbf{R}_0)\mathbf{h}\mathbf{V}^{-1}\mathbf{I}(0),
$$
which is a final size relation for the general system when $\mathbf{I}_i(0)>0$. Note that this is an equality only when incidence is mass action

In the case of more general incidence functions, the final size relations are inequalities of the form, for $i=1,\ldots,m$,
$$
\ln\left(\frac{\mathbf{S}_i(0)}{\mathbf{S}_i(\infty)}\right)
\geq
\sigma_i\mathbf{\Gamma}\mathbf{D}^{-1}\left(\mathbf{S}(0)-\mathbf{S}(\infty)\right)
+\sigma_i\beta(K)\mathbf{h}\mathbf{V}^{-1}\mathbf{I}(0)
$$
where $K$ is the initial total population

--- 

# Example - $SLIAR$ model

Paper we have already seen:
- Arino, Brauer, PvdD, Watmough & Wu. [Simple models for containment of a pandemic](http://dx.doi.org/10.1098/rsif.2006.0112) (2006)


--- 

# <!--fit-->Example - $SL_1L_2I_1I_2A_1A_2R$ "simple" COVID-19 model

- Arino & Portet. [A simple model for COVID-19](http://dx.doi.org/10.1016/j.idm.2020.04.002) (2020)

---

# Where things go awry, final size-wise!

- Summer 2021 work of Aaron Shalev (U of M)
- Consider the very simple 2-patch metapopulation (see [Lecture 05](https://julien-arino.github.io/3MC-course-epidemiological-modelling/2022_04_3MC_EpiModelling_L05_MetapopulationModels.html))

$$
\begin{align*}
S_1' &= -\beta_1 S_1I_1 \\
I_1' &= \beta_1 S_1I_1-\gamma_1 I_1-m_{21}I_1 \\
R_1' &= \gamma_1I_1 \\
S_2' &= -\beta_2 S_2I_2 \\
I_2' &= \beta_2 S_2I_2-\gamma_2 I_2+m_{21}I_1 \\
R_2' &= \gamma_2I_2
\end{align*}
$$

- Unidirectional movement from patch 1 to patch 2
- $\mathbf{\beta}$ **cannot** be scalar-valued here!

---

<!-- _backgroundImage: "linear-gradient(to bottom, #f1c40f, 20%, white)" -->
# <!--fit-->Endemic models

# Computation of $\mathcal{R}_0$

# Global stability considerations

---

# Next generation matrix/operator

Diekmann and Heesterbeek, characterised in ODE case by [PvdD & Watmough (2002)](https://doi.org/10.1016/S0025-5564(02)00108-6)

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

# Preliminary setup

$x=(x_1,\ldots,x_n)^T$, $x_i\geq 0$, with the first $m<n$ compartments the infected ones

$X_s$ the set of all disease free states: 
$$
X_s=\{x\geq 0| x_i=0, i=1,\ldots,m\}
$$

Distinguish new infections from all other changes in population
- $F_i(x)$ rate of appearance of new infections in compartment $i$
- $V_i^+(x)$ rate of transfer of individuals into compartment $i$ by all other means
- $V_i^-(x)$ rate of transfer of individuals out of compartment $i$

Assume each function continuously differentiable at least twice in each variable

$$
x_i' = f_i(x)=F_i(x)-V_i(x),\quad i=1,\ldots,n
$$
where $V_i=V_i^--V_i^+$

---

# Some assumptions


- **(A1)** If $x\geq 0$, then $F_i,V_i^+,V_i^-\geq 0$ for $i=1,\ldots,n$

> Since each function represents a directed transfer of individuals, all are non-negative


- **(A2)** If $x_i=0$ then $V_i^-=0$. In particular, if $x\in X_s$, then $V_i^-=0$ for $i=1,\ldots,m$

> If a compartment is empty, there can be no transfer of individuals out of the compartment by death, infection, nor any other means

---

- **(A3)** $F_i=0$ if $i>m$

> The incidence of infection for uninfected compartments is zero

- **(A4)** If $x\in X_s$ then $F_i(x)=0$ and $V_i^+(x)=0$ for $i=1,\ldots,m$

> Assume that if the population is free of disease then the population will remain free of disease; i.e., there is no (density independent) immigration of infectives

---

# One last assumption for the road

Let $x_0$ be a DFE of the system, i.e., a (locally asymptotically) stable equilibrium solution of the disease free model, i.e., the system restricted to $X_s$. We need not assume that the model has a unique DFE

Let $Df(x_0)$ be the Jacobian matrix $[\partial f_i/\partial x_j]$. Some derivatives are one sided, since $x_0$ is on the domain boundary

- **(A5)** If $F(x)$ is set to zero, then all eigenvalues of $Df(x_0)$ have negative real parts

Note: if the method ever fails to work, it is usually with (A5) that lies the problem

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
with matrices $F$ and $V$ obtained as indicated. Assume conditions (A1) through (A5) hold. Then
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
V^{-1}=\dfrac{1}{(d+\varepsilon)(d+\gamma)}
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
FV^{-1}=\dfrac{{\partial\overline{f}}/{\partial I}}
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
\dfrac{{\partial\overline{f}}/{\partial I}}
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

<!-- _backgroundImage: "linear-gradient(to bottom, #f1c40f, 20%, white)" -->
# <!--fit-->Compound matrices

---

# The compound matrix method

- An extension of Dulac's criterion to higher order systems
- Useful to rule out the existence of periodic orbits
- Was very popular for a while, but you must be aware of the main limitation:
  - Becomes hard to use when dimensionality $\geq 4$

---

Refer for example to Fiedler, 1998 for details

Let $A=(a_{ij})$, $i=1,\ldots,m$, $j=1,\ldots,n$ an $m\times n$-matrix and $k$ an integer, $1\leq k\leq\min(m,n)$

Let $M=\{1,\ldots,m\}$ and $N=\{1,\ldots,n\}$, $M^{(k)}$ and $N^{(k)}$) the lexicographically ordered sets of ordered $k$-tuples of elements of $M$ and $N$, respecti

---


The $k$th compound matrix $A^{(k)}$ of $A$ is the $C(m,k)\times C(n,k)$ matrix, with rows indexed by elements of $M^{(k)}$ and columns indexed by the elements of $N^{(k)}$, s.t. element $A^{(k)}(I,J)$, $I\in M^{(k)}$, $J\in N^{(k)}$ is the determinant $\det A(I,J)$

$A(I,J)$ is the submatrix of $A$ consisting of rows in $I$ and columns in $J$

Another interpretation of $A^{(k)}$ is as the $k$th exterior product of matrix $A$

---


Suppose now that $A$ is an $n\times n$-matrix. The matrix $(I+tA)^{(k)}$ is a $C(n,k)\times C(n,k)$-matrix, with each entry a polynomial of $t$ with degree at most $k$

Grouping monomials of same degree in $t$
$$
(I+tA)^{(k)}=A^{(k,0)}+tA^{(k,1)}+\cdots+t^kA^{(k,k)}
$$
where matrices $A^{(k,s)}$ do not depend on $t$

Matrix $A^{(k,1)}$ is the $k$th **additive compound matrix** of $A$ and is denoted $A^{[k]}$. It satisfies
$$
A^{[k]}=\lim_{h\to 0}
\left(\frac 1h\left((I+hA)^{(k)}-I^{(k)}\right)\right)
$$

The latter equality can be written
$$
A^{[k]}=D_+(I+hA)^{(k)}|_{h=0}
$$
where $D_+$ is the right derivative

---


<div class="theorem">

Suppose $A=(a_{pq})$. Then, for $I,J\in N^{(k)}$
$$
A^{[k]}(I,J)=\left\{
\begin{array}{ll}
\sum_{p\in I}a_{pp} & \textrm{if } J=I \\
0 & \textrm{if }|I\cap J|\leq k-2 \\
(-1)^\sigma a_{pq} & \textrm{if } |I\cap J|=k-1
\end{array}
\right.
$$
where $p$ is the entry in $I\setminus(I\cap J)$, $q$ is the entry in $J\setminus(I\cap J)$ and $\sigma$ is the number of entries of $I\cap J$ between $p$ and $q$
</div>

---

When $k=2$, we have

<div class="theorem">

Suppose that $A=(a_{ij})$. For all $i=1,\ldots,C(n,2)$, let $(i)=(i_1,i_2)$ the $i$th element of the lexicographic order of pairs $(i_1,i_2)$ of integers s.t. $1\leq i_1<i_2\leq n$

Then the entry in the $i$th row and $j$th column of $A^{[2]}$ is
$$
a_{ij}=\left\{
\begin{array}{ll}
a_{i_1i_1}+a_{i_2i_2} & \textrm{if } (j)=(i) \\
(-1)^{r+s}a_{i_rj_s} & \textrm{if exactly one element  } i_r\textrm{ of }(i)\textrm{ does not appear}\\
&\textrm{in }(j)\textrm{ and }j_s \textrm{ does not appear in }(i) \\
0 & \textrm{if no element of }(i)
\textrm{ appears in }(j) 
\end{array}
\right.
$$
where $p$ is the entry in $I\setminus(I\cap J)$, $q$ is the entry in $J\setminus(I\cap J)$ and $\sigma$ is the number of elements of $I\cap J$ between $p$ and $q$
</div>

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

<div class="theorem">

Let $A,B$ be two $n\times n$-matrices. Then
 
- The number of nonzero offdiagonal entries of $A^{[k]}$ equals $C(n-2,k-1)$ times the number of nonzero offdiagonal entries of $A$
- $A^{[1]}=A$, $A^{[n]}=\mathsf{tr} A$
- $(A+B)^{[k]}=A^{[k]}+B^{[k]}$ (whence the *additive* suffix)
- Let $S$ be a nonsingular $n\times n$-matrix. Then
$$
(SAS)^{[k]}=S^{{k}}A^{[k]}(S^{-1})^{(k)}
$$
</div>

---

Let $A$ be an $m\times m$-matrix. Denote $A^{[2]}$ the second additive compound matrix of $A$

<div class="theorem">

Let $A$ be a real $m\times m$-mix. For $A$ to have all its eigenvalues with negative real parts, it is necessary and sufficient that 
1. the second additive compound matrix $A^{[2]}$ has all its eigevalues with negative real parts
2. $(-1)^m\det(A)>0$
</div>

---

# Role in stability

Consider the differential equation
$$
\begin{equation}\tag{1}\label{sys:diff_general}
x'=f(x)
\end{equation}
$$

<div class="theorem">

[Li \& Muldowney, 1995]\label{th:LM1}
A sufficient condition for a periodic orbit $\gamma=\{p(t):0\leq t\leq\omega\}$ of $\eqref{sys:diff_general}$ be asymptotically orbitally stable with asymptotic phase is that the linear system
$$
z'(t)=\left(\frac{\partial f^{[2]}}{\partial x}
  \left(p(t)\right)\right)z(t)
$$
be asymptotically stable
</div>

---

<!-- _backgroundImage: "linear-gradient(to bottom, #f1c40f, 20%, white)" -->
# <!-- fit -->Numerical investigations of large-scale systems

<div style = "position: relative; bottom: -40%; font-size:20px;">

- JA. [Spatio-temporal spread of infectious pathogens of humans](https://doi.org/10.1016/j.idm.2017.05.001). *Infectious Disease Modelling* **2**(2):218-228 (2017)
- JA. [Mathematical epidemiology in a data-rich world](https://doi.org/10.1016/j.idm.2019.12.008). *Infectious Disease Modelling* **5**:161-188 (2020)
- github repo [modelling-with-data](https://github.com/julien-arino/modelling-with-data)

</div>

---

# Not very difficult

- As for the mathematical analysis: if you do things carefully and think about things a bit, numerics are not hard. Well: not harder than numerics in low-D
- Exploit vector structure

---

# Define the vector field

```
SLIAR_metapop_rhs <- function(t, x, p) {
  with(as.list(x), {
    S = x[p$idx_S]
    L = x[p$idx_L]
    I = x[p$idx_I]
    A = x[p$idx_A]
    R = x[p$idx_R]
    N = S + L + I + A + R
    Phi = p$beta * S * (I + p$eta * A)
    dS = S - Phi + p$M %*% S
    dL = Phi - p$epsilon * L + p$M %*% L
    dI = (1 - p$pi) * p$epsilon * L - p$gammaI * I + p$M %*% I
    dA = p$pi * p$epsilon * L - p$gammaA * A + p$M %*% A
    dR = p$gammaI * I + p$gammaA * A + p$M %*% R
    list(c(dS, dL, dI, dA, dR))
  })
}
```

---

# Set up parameters

```
pop = c(34.017, 1348.932, 1224.614, 173.593, 93.261) * 1e+06
countries = c("Canada", "China", "India", "Pakistan", "Philippines")
T = matrix(data = 
             c(0, 1268, 900, 489, 200, 
               1274, 0, 678, 859, 150, 
               985, 703, 0, 148, 58, 
               515, 893, 144, 0, 9, 
               209, 174, 90, 2, 0), 
           nrow = 5, ncol = 5, byrow = TRUE)
```

---

# Work out movement matrix

```
p = list()
# Use the approximation explained in Arino & Portet (JMB 2015)
p$M = mat.or.vec(nr = dim(T)[1], nc = dim(T)[2])
for (from in 1:5) {
  for (to in 1:5) {
    p$M[to, from] = -log(1 - T[from, to]/pop[from])
  }
  p$M[from, from] = 0
}
p$M = p$M - diag(colSums(p$M))
```

---

```
p$P = dim(p$M)[1]
p$idx_S = 1:p$P
p$idx_L = (p$P + 1):(2 * p$P)
p$idx_I = (2 * p$P + 1):(3 * p$P)
p$idx_A = (3 * p$P + 1):(4 * p$P)
p$idx_R = (4 * p$P + 1):(5 * p$P)
p$eta = rep(0.3, p$P)
p$epsilon = rep((1/1.5), p$P)
p$pi = rep(0.7, p$P)
p$gammaI = rep((1/5), p$P)
p$gammaA = rep((1/3), p$P)
# The desired values for R_0. Here we take something simple
R_0 = rep(1.5, p$P)
```

---

# Set up IC and time

```
# Set initial conditions. For example, we start with 2
# infectious individuals in Canada.
L0 = mat.or.vec(p$P, 1)
I0 = mat.or.vec(p$P, 1)
A0 = mat.or.vec(p$P, 1)
R0 = mat.or.vec(p$P, 1)
I0[1] = 2
S0 = pop - (L0 + I0 + A0 + R0)
# Vector of initial conditions to be passed to ODE solver.
IC = c(S = S0, L = L0, I = I0, A = A0, R = R0)
# Time span of the simulation (5 years here)
tspan = seq(from = 0, to = 5 * 365.25, by = 0.1)
```

---

# Set up $\beta$ to avoid blow up

Let us take $\mathcal{R}_0=1.5$ for patches in isolation. Solve $\mathcal{R}_0$ for $\beta$ 
$$
\beta=\frac{\mathcal{R}_0}{S(0)}
\left(
\frac{1-\pi_p}{\gamma_{Ip}}
+\frac{\pi_p\eta_p}{\gamma_{Ap}}
\right)^{-1}
$$ 

<p style="margin-bottom:2cm;"></p> 

```
for (i in 1:p$P) {
  p$beta[i] = 
    R_0[i] / S0[i] * 1/((1 - p$pi[i])/p$gammaI[i] + p$pi[i] * p$eta[i]/p$gammaA[i])
}
```

---

# And now the problems begin :)

```
# Call the ODE solver
sol <- deSolve::ode(y = IC, times = tspan, 
                    func = SLIAR_metapop_rhs, parms = p)
## DLSODA- At current T (=R1), MXSTEP (=I1) steps
## taken on this call before reaching TOUT
## In above message, I1 = 5000
##
## In above message, R1 = 117.498
```

The output I copy above means the integration went wrong. The problem is the sie difference between countries, in particular China and Canada..

Need to play with movement rates and initial conditions. Will not explain here

