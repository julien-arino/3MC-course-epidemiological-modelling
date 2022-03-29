---
marp: true
title: Practicum 02 - Model analysis, studying large-scale models in R
description: 3MC Course Epidemiological Modelling - Julien Arino - Practicum 02 - Model analysis, studying large-scale models in R
theme: default
paginate: false
size: 4K
---

# Practicum 02 - Model analysis, studying large-scale models in R

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

<div align=justify 
style="background-color:#16a085;
border-radius:20px;
padding:10px 20px 10px 20px;
box-shadow: 0px 1px 5px #999;">

Let
$$
\mathcal{R}_0 = \rho\left(
\mathbf{\Pi}\mathbf{D}\beta(\mathbf{S}_0,\mathbf{0},\mathbf{R}_0)\mathsf{diag}(\mathbf{S}_0)\mathbf{h}\mathbf{V}^{-1}
\right)
$$
If $\mathcal{R}_0<1$, the DFE $\mathbf{E}_0$ is locally asymptotically stable; if $\mathcal{R}_0>1$, the DFE $\mathbf{E}_0$ is unstable.

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

<div align=justify 
style="background-color:#16a085;
border-radius:20px;
padding:10px 20px 10px 20px;
box-shadow: 0px 1px 5px #999;">

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

Let $M=\{1,\ldots,m\}$ and $N=\{1,\ldots,n\}$, $M^{(k)}$ (respectively, $N^{(k)}$) the lexicographically ordered sets of ordered $k$-tuples of elements of $M$ (respectively, $N$)

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



