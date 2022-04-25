---
marp: true
title: Some recent mathematical models for Covid-19, HIV/AIDS, TB, Hepatitis, Malaria
description: Julien Arino - 3MC Course Epidemiological Modelling - Course 09 - Some (recent?) mathematical models for HIV/AIDS, TB, Hepatitis, Malaria
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

<!-- _backgroundImage: "linear-gradient(to top, #85110d, 1%, white)" -->
# Some (recent?) mathematical models for HIV/AIDS, TB, Hepatitis, Malaria, etc.

7 April 2022 

Julien Arino [![width:32px](https://raw.githubusercontent.com/julien-arino/presentations/main/FIGS/icons/email-round.png)](mailto:Julien.Arino@umanitoba.ca) [![width:32px](https://raw.githubusercontent.com/julien-arino/presentations/main/FIGS/icons/world-wide-web.png)](https://julien-arino.github.io/) [![width:32px](https://raw.githubusercontent.com/julien-arino/presentations/main/FIGS/icons/github-icon.png)](https://github.com/julien-arino)

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

- Additional considerations and a few oddities
- A few (recent?) models
- Quick overview of missing topics

---

<!-- _backgroundImage: "linear-gradient(to bottom, #f1c40f, 20%, white)" -->
# <!--fit-->Additional considerations and a few oddities

- An "issue" with the next generation method for $\mathcal{R}_0$
- Tuberculosis (TB) model with non-trivial behaviour at the origin
- SLIRS with non-constant population
- Bistable states

---

<!-- _backgroundImage: "linear-gradient(to bottom, #156C26, 20%, white)" -->
# <!--fit-->An "issue" with the next generation method for $\mathcal{R}_0$

# (Malaria model with transgenic vectors)

<div style = "position: relative; bottom: -40%; font-size:20px;">

JA, Bowman, Gumel & Portet. [Effect of pathogen-resistant vectors on the transmission dynamics of a vector-borne disease](http://dx.doi.org/10.1080/17513750701605614). *Journal of Biological Dynamics* **1**:320-346 (2007)
</div>

---

# Foreword

- This is not an issue with the method itself, but an illustration of the reason why it is important to check that (A1)-(A5) are satisfied when using the next generation matrix method of [PvdD & Watmough (2002)](https://doi.org/10.1016/S0025-5564(02)00108-6)

---

![bg contain](https://raw.githubusercontent.com/julien-arino/3MC-course-epidemiological-modelling/main/FIGS/flow_diagram_transgenic_mosquitoes.jpg)

---


# Hypotheses about mosquitoes

- **H1** Resistant vectors are completely immune to the pathogen
- **H2-a**  A proportion $p_1$ of the offspring resulting from the interbreeding of wild and resistant vectors are resistant to the pathogen
- **H2-b**  A proportion $p_2$$ of the offspring resulting from inbreeding within the resistant type are resistant to the pathogen
- **H3** In the absence of disease, wild vectors are better fitted for competition than resistant vectors
- **H4** Wild vectors are ill-fitted for competition when they carry the disease

---

# The model

$$
\begin{align}
S' &= B_W(S,I,T) - (d_W+\kappa_SV)S-f_V \\
I' &= f_V-(d_W+\delta_W+\kappa_IV)I \\
T' &= B_T(S,I,T)-(d_T+\kappa_TV)T \\
S_H' &= \Pi+\nu R_H-f_H-d_HS_H \\
I_H' &= f_H-(d_H+\delta_H+\gamma)I_H \\
R_H' &= \gamma I_H-(d_H+\nu)R_H
\end{align}
$$

- $f_V,f_H\in C^1$
- $f_V,f_H\geq 0$
- $f_V=0$ if $S=0$ or $I_H=0$
- $f_H=0$ if $S_H=0$ or $I=0$

---

# Coexistence of vectors

- Can wild type and transgenic vectors coexist?

$$
\begin{align}
S' &= \frac{\alpha_1}{2}S+(1-p_2)\frac{\alpha_3}{2}T
+(1-p_1)\alpha_5\frac{ST}{S+T}
-(d_W+\kappa_S(S+T))S \\
T' &= p_2\frac{\alpha_3}{2}T
+p_1\alpha_5\frac{ST}{S+T}
-(d_T+\kappa_T(S+T))T
\end{align}
$$

Fitness (from undetailed assumptions, $\mathbb{F}_S\geq\mathbb{F}_T$):
$$
\mathbb{F}_S=
\frac{\alpha_1-2d_W}{2\kappa_S}
\quad\textrm{and}\quad
\mathbb{F}_T=
\frac{p_2\alpha_3-2d_T}{2\kappa_T}
$$

Find 2 boundary EP $\bar E_0=(S,T)=(0,0)$ and $\bar E_W=(S,T)=(\mathbb{F}_S,0)$ and one coexistence EP $\bar E_C$. If there is no loss of resistance in offspring of two resistant parents ($p_2=1$), then there is another boundary EP $\bar E_T=(0,\mathbb{F}_T)$

---

![bg contain](https://raw.githubusercontent.com/julien-arino/3MC-course-epidemiological-modelling/main/FIGS/transgenic_mosquitoes_stability_regions.jpg)

---

# Where the problem arises

There are up to 4 EPs for vectors and these are independent from the host population in the case when disease is absent

$\implies$ the whole coupled system with vectors *and* hosts has up to 4 DFE

We can use the method of [PvdD & Watmough (2002)](https://doi.org/10.1016/S0025-5564(02)00108-6) at each of these DFE to get the local stability properties of these DFE

At $\bar E_0$, we find $\mathcal{R}_0=0$, which makes no sense. What's wrong?

Problem is with (A5): compute Jacobian of $(S,T)$ system and evaluate at $\bar E_0$, we get e-values $\lambda_1=\kappa_S\mathbb{F}_S>0$ and $\lambda_2=\kappa_T\mathbb{F}_T$, so $\bar E_0$ is always unstable $\implies$ (A5) cannot be satisfied at $\bar E_0$ and the LAS condition provided by [PvdD & Watmough (2002)](https://doi.org/10.1016/S0025-5564(02)00108-6) is not usable

---

<!-- _backgroundImage: "linear-gradient(to bottom, #156C26, 20%, white)" -->
# Non-trivial behaviour at the origin


# <!--fit-->(Tuberculosis model with complicated recruitment)

<div style = "position: relative; bottom: -40%; font-size:20px;">

McCluskey & PvdD. [Global Analysis of Two Tuberculosis Models](https://doi.org/10.1023/B:JODY.0000041283.66784.3e). *Journal of Dynamics and Differential Equations* **16**:139–166 (2004)
</div>

---

# Demographic model

In absence of disease, assume total population governed by
$$
N'=B(N)-dN
$$
where $B(N)$ satisfies

- $\exists$ unique $N_0>0$ s.t. $B(N_0)-dN_0=0$
- $B'(N)<B(N)/N$ for $N\in ]0,N_0]$
- $b_0:=\lim_{N\to 0^+}B(N)/N >d$, where $b_0\in\overline{\mathbb{R}}$

---

![bg contain](https://raw.githubusercontent.com/julien-arino/3MC-course-epidemiological-modelling/main/FIGS/SEI_TB.png)

---

Since $N=S+E+I$, write the model using $N$, $E$ and $I$ as
$$
\label{sys:SEI_TB}
\begin{align}
N' &= B(N)-dN-\delta I \\
E' &= c\beta\frac{(N-E-I)I}{N}-(\varepsilon+\rho_1+d)E \\
I' &= \varepsilon E-(\rho_2+\delta+d)I
\end{align}
$$

---

The issue here is with the DFE: we can have solutions limiting to $(0,0,0)$. Consider the system in proportions
$$
\label{sys:SEI_TB_prop}
\begin{align}
N' &= \left(\frac{B(N)}{N}-d-\delta i\right)N \\
e' &=
c\beta(1-e-i)i-\left(\varepsilon+\rho_1+\frac{B(N)}{N}+di\right)e \\
I' &= \varepsilon e-\left(\delta+\rho_2+\frac{B(N)}{N}+\delta
  i\right)i
\end{align}
$$
Extend the system at $\{N=0\}$ by replacing $\left.\frac{B(N)}{N}\right|_{N=0}$ by $b_0$ (3rd hypothesis on $B$)

---

Biologically relevant region is the positively invariant compact set 
$$
\mathcal{B}=\{(N,e,i)\in\mathbb{R}^3_+: N\leq N_0,e+i\leq 1\}
$$
If $b_0=\infty$ ($B(N)=\Lambda$ constant), $N=0$ is unstable, so consider it finite from now on

Two equilibria with $N=0$:
 
- $A_0=(0,0,0)$
- $A_*=(0,e_*,i_*)$, with $e_*,i_*>0$

Thus, at $A_*$, the population goes extinct, but in a "controlled" manner

---

Let
$$
\mathcal{R}_0=\frac{c\beta\varepsilon}
{(\delta+\rho_2+d)(\varepsilon+\rho_1+d)}
$$
$$
\mathcal{R}_1=\frac{c\beta\varepsilon}
{(\delta+\rho_2+b_0)(\varepsilon+\rho_1+b_0)}
$$
and, if $\mathcal{R}_0>1$,
$$
\mathcal{R}_2=\frac{b_0}{d+\delta i_*}
$$

---

# Equilibria

$X_0=(N_0,0,0)$, $X_*=(N_*,E_*,I_*)$ (unique)

| | $A_0$ | $X_0$ | $A_*$ | $X_*$ |
|:---|:---:|:---:|:---:|:---:|
| $\mathcal{R}_0<1$ | instable | LAS | | |
| $\mathcal{R}_2<1<\mathcal{R}_0,\mathcal{R}_1$ | unstable | unstable | LAS | |
| $\mathcal{R}_1<1<\mathcal{R}_0,\mathcal{R}_2$ | unstable | unstable | | LAS |
| $1<\mathcal{R}_0,\mathcal{R}_1,\mathcal{R}_2$ | unstable | unstable | unstable | LAS |

---

# Global results

<div class="theorem">

The EP $A_0=(0,0,0)$ is never an omega-limit point of a solution of \eqre{sys:SEI_TB_prop} with initial conditions s.t. $N>0$, $e,i\geq 0$ and $e+i\leq 1$
</div>

<div class="theorem">

If $\mathcal{R}_1<1$, then $(0,0,0)$ is not an omega-limit point for any solution of \eqref{sys:SEI_TB} with initial conditions in $\mathbb{R}^3_+\setminus\{(0,0,0)\}$
</div>

<div class="theorem">

For system \eqref{sys:SEI_TB}, if $\mathcal{R}_0\leq 1$ then $X_0=(N_0,0,0)$ is GAS
</div>

In the case $\mathcal{R}_0,\mathcal{R}_2>1$, global stability of $X_*$ is established in "esoteric" conditions..

---

<!-- _backgroundImage: "linear-gradient(to bottom, #156C26, 20%, white)" -->
# <!--fit-->SLIRS with non-constant population

# (Some periodic solutions)

<div style = "position: relative; bottom: -35%; font-size:20px;">

Liu, Levin & Iwasa. [Influence of nonlinear incidence rates upon the behavior of SIRS epidemiological models](https://doi.org/10.1007/BF00276956). J. Math. Biology **23** (1986)

</div>

---

# General setting

SIRS model of the form

$$
\begin{align*}
S' &= B(N)-dS-f(S,I)I+\nu R \\
I' &= f(S,I)I-(d+\gamma)I \\
R' &= \gamma I-(d+\nu)R
\end{align*}
$$

$f$ differentiable and s.t. $f(0,I)=0$ for all $I$ and $\partial f/\partial S>0$

Assume demographic component of the system
$$
N'=B(N)-dN
$$
admits a stable equilibrium $N_0$ s.t. $N_0=dN_0$

Since $N$ converges, they then reduce the dimension

---

# Case of incidence $f(S,I)=\beta I^{p-1}S^q$

They establish generic conditions leading to the existence of a Hopf bifurcation, then consider the system when incidence take the form
$$
f(S,I)=\beta I^{p-1}S^q
$$

---

# Example $p=2$ and $q=1$

Gives the system (after some transformations)
$$
\begin{align}
I' &= aI^2S - I, \tag{9"} \\
R' &= r(I - R/h)  \tag{10"}
\end{align} 
$$

---

![bg contain](https://raw.githubusercontent.com/julien-arino/3MC-course-epidemiological-modelling/main/FIGS/LiuLevinIwasa_p10.png)


---

<!-- _backgroundImage: "linear-gradient(to bottom, #156C26, 20%, white)" -->
# <!--fit-->Bistable states

# Undesired effect of vaccination

<div style = "position: relative; bottom: -30%; font-size:20px;">

Arino, McCluskey & PvdD. [Global results for an epidemic model with vaccination that exhibits backward bifurcation](http://dx.doi.org/10.1137/S0036139902413829). SIAM J Applied Math (2003)

</div>

---

# Another SIRS model with vaccination

![width:1000px center](https://raw.githubusercontent.com/julien-arino/3MC-course-epidemiological-modelling/main/FIGS/SIRV_newborns.png)

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
(1-S-I-R)+\nu R \qquad \tag{14a} \label{sys:vacc_3dS} \\
I' &= \beta SI
+\sigma\beta(1-S-I-R)I -(d+\gamma)I \tag{14b}\label{sys:vacc_3dI}\\
R' &= \gamma I-(d+\nu)R \tag{14c}\label{sys:vacc_3dR} \\
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

![width:550px](https://raw.githubusercontent.com/julien-arino/3MC-course-epidemiological-modelling/main/FIGS/PI_vs_I_forward.png)  ![width:550px](https://raw.githubusercontent.com/julien-arino/3MC-course-epidemiological-modelling/main/FIGS/SIRV_bif_forward.png)


---

# Case of a backward bifurcation

![width:550px](https://raw.githubusercontent.com/julien-arino/3MC-course-epidemiological-modelling/main/FIGS/PI_vs_I_backward.png)  ![width:550px](https://raw.githubusercontent.com/julien-arino/3MC-course-epidemiological-modelling/main/FIGS/SIRV_bif_backward.png)

---

# Bistable region
 
- Concavity of the curve is fixed (since $A<0$), so a necessary condition for existence of two endemic equilibria is: 
  - $P'(0)=B>0$ and $P(0)=C<0$
  - The roots of $P(I)$ must be real

$\implies$ region of bistability is $\Delta=B^2-4AC\geq 0$, $B>0$ and $C<0$

---

# Bifurcation in the $(\sigma,\phi)$ plane

![width:800px center](https://raw.githubusercontent.com/julien-arino/3MC-course-epidemiological-modelling/main/FIGS/bif_sigma_vs_phi.png)

---

# EEP

If there are such solutions $I^\star$ to $P(I)=0$ (potentielly a double root), EEP of \eqref{sys:SIR_vacc_AMV} are $(S,I,R,V)=$

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

Using the next generation method, the reproduction number (with vaccination) is

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
 
- Using a theorem of PvdD & Watmough (2002), the DFE is
  - locally asymptotically stable for $\mathcal{R}_\phi<1$
  - unstable for $\mathcal{R}_\phi>1$
- Furthermore, when $\mathcal{R}_0<1$, using $I$ as a Lyapunov function, it is easily shown the the DFE is globally asymptotically stable

---

# Local stability - EEP

Linearising $\eqref{sys:vacc_3dS}$-$\eqref{sys:vacc_3dR}$ at the EEP
 
- at the smaller $I$, Jacobian matrix has negative trace and positive determinant $\implies$ one of the eigenvalues is positive and the lower bifurcating branch is unstable
- On the upper branch, conclude from linearisation that there is either one or three eigenvalues with nonpositive real part $\implies$ stability is undetermined. From numerical investigations, the upper branch seems locally stable

---

# Spectral abscissa at the EP

Spectral abscissa $s(J)$ (maximum of real parts of eigenvalues) of the linearisation at the DFE and the 2 EEP, when $\theta$ varies

![width:600px center](https://raw.githubusercontent.com/julien-arino/3MC-course-epidemiological-modelling/main/FIGS/evalues_SIRbif.png)



---

# Global behaviour

<div class="theorem">

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
# A few (recent?) models

- HIV: Sex, drugs and matrices
- HIV: An early complex model
- HIV: Universal HIV testing followed by ART
- HIV: viral load monitoring and patient tracing in Malawi
- Malaria: A super classic model
- Malaria: A classic model
- Malaria: Sensitivity analysis
- Malaria and COVID-19: Optimal control

---

<!-- _backgroundImage: "linear-gradient(to bottom, #156C26, 20%, white)" -->
# <!--fit-->HIV: Sex, drugs and matrices

<div style = "position: relative; bottom: -40%; font-size:20px;">

Abramson & Rothschild. [Sex, drugs and matrices: Mathematical prediction of HIV infection](https://doi.org/10.1080/00224498809551447). *The Journal of Sex Research* **25** (1988)
</div>

---

- Data related to sexual encounters and practices are often unreliable or ambiguous
- Use a simple model to illustrate this
- Suggest that epidemiology of AIDS is particularly sensitive to the limitations in the assessment of sexuality/drug‐related behavior

---

For group $G_i$, $i=1,\ldots,m$, $n_i$ is size of group and $x_i$ number of members of $G_i$ who are seropositive. $Q=[q_{ij}]$ rate at which uninfected members of $G_i$ are infected by interaction with infected member of $G_j$; rate proportional to number of uninfected in $G_i$ and proportion of $G_j$ that is seropositive. $B_{ij}$ recruitment into $G_i$ from other groups (e.g., from different risk group), $a_i$ death rate due to AIDS, $d_i$ death for all other causes. (All births and deaths are "relative to the group", might not be real birth/death)
$$
\begin{aligned}
x_i' &= (n_i-x_i)\sum_{j=1}^m q_{ij}\frac{x_j}{n_j}-(d_i+a_i)x_i \\
n_i' &= \sum_{j=1}^m b_{ij}n_j -d_in_i-a_ix_i
\end{aligned}
$$

Study is only numerical

---

<!-- _backgroundImage: "linear-gradient(to bottom, #156C26, 20%, white)" -->
# <!--fit-->HIV: An early complex model

<div style = "position: relative; bottom: -40%; font-size:20px;">

Hethcote [A Model for HIV Transmission and AIDS](https://doi.org/10.1007/978-3-642-46693-9_13) (1989)
</div>

---

![bg contain](https://raw.githubusercontent.com/julien-arino/3MC-course-epidemiological-modelling/main/FIGS/Hethcote1989_HIV_part.png)

---

![bg contain](https://raw.githubusercontent.com/julien-arino/3MC-course-epidemiological-modelling/main/FIGS/Hethcote1989_AIDS_part.png)

---

<!-- _backgroundImage: "linear-gradient(to bottom, #156C26, 20%, white)" -->
# <!--fit-->HIV: Universal HIV testing followed by ART

<div style = "position: relative; bottom: -40%; font-size:20px;">

Granich, Gilks, Dye, De Cock & Williams. [Universal voluntary HIV testing with immediate antiretroviral therapy as a strategy for elimination of HIV transmission: a mathematical model](https://doi.org/10.1016/S0140-6736(08)61697-9). *The Lancet* **373** (2009)
</div>

---

![bg contain](https://raw.githubusercontent.com/julien-arino/3MC-course-epidemiological-modelling/main/FIGS/1-s2.0-S0140673608616979-gr2_lrg.gif)

<!--Transmission model for HIV infection and antiretroviral therapy (ART) provision

N represents population aged 15 years and above. People enter into the susceptible class (S) at a rate βN, become infected at a rate λSJ/N, progress through four stages of HIV (Ii, i=1–4) at a rate ρ between each stage, and then die (D). The background mortality rate is μ and people are tested at a rate τ. If they are tested and put onto ART, they move to the corresponding ART box Ai (i=1–4), where they progress through four stages at a rate σ and then die. The term governing transmission contains the factor J α (Ii+ɛAi) where ɛ allows for the fact that people receiving ART are less infectious than are those who are not. They might also stop treatment or the treatment might become ineffective, in which case they return to the corresponding non-ART state at a rate φ. To allow for heterogeneity in sexual behaviour and for the observed steady state prevalence of HIV, we let the transmission decrease with the prevalence, P. If n=1, the decrease is exponential; if n=∞, the decrease is a step function. Both have been used in previous models-->

---

<!-- _backgroundImage: "linear-gradient(to bottom, #156C26, 20%, white)" -->
# <!--fit-->HIV: viral load monitoring and patient tracing in Malawi

<div style = "position: relative; bottom: -40%; font-size:20px;">

Estill, Kerr, Blaser, Salazar-Vizcaya, Tenthani, Wilson, Keiser. [The Effect of Monitoring Viral Load and Tracing Patients Lost to Follow-up on the Course of the HIV Epidemic in Malawi: A Mathematical Model](https://doi.org/10.1093/ofid/ofy092). *Open Forum Infectious Diseases* **5** (2018) 
</div>

---

- Individual-based simulation of disease progression and a deterministic transmission model
- Used the R package gems to develop an individual-based simulation model for disease progression in patients who have started ART
- Deterministic transmission model to represent the HIV epidemic in Malawi between 1975 and 2050: 40 compartments representing HIV status (susceptible; primary, asymptomatic chronic, or symptomatic chronic infection; ART; AIDS), age (children <15 years, adults 15–49 years, adults ≥50 years), sex (not distinguished for children), and risk behavior (high or low, except for children, older adults, and AIDS patients)

---

![bg contain](https://raw.githubusercontent.com/julien-arino/3MC-course-epidemiological-modelling/main/FIGS/ofy09201.jpeg)

<!--Schematic representation of the mathematical model. A, Flow of patients in the treatment model. White boxes represent stages with suppressed viral load, and gray boxes represent stages with continuously elevated viral load. “Discordant” immunological failure refers to a decline in CD4 cell count fulfilling the failure criteria under suppressed viral load; this condition will not reverse upon switch to second-line therapy. The flow described on the upper half is applicable to patients on ART, including those who returned after ART interruption. While progressing along the stages of treatment response (upper graph), the patients may also interrupt and restart treatment or die (lower graph). B, Transmission model. The upper graph shows the course of the HIV infection, and the lower graph the flow through age, sex, and risk group. Black arrows show flows between compartments, and gray lines show sexual contact patterns. Abbreviation: ART, antiretroviral therapy.-->

---

<!-- _backgroundImage: "linear-gradient(to bottom, #156C26, 20%, white)" -->
# <!--fit-->Malaria: A super classic model

<div style = "position: relative; bottom: -40%; font-size:20px;">

Dietz, Molineaux & Thomas. [A malaria model tested in the African savannah](https://www.ncbi.nlm.nih.gov/pubmed/4613512). *Bulletin of the WHO* **50** (1974)
</div>

---

![bg contain](https://raw.githubusercontent.com/julien-arino/3MC-course-epidemiological-modelling/main/FIGS/DietzMolineauxThomas_flow_diagram.png)

---

![bg contain](https://raw.githubusercontent.com/julien-arino/3MC-course-epidemiological-modelling/main/FIGS/DietzMolineauxThomas_equations.png)

---

![bg contain](https://raw.githubusercontent.com/julien-arino/3MC-course-epidemiological-modelling/main/FIGS/DietzMolineauxThomas_biting_rates.png)

---

![bg contain](https://raw.githubusercontent.com/julien-arino/3MC-course-epidemiological-modelling/main/FIGS/DietzMolineauxThomas_positives.png)

---

<!-- _backgroundImage: "linear-gradient(to bottom, #156C26, 20%, white)" -->
# <!--fit-->Malaria: A classic model

<div style = "position: relative; bottom: -40%; font-size:20px;">

Ngwa & Shu. [A mathematical model for endemic malaria with variable human and mosquito populations](https://doi.org/10.1016/S0895-7177(00)00169-2). *Mathematical and Computer Modelling* **32** (2000)
</div>

---

![bg contain](https://raw.githubusercontent.com/julien-arino/3MC-course-epidemiological-modelling/main/FIGS/NgwaShu_contact_scaling.png)

---

![bg contain](https://raw.githubusercontent.com/julien-arino/3MC-course-epidemiological-modelling/main/FIGS/NgwaShu_system.png)

---

<!-- _backgroundImage: "linear-gradient(to bottom, #156C26, 20%, white)" -->
# <!--fit-->Malaria: Sensitivity analysis

<div style = "position: relative; bottom: -40%; font-size:20px;">

Chitnis, Hyman & Cushing. [Determining Important Parameters in the Spread of Malaria Through the Sensitivity Analysis of a Mathematical Model](https://doi.org/10.1007/s11538-008-9299-0). *Bulletin of Mathematical Biology* **70** (2008)
</div>

---

![bg contain](https://raw.githubusercontent.com/julien-arino/3MC-course-epidemiological-modelling/main/FIGS/ChitnisHymanCushing_flow_diagram.png)

---

- Consider two transmission scenarios for areas of *high* and *low* transmission
- Perform sensitivity analysis
- Very good paper if you are looking for parameters for malaria models

---

![bg contain](https://raw.githubusercontent.com/julien-arino/3MC-course-epidemiological-modelling/main/FIGS/ChitnisHymanCushing_sensitivity_table.png)


---

<!-- _backgroundImage: "linear-gradient(to bottom, #156C26, 20%, white)" -->
# <!--fit-->Malaria and COVID-19: Optimal control

<div style = "position: relative; bottom: -40%; font-size:20px;">

Tchoumi, Diagne, Rwezaura & Tchuenche. [Malaria and COVID-19 co-dynamics: A mathematical model and optimal control](https://doi.org/10.1016/j.apm.2021.06.016). *Applied Mathematical Modelling* **99** (2021)
</div>

---

![bg 90%](https://raw.githubusercontent.com/julien-arino/3MC-course-epidemiological-modelling/main/FIGS/Tchoumi_etal_flow1.jpg)

---

![bg contain](https://raw.githubusercontent.com/julien-arino/3MC-course-epidemiological-modelling/main/FIGS/Tchoumi_etal_flow2.jpg)

---

- Various considerations
- Optimal control using cost functional
$$
J(u_1,u_2) =
\int_0^T
A_1(I_m+I_{mE_c})+A_2(I_c+I_{cE_m})+A_3I_{mc}+A_4N_{v}
+B_1u_1^2(t)+B_2u_2^2(t)\; dt
$$
where
1. $u_1(t)$ use of PPM to prevent mosquitoes bites during the day and the night, such as insecticide-treated nets, application of repellents to skin or spraying of insecticides
2. $u_2(t)$ use of PPM to protect against SARS-CoV-2:  facial mask, hydro alcoholic gel, hand-washing with soap, etc.

---

![bg 75% left](https://raw.githubusercontent.com/julien-arino/3MC-course-epidemiological-modelling/main/FIGS/Tchoumi_etal_optimalC_u1.jpg) ![right](https://raw.githubusercontent.com/julien-arino/3MC-course-epidemiological-modelling/main/FIGS/Tchoumi_etal_optimalC_u2.jpg)

---

<!-- _backgroundImage: "linear-gradient(to bottom, #f1c40f, 20%, white)" -->
# <!--fit-->Quick overview of missing topics

---

# I have left out many topics !

- Already mentioned graph models, which would warrant coverage
- Immunology, i.e., so-called within-host models
- Immunono-epidemiology, i.e., interface between within-host dynamics and between-host dynamics
- Evolutionary dynamics, in particular of viruses
- And so much more..