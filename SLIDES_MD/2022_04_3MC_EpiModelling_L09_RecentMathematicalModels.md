---
marp: true
title: Some recent mathematical models for Covid-19, HIV/AIDS, TB, Hepatitis, Malaria
description: 3MC Course Epidemiological Modelling - Julien Arino - Course 09 - Some recent mathematical models for Covid-19, HIV/AIDS, TB, Hepatitis, Malaria
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

# Some recent mathematical models for COVID-19, HIV/AIDS, TB, Hepatitis, Malaria, etc.

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

<!-- _backgroundImage: "radial-gradient(white,80%,#85110d)" -->
# Outline

- Additional considerations and a few oddities
- Some recent models
- Quick overview of missing topics

---

<!-- _backgroundImage: "linear-gradient(to bottom, #85110d, 20%, white)" -->
# <!--fit-->Additional considerations and a few oddities

---

<!-- _backgroundImage: "radial-gradient(white,80%,#f1c40f)" -->
# Outline

- An issue with the next generation method for $\mathcal{R}_0$
- Tuberculosis (TB) model with non-trivial behaviour at the origin

---

<!-- _backgroundImage: "linear-gradient(to bottom, #f1c40f, 20%, white)" -->
# <!--fit-->An issue with the next generation method for $\mathcal{R}_0$

# (Malaria model with transgenic vectors)

<div style = "position: relative; bottom: -40%; font-size:20px;">

JA, Bowman, Gumel & Portet. [Effect of pathogen-resistant vectors on the transmission dynamics of a vector-borne disease](http://dx.doi.org/10.1080/17513750701605614). *Journal of Biological Dynamics* **1**:320-346 (2007)
</div>

---

# Foreword

- This is not an issue with the method itself, but an illustration of the reason why it is important to check that (A1)-(A5) are satisfied when using the next generation matrix method of PvdD & Watmough (2002)

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

We can use the method of PvdD & Watmough (2002) at each of these DFE to get the local stability properties of these DFE

At $\bar E_0$, we find $\mathcal{R}_0=0$, which makes no sense. What's wrong?

Problem is with (A5): compute Jacobian of $(S,T)$ system and evaluate at $\bar E_0$, we get e-values $\lambda_1=\kappa_S\mathbb{F}_S>0$ and $\lambda_2=\kappa_T\mathbb{F}_T$, so $\bar E_0$ is always unstable $\implies$ (A5) cannot be satisfied at $\bar E_0$ and the LAS condition provided by PvdD & Watmough (2002) is not usable

---

<!-- _backgroundImage: "linear-gradient(to bottom, #f1c40f, 20%, white)" -->
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

If $\mathcal{R}_1<1$, then $(0,0,0)$ is not an omega-limit point for any solution of \eqref{sys:SEI_TB} with initial conditions in $\mathbb{R}^3_+\setminus\{(0,0,0)\}$
</div>

<div align=justify 
style="background-color:#16a085;
border-radius:20px;
padding:10px 20px 10px 20px;
box-shadow: 0px 1px 5px #999;">

For system \eqref{sys:SEI_TB}, if $\mathcal{R}_0\leq 1$ then $X_0=(N_0,0,0)$ is GAS
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

---

<!-- _backgroundImage: "linear-gradient(to bottom, #85110d, 20%, white)" -->
# <!--fit-->A few recent models

---

<!-- _backgroundImage: "linear-gradient(to bottom, #85110d, 20%, white)" -->
# <!--fit-->Quick overview of missing topics

---

# I have left out many topics !