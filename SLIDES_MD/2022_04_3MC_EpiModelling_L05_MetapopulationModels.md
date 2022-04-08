---
marp: true
title: Metapopulation epidemic models
description: 3MC Course Epidemiological Modelling - Julien Arino - Lecture 05 - Metapopulation models
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

# Lecture 05 - Metapopulation epidemic models

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

<!-- _backgroundImage: "radial-gradient(white,80%,#f1c40f)" -->
# Outline
- Formulating metapopulation models
- Basic mathematical analysis
- $\mathcal{R}_0$ is not the panacea - An urban centre and satellite cities
- Problems specific to metapopulations
- Global stability considerations

---

<!-- _backgroundImage: "linear-gradient(to bottom, #f1c40f, 20%, white)" -->
# <!-- fit -->Formulating metapopulation models

<div style = "position: relative; bottom: -40%; font-size:20px;">

- JA & PvdD. [Disease spread in metapopulations](https://server.math.umanitoba.ca/~jarino/publications/ArinoVdD-2006-FIC48.pdf). *Fields Institute Communications* **48**:1-13 (2006)
- JA. [Diseases in metapopulations](https://server.math.umanitoba.ca/~jarino/papers/Arino_metapopulations.pdf). In *Modeling and Dynamics of Infectious Diseases*, World Scientific (2009)
- JA. [Spatio-temporal spread of infectious pathogens of humans](https://doi.org/10.1016/j.idm.2017.05.001). *Infectious Disease Modelling* **2**(2):218-228 (2017)
</div>

---

<div style = "position: relative; top: -47%; font-size:40px">

**Disease spread process in a jurisdiction-based world**
</div>

![bg 90%](https://raw.githubusercontent.com/julien-arino/presentations/main/FIGS/importations/importation_process3.png)

<div style = "position: relative; bottom: -51%; font-size:18px;">

- JA, Bajeux, Portet & Watmough. [Quarantine and the risk of COVID-19 importation](https://doi.org/10.1017/S0950268820002988). *Epidemiology & Infection* **148**:e298 (2020)
- JA, Bolle, Milliken & Portet. [Risk of COVID-19 variant importation - How useful are travel control measures?](https://doi.org/10.1016/j.idm.2021.06.006). *Infectious Disease Modelling* **6**:875-897 (2021)
</div>

---

![bg contain](https://raw.githubusercontent.com/julien-arino/presentations/main/FIGS/spatial/J_WeightedVoronoi_zoom.png)

---

# General principles (1)

- $|\mathcal{P}|$ geographical locations (*patches*) in a set $\mathcal{P}$  (city, region, country..)
- Patches are vertices in a graph
- Each patch $p\in\mathcal{P}$ contains **compartments** $\mathcal{C}_p\subseteq\mathcal{C}$
  - individuals susceptible to the disease
	- individuals infected by the disease
	- different species affected by the disease
	- etc.

![bg right:32%](https://raw.githubusercontent.com/julien-arino/presentations/main/FIGS/metapopulations/simple_graph.svg)

---

# General principles (2)

- Compartments *may* move between patches, with $m_{cqp}$ rate of movement of individuals from compartment $c\in\mathcal{C}$ from patch $p\in\mathcal{P}$ to patch $q\in\mathcal{P}\setminus\{p\}$
- Movement instantaneous and no death during movement
- $\forall c\in\mathcal{C}$, defines a digraph $\mathcal{G}^c$ with arcs $\mathcal{A}^c$
- Arc from $p$ to $q$ if $m_{cqp}>0$, absent otherwise
- $|\mathcal{C}|$ compartments, so each $(p,q)$ can have at most $|\mathcal{C}|$ arrows $\rightarrow$ multi-digraph


---

# The underlying mobility model

$N_{cp}$ population of compartment $c\in\mathcal{C}$ in patch $p\in\mathcal{P}$

Assume no birth or death. Balance inflow and outflow

$$
\begin{align}
N_{cp}' &= \left(\sum_{q\in\mathcal{P}\setminus\{p\}} m_{cpq}N_{cq}\right)-\left(\sum_{q\in\mathcal{P}\setminus\{p\}} m_{cqp}\right)N_{cp} \\
&\\
\text{or} & \\
&\\
N_{cp}' &=  \sum_{q\in\mathcal{P}} m_{cpq}N_{cq} 
\qquad \tag{1}\label{eq:dNcp}
\end{align}
$$
when we write
$$
m_{cpp}=-\sum_{q\in\mathcal{P}\setminus\{p\}} m_{cqp}
$$

---

# The toy SLIRS model in patches

![width:800px](https://raw.githubusercontent.com/julien-arino/presentations/main/FIGS/flow-diagrams/SLIRS.svg)

$B(N)$ is the birth rate (typically $b$ or $bN$)

$L$ = latently infected ($\simeq E$ exposed, although the latter term is ambiguous)

---

# $|\mathcal{P}|$-SLIRS model

$$
\begin{align}
S_{p}' &=\mathcal{B}_p\left(N_p\right)+\nu_pR_p-\Phi_p-d_pS_p 
\color{red}{+\textstyle{\sum_{q\in\mathcal{P}}} m_{Spq}S_{q}} \tag{2a}\label{sys:pSLIRS_dS} \\
L_{p}' &=\Phi_p-\left( \varepsilon_{p}+d_{p}\right)L_{p}
\color{red}{+\textstyle{\sum_{q\in\mathcal{P}}} m_{Lpq}L_{q}} \tag{2b}\label{sys:pSLIRS_dL} \\
I_{p}' &=\varepsilon_pL_p-(\gamma_p+d_p)I_p
\color{red}{+\textstyle{\sum_{q\in\mathcal{P}}} m_{Ipq}I_{q}} \tag{2c}\label{sys:pSLIRS_dI} \\
R_{p}' &=\gamma _{p}I_{p}-\left(\nu_{p}+d_{p}\right)R_{p}
\color{red}{+\textstyle{\sum_{q\in\mathcal{P}}} m_{Rpq}R_{q}} \tag{2d}\label{sys:pSLIRS_dR} 
\end{align}
$$

with incidence 
$$
\Phi_p=\beta_p\frac{S_pI_p}{N_p^{q_p}},\qquad q_p\in\{0,1\}
\tag{2e}\label{sys:pSLIRS_incidence} 
$$


<div style = "position: relative; bottom: -15%; font-size:20px;">

- JA & PvdD. [Disease spread in metapopulations](https://server.math.umanitoba.ca/~jarino/publications/ArinoVdD-2006-FIC48.pdf). *Fields Institute Communications* **48**:1-13 (2006)
- JA. [Diseases in metapopulations](https://server.math.umanitoba.ca/~jarino/papers/Arino_metapopulations.pdf). In *Modeling and Dynamics of Infectious Diseases*, World Scientific (2009)
</div>

---

# $|\mathcal{S}|\;|\mathcal{P}|$-SLIRS (multiple species)

$\mathcal{S}$ a set of species
$$
\begin{align}
S_{sp}' &= \mathcal{B}_{sp}(N_{sp})+\nu_{sp}R_{sp}-\Phi_{sp}-d_{sp}S_{sp}
\color{red}{+\textstyle{\sum_{q\in\mathcal{P}}} m_{Sspq}S_{sq}} \tag{3a}\label{sys:spSLIRS_dS} \\
L_{sp}' &= \Phi_{sp}-(\varepsilon_{sp}+d_{sp})L_{sp}
\color{red}{+\textstyle{\sum_{q\in\mathcal{P}}}m_{Lspq}L_{sq}} \tag{3b}\label{sys:spSLIRS_dL} \\
I_{sp}' &= \varepsilon_{sp}L_{sp}-(\gamma_{sp}+d_{sp})I_{sp}
\color{red}{+\textstyle{\sum_{q\in\mathcal{P}}} m_{Ispq}I_{sq}} \tag{3c}\label{sys:spSLIRS_dI} \\
R_{sp} &= \gamma _{sp}I_{sp}-(\nu_{sp}+d_{sp})R_{sp}
\color{red}{+\textstyle{\sum_{q\in\mathcal{P}}} m_{Rspq}R_{sq}} \tag{3d}\label{sys:spSLIRS_dR} 
\end{align}
$$

with incidence
$$
\Phi_{sp}=\sum_{k\in\mathcal{S}}\beta_{skp}\frac{S_{sp}I_{kp}}{N_p^{q_p}},\qquad q_p\in\{0,1\}
\tag{3e}\label{sys:spSLIRS_incidence} 
$$

<div style = "position: relative; bottom: -6%; font-size:20px;">

- JA, Davis, Hartley, Jordan, Miller \& PvdD. [A multi-species epidemic model with spatial dynamics](https://server.math.umanitoba.ca/~jarino/papers/ArinoDavisHartleyJordanMillerVdD-2005-MMB22.pdf). *Mathematical Medicine and Biology* **22**(2):129-142 (2005) 
- JA, Jordan \& PvdD. [Quarantine in a multi-species epidemic model with spatial dynamics](https://server.math.umanitoba.ca/~jarino/publications/ArinoJordanVdD-2007-MBS206.pdf). *Mathematical Biosciences* **206**(1):46-60 (2007)
</div>

---

# $|\mathcal{P}|^2$-SLIRS (residency patch/movers-stayers)

$$
\begin{align}
S_{pq}' =& 
\mathcal{B}_{pq}\left(N_p^r\right)+\nu_{pq} R_{pq}-\Phi_{pq}-d_{pq}S_{pq} \color{red}{+\textstyle{\sum_{k\in\mathcal{P}}} m_{Spqk}S_{pk}} 
\tag{4a}\label{sys:ppSLIRS_dS} \\
L_{pq}' =& \Phi_{pq}
-(\varepsilon_{pq}+d_{pq})L_{pq}
\color{red}{+\textstyle{\sum_{k\in\mathcal{P}}} m_{Lpqk}L_{pk}} 
\tag{4b}\label{sys:ppSLIRS_dL} \\
I_{pq}' =& \varepsilon_{pq} L_{pq}
-(\gamma_{pq}+d_{pq})I_{pq}
\color{red}{+\textstyle{\sum_{k\in\mathcal{P}}} m_{Ipqk}I_{pk}} 
\tag{4c}\label{sys:ppSLIRS_dI} \\
R_{pq}' =& \gamma_{pq} I_{pq}
-(\nu_{pq}+d_{pq})R_{pq}
\color{red}{+\textstyle{\sum_{k\in\mathcal{P}}} m_{Rpqk}R_{pk}}
\tag{4d}\label{sys:ppSLIRS_dR} 
\end{align}
$$

with incidence
$$
\Phi_{pq}=\sum_{k\in\mathcal{P}}\beta_{pqk}\frac{S_{pq}I_{kq}}{N_p^{q_q}},\qquad q_q=\{0,1\}
\tag{4e}\label{sys:ppSLIRS_incidence} 
$$

<div style = "position: relative; bottom: -10%; font-size:20px;">

- Sattenspiel & Dietz. [A structured epidemic model incorporating geographic mobility among regions](https://doi.org/10.1016/0025-5564(94)00068-B) (1995)
- JA \& PvdD. [A multi-city epidemic model](https://server.math.umanitoba.ca/~jarino/publications/ArinoVdD-2003-MPS10.correct.pdf). *Mathematical Population Studies* **10**(3):175-193 (2003)
- JA \& PvdD. [The basic reproduction number in a multi-city compartmental epidemic model](https://server.math.umanitoba.ca/~jarino/papers/ArinoVdD-2003-LNCIS294.pdf). In *Positive Systems* (2003)
</div>

---

# General metapopulation epidemic models

$\mathcal{U}\subsetneq\mathcal{C}$ **uninfected** and $\mathcal{I}\subsetneq\mathcal{C}$ **infected** compartments, $\mathcal{U}\cup\mathcal{I}=\mathcal{C}$ and $\mathcal{U}\cap\mathcal{I}=\emptyset$

For $k\in\mathcal{U}$, $\ell\in\mathcal{I}$ and $p\in\mathcal{P}$,
$$
\begin{align}
s_{kp}' &= f_{kp}(S_p,I_p)+\sum_{q\in\mathcal{P}} m_{kpq}s_{kq} 
\tag{5a}\label{sys:general_metapop_ds} \\
i_{\ell p}' &= g_{\ell p}(S_p,I_p)+\sum_{q\in\mathcal{P}} m_{\ell pq}i_{\ell q}
\tag{5b}\label{sys:general_metapop_di} 
\end{align}
$$
where $S_p=(s_{1p},\ldots,s_{|\mathcal{U}|p})$ and $I_p=(i_{1p},\ldots,i_{|\mathcal{I}|p})$

---

<!-- _backgroundImage: "linear-gradient(to bottom, #f1c40f, 20%, white)" -->
# <!--- fit --->Basic mathematical analysis

---

# Analysis - Toy system

For simplicity, consider $|\mathcal{P}|$-SLIRS with $\mathcal{B}_p(N_p)=\mathcal{B}_p$
$$
\begin{align}
S_{p}' &=\mathcal{B}_p-\Phi_p-d_pS_p+\nu_pR_p
+\textstyle{\sum_{q\in\mathcal{P}}} m_{Spq}S_{q} 
\tag{6a}\label{sys:pSLIRS_toy_dS} \\
L_{p}' &=\Phi_p-\left( \varepsilon_{p}+d_{p}\right)L_{p}
+\textstyle{\sum_{q\in\mathcal{P}}} m_{Lpq}L_{q} 
\tag{6b}\label{sys:pSLIRS_toy_dL} \\
I_{p}' &=\varepsilon_pL_p-(\gamma_p+d_p)I_p
+\textstyle{\sum_{q\in\mathcal{P}}} m_{Ipq}I_{q} 
\tag{6c}\label{sys:pSLIRS_toy_dI} \\
R_{p}' &=\gamma _{p}I_{p}-\left(\nu_{p}+d_{p}\right)R_{p}
+\textstyle{\sum_{q\in\mathcal{P}}} m_{Rpq}R_{q}
\tag{6d}\label{sys:pSLIRS_toy_dR} 
\end{align}
$$

with incidence
$$
\Phi_p=\beta_p\frac{S_pI_p}{N_p^{q_p}},\qquad q_p\in\{0,1\}
\tag{6e}\label{sys:pSLIRS_toy_incidence} 
$$

System of $4|\mathcal{P}|$ equations

---

# Size is not that bad..

System of $4|\mathcal{P}|$ equations !!!

However, a lot of structure: 
- $|\mathcal{P}|$ *copies* of individual units, each comprising 4 equations
- Dynamics of individual units well understood
- Coupling is linear

$\implies$ Good case of large-scale system (matrix analysis is your friend)

---

# Notation in what follows

- $M\in\mathcal{M}_n(\mathbb{R})=\mathbb{R}^{n\times n}$ a square matrix with entries denoted $m_{ij}$

- $M\geq\mathbf{0}$ if $m_{ij}\geq 0$ for all $i,j$ (could be the zero matrix); $M>\mathbf{0}$ if $M\geq\mathbf{0}$ and $\exists i,j$ with $m_{ij}>0$; $M\gg\mathbf{0}$ if $m_{ij}>0$ $\forall i,j=1,\ldots,n$. Same notation for vectors

- $\sigma(M)=\{\lambda\in\mathbf{C}; M\lambda=\lambda\mathbf{v}, \mathbf{v}\neq\mathbf{0}\}$ **spectrum** of $M$

- $\rho(M)=\max_{\lambda\in\sigma(M)}\{|\lambda|\}$ **spectral radius**

- $s(M)=\max_{\lambda\in\sigma(M)}\{\Re(\lambda)\}$ **spectral abscissa** (or **stability modulus**)

- $M$ is an **M-matrix** if it is a **Z-matrix** ($m_{ij}\leq 0$ for $i\neq j$) and $M = s\mathbb{I}-A$, with $A\geq 0$ and $s\geq \rho(A)$

---

# Behaviour of the total population

Consider behaviour of $N_p=S_p+L_p+I_p+R_p$. We have
$$
\begin{aligned}
N_p' &=\mathcal{B}_p\cancel{-\Phi_p}-d_pS_p\cancel{+\nu_pR_p}
+\textstyle{\sum_{q\in\mathcal{P}}} m_{Spq}S_{q} \\
&\quad \cancel{+\Phi_p}-\left(\cancel{\varepsilon_{p}}
+d_{p}\right)L_{p}
+\textstyle{\sum_{q\in\mathcal{P}}} m_{Lpq}L_{q} \\
&\quad \cancel{+\varepsilon_pL_p}-(\cancel{\gamma_p}+d_p)I_p
+\textstyle{\sum_{q\in\mathcal{P}}} m_{Ipq}I_{q} \\
&\quad \cancel{+\gamma _{p}I_{p}}
-\left(\cancel{\nu_{p}}+d_{p}\right)R_{p}
+\textstyle{\sum_{q\in\mathcal{P}}} m_{Rpq}R_{q}
\end{aligned}
$$

So
$$
N_p'=\mathcal{B}_p-d_pN_p
+\sum_{X\in\{S,L,I,R\}}\sum_{q\in\mathcal{P}} m_{Xpq}X_{q}
$$

---

# Vector / matrix form of the equation

We have
$$
N_p'=\mathcal{B}_p-d_pN_p
+\sum_{X\in\{S,L,I,R\}}\sum_{q\in\mathcal{P}} m_{Xpq}X_{q}
$$
Write this in vector form
$$
\tag{7}\label{sys:pSLIRS_dN_general} 
\mathbf{N}'=\mathbf{b}-\mathbf{d}\mathbf{N}+\sum_{X\in\{S,L,I,R\}}\mathcal{M}^X\mathbf{X}
$$
where $\mathbf{b}=(\mathcal{B}_1,\ldots,\mathcal{B}_{|\mathcal{P}|})^T,\mathbf{N}=(N_1,\ldots,N_{|\mathcal{P}|})^T,\mathbf{X}=(X_1,\ldots,X_{|\mathcal{P}|})^T\in\mathbb{R}^{|\mathcal{P}|},$ $\mathbf{d},\mathcal{M}^X$ $|\mathcal{P}|\times|\mathcal{P}|$-matrices with 
$$
\mathbf{d}=\mathsf{diag}\left(d_1,\ldots,d_{|\mathcal{P}|}\right)
$$

---

# The movement matrix

$$
\mathcal{M}^c=
\begin{pmatrix}
-\sum_{q\in\mathcal{P}} m_{cq1} & m_{c12} & & m_{c1|\mathcal{P}|} \\
m_{c21} & -\sum_{q\in\mathcal{P}} m_{cq2} & & m_{c2|\mathcal{P}|} \\
& & & \\
m_{c|\mathcal{P}|1} & m_{c|\mathcal{P}|2} & & -\sum_{q\in\mathcal{P}} m_{cq|\mathcal{P}|}
\end{pmatrix}
$$

<div class="theorem">

Consider a compartment $c\in\mathcal{C}$. Then the following hold true:
1. $0\in\sigma(\mathcal{M}^c)$ and corresponds to left eigenvector $\mathbf{1}^T_{|\mathcal{P}|}=(1,\ldots,1)$
2. $−\mathcal{M}^c$ singular M-matrix
3. $0 = s(\mathcal{M}^c)\in\sigma(\mathcal{M}^c)$
4. $\mathcal{M}^c$ irreducible $\implies$ $s(\mathcal{M}^c)$ has multiplicity 1
</div>

<div style = "position: relative; bottom: -6%; font-size:20px;">

- JA, Bajeux \& Kirkland. [Number of source patches required for population persistence in a source-sink metapopulation with explicit movement](https://link.springer.com/epdf/10.1007/s11538-019-00593-1?author_access_token=EExdAOC94_0nwG8LMCIoG_e4RwlQNchNByi7wbcMAY6UprpSQ2NEwJhyTjNQrHljtlg8X5E8XM5_iLMsJpxIq750BJ9YXGT6yuMgh65TUuKDb_Z-g1pn0m6w5XILLO0RRY0pzrazec5gcY_GZHE85Q%3D%3D). *Bulletin of Mathematical Biology* **81**(6):1916-1942 (2019)
</div>

---

# The nice case

Recall that
$$
\tag{7}
\mathbf{N}'=\mathbf{b}-\mathbf{d}\mathbf{N}+\sum_{X\in\{S,L,I,R\}}\mathcal{M}^X\mathbf{X}
$$

Suppose movement rates **equal for all compartments**, i.e.,
$$
\mathcal{M}^S=\mathcal{M}^L=\mathcal{M}^I=\mathcal{M}^R=:\mathcal{M}
$$
Then
$$
\begin{align}
\mathbf{N}' &= \mathbf{b}-\mathbf{d}\mathbf{N}+\mathcal{M}\sum_{X\in\{S,L,I,R\}}\mathbf{X}\\
&= \mathbf{b}-\mathbf{d}\mathbf{N}+\mathcal{M}\mathbf{N} \tag{8}\label{sys:pSLIRS_toy_dN}
\end{align}
$$

--- 

$$
\tag{8}
\mathbf{N}'=\mathbf{b}-\mathbf{d}\mathbf{N}+\mathcal{M}\mathbf{N}
$$

Equilibria
$$
\begin{aligned}
\mathbf{N}'=\mathbf{0} &\Leftrightarrow \mathbf{b}-\mathbf{d}\mathbf{N}+\mathcal{M}\mathbf{N}=\mathbf{0} \\
&\Leftrightarrow (\mathbf{d}-\mathcal{M})\mathbf{N}=\mathbf{b} \\
&\Leftrightarrow \mathbf{N}^\star=(\mathbf{d}-\mathcal{M})^{-1}\mathbf{b}
\end{aligned}
$$
given, of course, that $\mathbf{d}-\mathcal{M}$ (or, equivalently, $\mathcal{M}-\mathbf{d}$) is invertible.. Is it?


---

# Perturbations of movement matrices

<div class="theorem">

$\mathcal{M}$ a movement matrix  and $D$ a diagonal matrix. The following hold true:
1. $s(\mathcal{M}+d\mathbb{I})=d$ for all $d\in\mathbb{R}$
2. $s(\mathcal{M}+D)\in\sigma(\mathcal{M}+D)$ and is associated with an eigenvector $\mathbf{v}>\mathbf{0}$. If, additionally, $\mathcal{M}$ irreducible, then $s(\mathcal{M}+D)$ has multiplicity 1 and is associated with $\mathbf{v}\gg\mathbf{0}$
3. $\mathsf{diag}(D)\gg\mathbf{0}$ $\implies$ $D-\mathcal{M}$ nonsingular M-matrix and $(D-\mathcal{M})^{-1}>\mathbf{0}$
4. $\mathcal{M}$ irreducible and $\mathsf{diag}(D)>\mathbf{0}$ $\implies$ $D-\mathcal{M}$ irreducible nonsingular M-matrix and $(D-\mathcal{M})^{-1}\gg\mathbf{0}$
</div>

<div style = "position: relative; bottom: -10%; font-size:20px;">

- JA, Bajeux \& Kirkland. [Number of source patches required for population persistence in a source-sink metapopulation with explicit movement](https://link.springer.com/epdf/10.1007/s11538-019-00593-1?author_access_token=EExdAOC94_0nwG8LMCIoG_e4RwlQNchNByi7wbcMAY6UprpSQ2NEwJhyTjNQrHljtlg8X5E8XM5_iLMsJpxIq750BJ9YXGT6yuMgh65TUuKDb_Z-g1pn0m6w5XILLO0RRY0pzrazec5gcY_GZHE85Q%3D%3D). *Bulletin of Mathematical Biology* **81**(6):1916-1942 (2019)
</div>



---

# Nonsingularity of $\mathcal{M}-\mathbf{d}$

Using a spectrum shift,
$$
s(\mathcal{M}-\mathbf{d})=-\min_{p\in\mathcal{P}}d_p
$$
This gives a constraint: for total population to behave well (in general, we want this), we must assume all death rates are positive

Assume they are (in other words, assume $\mathbf{d}$ nonsingular). Then $\mathcal{M}-\mathbf{d}$ is nonsingular and $\mathbf{N}^\star=(\mathbf{d}-\mathcal{M})^{-1}\mathbf{b}$ unique

---

# Behaviour of the total population
<p style="margin-bottom:-1.5cm;"></p> 

# Equal movement case

$\mathbf{N}^\star=(\mathbf{d}-\mathcal{M})^{-1}\mathbf{b}$ attracts solutions of
$$
\mathbf{N}'=\mathbf{b}-\mathbf{d}\mathbf{N}+\mathcal{M}\mathbf{N}=:f(\mathbf{N})
$$

Indeed, we have
$$
Df=\mathcal{M}-\mathbf{d}
$$

Since we now assume that $\mathbf{d}$ is nonsingular, we have (spectral shift \& properties of $\mathcal{M}$) $s(\mathcal{M}-\mathbf{d})=-\min_{p\in\mathcal{P}}d_p<0$

$\mathcal{M}$ irreducible $\rightarrow$ $\mathbf{N}^\star\gg 0$ (provided $\mathbf{b}>\mathbf{0}$, of course)

---

# <!--fit-->Behaviour of total population with reducible movement

<div class="theorem">

Assume $\mathcal{M}$ reducible. Let $a$ be the number of minimal absorbing sets in the corresponding connection graph $\mathcal{G}(\mathcal{M})$. Then
1. The spectral abscissa $s(\mathcal{M})=0$ has multiplicity $a$
2. Associated to $s(\mathcal{M})$ is a nonnegative eigenvector $\mathbf{v}$ s.t.
	- $v_i>0$ if $i$ is a vertex in a minimal absorbing set
	- $v_i=0$ if $i$ is a transient vertex
</div>

<div style = "position: relative; bottom: -8%; font-size:20px;">

From Foster and Jacquez, [Multiple zeros for eigenvalues and the multiplicity of traps of a linear compartmental system](https://doi.org/10.1016/0025-5564(75)90096-6), *Mathematical Biosciences* (1975)
</div>


---

# The not-so-nice case

Recall that
$$
\mathbf{N}'=\mathbf{b}-\mathbf{d}\mathbf{N}+\sum_{X\in\{S,L,I,R\}}\mathcal{M}^X\mathbf{X}
$$

Suppose movement rates **similar for all compartments**, i.e., the zero/nonzero patterns in all matrices are the same but not the entries

Let
$$
\underline{\mathcal{M}}=\left[\min_{X\in\{S,L,I,R\}}m_{Xpq}\right]_{pq,p\neq q}\qquad 
\underline{\mathcal{M}}=\left[\max_{X\in\{S,L,I,R\}}m_{Xpq}\right]_{pq,p=q}
$$
and
$$
\overline{\mathcal{M}}=\left[\max_{X\in\{S,L,I,R\}}m_{Xpq}\right]_{pq,p\neq q}\qquad
\overline{\mathcal{M}}=\left[\min_{X\in\{S,L,I,R\}}m_{Xpq}\right]_{pq,p=q}
$$

--- 

# Cool, no? No!

Then we have
$$
\mathbf{b}-\mathbf{d}\mathbf{N}+\underline{\mathcal{M}}\mathbf{N}\leq\mathbf{N}'\leq\mathbf{b}-\mathbf{d}\mathbf{N}+\overline{\mathcal{M}}\mathbf{N}
$$

Me, roughly every 6 months: *Oooh, coooool, a linear differential inclusion!*

Me, roughly 10 minutes after that previous statement: *Quel con!* 

Indeed $\underline{\mathcal{M}}$ and $\overline{\mathcal{M}}$ are **are not** movement matrices  (in particular, their column sums are not all zero)

So no luck there.. 

However, *non lasciate ogne speranza*, we can still do stuff!

---

# Disease free equilibrium (DFE)

Assume system at equilibrium and $L_p=I_p=0$ for $p\in\mathcal{P}$. Then $\Phi_p=0$ and 

$$
\begin{aligned}
0 &=\mathcal{B}_p-d_pS_p+\nu_pR_p
+\textstyle{\sum_{q\in\mathcal{P}}} m_{Spq}S_{q} \\
0 &=-\left(\nu_{p}+d_{p}\right)R_{p}
+\textstyle{\sum_{q\in\mathcal{P}}} m_{Rpq}R_{q}
\end{aligned}
$$
Want to solve for $S_p,R_p$. Here, it is best (crucial in fact) to remember some linear algebra. Write system in vector form:
$$
\begin{aligned}
\mathbf{0} &=\mathbf{b}-\mathbf{d}\mathbf{S}+\mathbf{\nu}\mathbf{R}+\mathcal{M}^S\mathbf{S} \\
\mathbf{0} &=-\left(\mathbf{\nu}+\mathbf{d}\right)\mathbf{R}+\mathcal{M}^R\mathbf{R}
\end{aligned}
$$
where $\mathbf{S},\mathbf{R},\mathbf{b}\in\mathbb{R}^{|\mathcal{P}|}$, $\mathbf{d},\mathbf{\nu},\mathcal{M}^S,\mathcal{M}^R$ $|\mathcal{P}|\times|\mathcal{P}|$-matrices ($\mathbf{d},\mathbf{\nu}$ diagonal)


---

# $\mathbf{R}$ at DFE

Recall second equation:
$$
\mathbf{0} =-\left(\mathbf{\nu}+\mathbf{d}\right)\mathbf{R}+\mathcal{M}^R\mathbf{R} \Leftrightarrow (\mathcal{M}^R-\mathbf{\nu}-\mathbf{d})\mathbf{R}=\mathbf{0}
$$

So unique solution $\mathbf{R}=\mathbf{0}$ if $\mathcal{M}^R-\mathbf{\nu}-\mathbf{d}$ invertible.
Is it?

We have been here before! 

From spectrum shift, $s(\mathcal{M}^R-\mathbf{\nu}-\mathbf{d})=-\min_{p\in\mathcal{P}}(\nu_p+d_p)<0$

So, given $\mathbf{L}=\mathbf{I}=\mathbf{0}$, $\mathbf{R}=\mathbf{0}$ is the unique equilibrium and
$$
\lim_{t\to\infty}\mathbf{R}(t)=\mathbf{0}
$$

$\implies$ DFE has $\mathbf{L}=\mathbf{I}=\mathbf{R}=\mathbf{0}$

---

# $\mathbf{S}$ at the DFE

DFE has $\mathbf{L}=\mathbf{I}=\mathbf{R}=\mathbf{0}$ and $\mathbf{b}-\mathbf{d}\mathbf{S}+\mathcal{M}^S\mathbf{S}=\mathbf{0}$, i.e.,
$$
\mathbf{S}=(\mathbf{d}-\mathcal{M}^S)^{-1}\mathbf{b}
$$
Recall: $-\mathcal{M}^S$ singular M-matrix. From previous reasoning, $\mathbf{d}-\mathcal{M}^S$ has **instability modulus** shifted right by $\min_{p\in\mathcal{P}}d_p$. So:
- $\mathbf{d}-\mathcal{M}^S$ invertible
- $\mathbf{d}-\mathcal{M}^S$ nonsingular M-matrix

Second point $\implies (\mathbf{d}-\mathcal{M}^S)^{-1}>\mathbf{0}\implies (\mathbf{d}-\mathcal{M}^S)^{-1}\mathbf{b}> \mathbf{0}$  (would have $\gg\mathbf{0}$ if $\mathcal{M}^S$ irreducible)

So DFE makes sense with
$$
(\mathbf{S},\mathbf{L},\mathbf{I},\mathbf{R})=\left((\mathbf{d}-\mathcal{M}^S)^{-1}\mathbf{b},\mathbf{0},\mathbf{0},\mathbf{0}\right)
$$

---

# Computing the basic reproduction number $\mathcal{R}_0$

Use next generation method with $\Xi=\{L_1,\ldots,L_{|\mathcal{P}|},I_1,\ldots,I_{|\mathcal{P}|}\}$, $\Xi'=\mathcal{F}-\mathcal{V}$
$$
\mathcal{F}=\left(\Phi_1,\ldots,\Phi_{|\mathcal{P}|},0,\ldots,0\right)^T
$$
$$
\mathcal{V}=
\begin{pmatrix}
\left( \varepsilon_{1}+d_{1}\right)L_{1}
-\sum\limits_{q\in\mathcal{P}} m_{L1q}L_{q} \\
\vdots \\
\left( \varepsilon_{|\mathcal{P}|}+d_{|\mathcal{P}|}\right)L_{|\mathcal{P}|}
-\sum\limits_{q\in\mathcal{P}} m_{L|\mathcal{P}|q}L_{q} \\
-\varepsilon_1L_1+(\gamma_1+d_1)I_1
-\sum\limits_{q\in\mathcal{P}} m_{I1q}I_{q} \\
\vdots \\
-\varepsilon_{|\mathcal{P}|}L_{|\mathcal{P}|}
+(\gamma_{|\mathcal{P}|}+d_{|\mathcal{P}|})I_{|\mathcal{P}|}
-\sum\limits_{q\in\mathcal{P}} m_{I|\mathcal{P}|q}I_{q}
\end{pmatrix}
$$

---

Differentiate w.r.t. $\Xi$:
$$
D\mathcal{F}
=
\begin{pmatrix}
\dfrac{\partial\Phi_1}{\partial L_1} & \cdots &
\dfrac{\partial\Phi_1}{\partial L_{|\mathcal{P}|}} & 
\dfrac{\partial\Phi_1}{\partial I_1} & \cdots &
\dfrac{\partial\Phi_1}{\partial I_{|\mathcal{P}|}} \\
\vdots & & \vdots & \vdots & & \vdots \\
\dfrac{\partial\Phi_{|\mathcal{P}|}}{\partial L_1} & \cdots &
\dfrac{\partial\Phi_{|\mathcal{P}|}}{\partial L_{|\mathcal{P}|}} & 
\dfrac{\partial\Phi_{|\mathcal{P}|}}{\partial I_1} & \cdots &
\dfrac{\partial\Phi_{|\mathcal{P}|}}{\partial I_{|\mathcal{P}|}} \\
0 & \cdots & 0 & 0 & \cdots & 0 \\
\vdots & & \vdots & \vdots & & \vdots \\
0 & \cdots & 0 & 0 & \cdots & 0
\end{pmatrix}
$$

---

Note that
$$
\frac{\partial\Phi_p}{\partial L_k}=\frac{\partial\Phi_p}{\partial I_k}=0
$$
whenever $k\neq p$, so
$$
D\mathcal{F}
=
\begin{pmatrix}
\mathsf{diag}\left(
\frac{\partial\Phi_1}{\partial L_1},\ldots,\frac{\partial\Phi_{|\mathcal{P}|}}{\partial L_{|\mathcal{P}|}}\right) &
\mathsf{diag}\left(
\frac{\partial\Phi_1}{\partial I_1},\ldots,\frac{\partial\Phi_{|\mathcal{P}|}}{\partial I_{|\mathcal{P}|}}\right) \\
\mathbf{0} & \mathbf{0} 
\end{pmatrix}
$$

---

# Evaluate $D\mathcal{F}$ at DFE

<style scoped>
@import url('https://unpkg.com/tailwindcss@^2/dist/utilities.min.css');
</style>

<div class="grid grid-cols-2 gap-4">
<div>

If $\Phi_p=\beta_pS_pI_p$, then
- $\dfrac{\partial\Phi_p}{\partial L_p}=0$
- $\dfrac{\partial\Phi_p}{\partial I_p}=\beta_pS_p$
</div>

<div>

If $\Phi_p=\beta_p\dfrac{S_pI_p}{N_p}$, then
- $\dfrac{\partial\Phi_p}{\partial L_p}=\beta_p\dfrac{S_pI_p}{N_p^2}=0$ at DFE
- $\dfrac{\partial\Phi_p}{\partial I_p}=\beta_p\dfrac{S_p}{N_p}$ at DFE
</div>
</div>

In both cases, $\partial/\partial L$ block is zero so
$$
F=D\mathcal{F}(DFE)=
\begin{pmatrix}
\mathbf{0} & \mathsf{diag}\left(
\frac{\partial\Phi_1}{\partial I_1},\ldots,\frac{\partial\Phi_{|\mathcal{P}|}}{\partial I_{|\mathcal{P}|}}\right) \\
\mathbf{0} & \mathbf{0}
\end{pmatrix}
$$

---

# Compute $D\mathcal{V}$ and evaluate at DFE

$$
V=
\begin{pmatrix}
\mathsf{diag}_p(\varepsilon_p+d_p)-\mathcal{M}^L & \mathbf{0} \\
-\mathsf{diag}_p(\varepsilon_p) & \mathsf{diag}_p(\gamma_p+d_p)-\mathcal{M}^I
\end{pmatrix}
$$
where $\mathsf{diag}_p(z_p)=\mathsf{diag}(z_1,\ldots,z_{|\mathcal{P}|})$. Inverse of $V$ easy ($2\times 2$ block lower triangular):
$$
V^{-1}
=
\begin{pmatrix}
\left(\mathsf{diag}_p(\varepsilon_p+d_p)-\mathcal{M}^L\right)^{-1} & \mathbf{0} \\
\tilde V_{21}^{-1} & \left(\mathsf{diag}_p(\gamma_p+d_p)-\mathcal{M}^I\right)^{-1}
\end{pmatrix}
$$
where
$$
\tilde V_{21}^{-1}=
\left(\mathsf{diag}_p(\varepsilon_p+d_p)-\mathcal{M}^L\right)^{-1} 
\mathsf{diag}_p(\varepsilon_p)
\left(\mathsf{diag}_p(\gamma_p+d_p)-\mathcal{M}^I\right)^{-1}
$$


---
# $\mathcal{R}_0$ as $\rho(FV^{-1})$

Next generation matrix
$$
FV^{-1}=
\begin{pmatrix}
\mathbf{0} & F_{12} \\
\mathbf{0} & \mathbf{0}
\end{pmatrix}
\begin{pmatrix}
\tilde V_{11}^{-1} & \mathbf{0} \\
\tilde V_{21}^{-1} & \tilde V_{22}^{-1}
\end{pmatrix}
=
\begin{pmatrix}
F_{12}\tilde V_{21}^{-1} & F_{12}\tilde V_{22}^{-1} \\
\mathbf{0} & \mathbf{0}
\end{pmatrix}
$$
where $\tilde V_{ij}^{-1}$ is block $ij$ in $V^{-1}$. So
$$
\mathcal{R}_0=\rho\left(F_{12}\tilde{V}_{21}^{-1}\right)
$$
i.e.,
$$
\mathcal{R}_0=\rho\Biggl(
\mathsf{diag}\left(
\frac{\partial\Phi_1}{\partial I_1},\ldots,\frac{\partial\Phi_{|\mathcal{P}|}}{\partial I_{|\mathcal{P}|}}\right)
\left(\mathsf{diag}_p(\varepsilon_p+d_p)-\mathcal{M}^L\right)^{-1} 
\mathsf{diag}_p(\varepsilon_p)
\left(\mathsf{diag}_p(\gamma_p+d_p)-\mathcal{M}^I\right)^{-1}
\Biggr)
$$


--- 

# Local asymptotic stability of the DFE

<div class="theorem">

Define $\mathcal{R}_0$ for the $|\mathcal{P}|$-SLIRS as 
$$
\mathcal{R}_0=\rho\Biggl(
\mathsf{diag}\left(
\frac{\partial\Phi_1}{\partial I_1},\ldots,\frac{\partial\Phi_{|\mathcal{P}|}}{\partial I_{|\mathcal{P}|}}\right)
\left(\mathsf{diag}_p(\varepsilon_p+d_p)-\mathcal{M}^L\right)^{-1}  
\mathsf{diag}_p(\varepsilon_p)
\left(\mathsf{diag}_p(\gamma_p+d_p)-\mathcal{M}^I\right)^{-1}
\Biggr)
$$
Then the DFE
$$
(\mathbf{S},\mathbf{L},\mathbf{I},\mathbf{R})=\left((\mathbf{d}-\mathcal{M}^S)^{-1}\mathbf{b},\mathbf{0},\mathbf{0},\mathbf{0}\right)
$$
is locally asymptotically stable if $\mathcal{R}_0<1$ and unstable if $\mathcal{R}_0>1$
</div>

<div style = "position: relative; bottom: -9%; font-size:20px;">

From PvdD & Watmough, [Reproduction numbers and sub-threshold endemic equilibria for compartmental models of disease transmission](https://doi.org/10.1016/S0025-5564(02)00108-6), *Bulletin of Mathematical Biology* **180**(1-2): 29-48 (2002)
</div>

---

# Global stability considerations

- GAS is much harder 
- It has been done many times (look at my papers, but also those of Li, Shuai, Thieme, van den Driessche, Wang, Zhao..)
- I am not aware of a way to do this *generically*

---

<!-- _backgroundImage: "linear-gradient(to bottom, #f1c40f, 20%, white)" -->
# <!--- fit ---> $\mathcal{R}_0$ is not the panacea 

# An urban centre and satellite cities

<div style = "position: relative; bottom: -30%; font-size:20px;">

JA & S Portet. [Epidemiological implications of mobility between a large urban centre and smaller satellite cities](https://server.math.umanitoba.ca/~jarino/papers/ArinoPortet-2015-JMB71.pdf). *Journal of Mathematical Biology* **71**(5):1243-1265 (2015)
</div>

---

# <!--fit-->Context of the study

Winnipeg as urban centre and 3 smaller satellite cities: Portage la Prairie, Selkirk and Steinbach

- population density low to very low outside of Winnipeg
- MB road network well studied by MB Infrastructure Traffic Engineering Branch

![bg right:57%](https://raw.githubusercontent.com/julien-arino/presentations/main/FIGS/spatial/MB_highways.png)

---

# Known and estimated quantities

| City | Pop. (2014) | Pop. (now) | Dist. | Avg. trips/day |
|:------:|:------|:-------|:------|:------|
| Winnipeg (W) | 663,617 | 749,607 | - | - |
| Portage la Prairie (1) | 12,996 | 13,270 | 88 | 4,115 |
| Selkirk (2) | 9,834 | 10,504 | 34 | 7,983 |
| Steinbach (3) | 13,524 | 17,806 | 66 | 7,505 |

---

![bg contain 75%](https://raw.githubusercontent.com/julien-arino/presentations/main/FIGS/satellite_cities/SIR_flow_diagram_UrbanCentre_Satellite.png)

---

# Estimating movement rates

Assume $m_{yx}$ movement rate from city $x$ to city $y$. *Ceteris paribus*, $N_x'=-m_{yx}N_x$, so $N_x(t)=N_x(0)e^{-m_{yx}t}$. Therefore, after one day, $N_x(1)=N_x(0)e^{-m_{yx}}$, i.e.,
$$
m_{yx}=-\ln\left(\frac{N_x(1)}{N_x(0)}\right)
$$
Now, $N_x(1)=N_x(0)-T_{yx}$, where $T_{yx}$ number of individuals going from $x$ to $y$ / day. So
$$
m_{yx}=-\ln\left(1-\frac{T_{yx}}{N_x(0)}\right)
$$
Computed for all pairs $(W,i)$ and $(i,W)$ of cities


---

# Sensitivity of $\mathcal{R}_0$ to variations of $\mathcal{R}_0^x\in[0.5,3]$

![width:800px](https://raw.githubusercontent.com/julien-arino/presentations/main/FIGS/satellite_cities/sensitivity_4cities.png)
*with disease*: $\mathcal{R}_0^x=1.5$; *without disease*: $\mathcal{R}_0^x=0.5$. Each box and corresponding whiskers are 10,000 simulations


---

# Lower connectivity can drive $\mathcal{R}_0$

PLP and Steinbach have comparable populations but with parameters used, only PLP can cause the general $\mathcal{R}_0$ to take values larger than 1 when $\mathcal{R}_0^W<1$

This is due to the movement rate: if $\mathcal{M}=0$, then
$$
\mathcal{R}_0=\max\{\mathcal{R}_0^W,\mathcal{R}_0^1,\mathcal{R}_0^2,\mathcal{R}_0^3\},
$$
since $FV^{-1}$ is then block diagonal

Movement rates to and from PLP are lower $\rightarrow$ situation closer to uncoupled case and $\mathcal{R}_0^1$ has more impact on the general $\mathcal{R}_0$

---

# $\mathcal{R}_0$ does not tell the whole story!

![width:550px](https://raw.githubusercontent.com/julien-arino/presentations/main/FIGS/satellite_cities/invasion_WPG_from_satellites_R01_m_caseR0W05_R0.png) ![width:550px](https://raw.githubusercontent.com/julien-arino/presentations/main/FIGS/satellite_cities/invasion_WPG_from_satellites_R01_m_caseR0W05_attackRate.png)
Plots as functions of $\mathcal{R}_0^1$ in PLP and the reduction of movement between Winnipeg and PLP. Left: general $\mathcal{R}_0$. Right: Attack rate in Winnipeg


---

<!-- _backgroundImage: "linear-gradient(to bottom, #f1c40f, 20%, white)" -->
# <!--- fit --->Problems specific to metapopulations

---

# Inherited dynamical properties (a.k.a. I am lazy)

Given
$$
\begin{aligned}
s_{kp}' &= f_{kp}(S_p,I_p) \\
i_{\ell p}' &= g_{\ell p}(S_p,I_p)
\end{aligned}
$$
with known properties, what is known of
$$
\begin{aligned}
s_{kp}' &= f_{kp}(S_p,I_p)+\textstyle{\sum_{q\in\mathcal{P}}} m_{kpq}s_{kq} \\
i_{\ell p}' &= g_{\ell p}(S_p,I_p)+\textstyle{\sum_{q\in\mathcal{P}}} m_{\ell pq}i_{\ell q}
\qquad ?
\end{aligned}
$$

- Existence and uniqueness $\checkmark$
- Invariance of $\mathbb{R}_+^\bullet$ under the flow $\checkmark$
- Boundedness $\checkmark$
- Location of individual $\mathcal{R}_{0i}$ and general $\mathcal{R}_0$?
- GAS?

---

# <!--fit-->An inheritance problem - Backward bifurcations

- Suppose a model that, isolated in a single patch, undergoes so-called backward bifurcations
- This means the model admits subthreshold endemic equilibria
- What happens when you couple many such consistuting units?


*YES*, coupling together backward bifurcating units can lead to a system-level backward bifurcation

JA, Ducrot & Zongo. [A metapopulation model for malaria with transmission-blocking partial immunity in hosts](https://server.math.umanitoba.ca/~jarino/papers/ArinoDucrotZongo-2011-JMB.pdf). *Journal of Mathematical Biology* **64**(3):423-448 (2012) 

---

# Metapopulation-induced behaviours ?

"Converse" problem to inheritance problem. Given
$$
\begin{aligned}
s_{kp}' &= f_{kp}(S_p,I_p) \\
i_{\ell p}' &= g_{\ell p}(S_p,I_p)
\end{aligned}
$$
with known properties, does
$$
\begin{aligned}
s_{kp}' &= f_{kp}(S_p,I_p)+\textstyle{\sum_{q\in\mathcal{P}}} m_{kpq}s_{kq} \\
i_{\ell p}' &= g_{\ell p}(S_p,I_p)+\textstyle{\sum_{q\in\mathcal{P}}} m_{\ell pq}i_{\ell q}
\end{aligned}
$$
exhibit some behaviours not observed in the uncoupled system?

E.g.: units have $\{\mathcal{R}_0<1\implies$ DFE GAS, $\mathcal{R}_0>1\implies$ 1 GAS EEP$\}$ behaviour, metapopulation has periodic solutions


---

# Mixed equilibria

Can there be situations where some patches are at the DFE and others at an EEP?

This is the problem of **mixed equilibria**

This is a metapopulation-specific problem, not one of inheritance of dynamical properties!

---

# Types of equilibria

<div class="definition">

**[Patch level]** Patch $p\in\mathcal{P}$ at equilibrium is **empty** if $X_p^\star=0$, at the **disease-free equilibrium** if $X_p^\star=(s_{k_1p}^\star,\ldots,s_{k_up}^\star,0,\ldots,0)$, where $k_1,\ldots,k_u$ are some indices with $1\leq u\leq|\mathcal{U}|$ and $s_{k_1p}^\star,\ldots,s_{k_up}^\star$ are positive, and at an **endemic equilibrium** if $X_p\gg 0$
</div>

<p style="margin-bottom:1cm;"></p> 

<div class="definition">

**[Metapopulation level]** A **population-free equilibrium** has all patches empty. A **metapopulation disease-free equilibrium** has all patches at the disease-free equilibrium for the same compartments. A **metapopulation endemic equilibrium** has all patches at an endemic equilibrium
</div>

--- 

# Mixed equilibria

<div class="definition">

A **mixed equilibrium** is an equilibrium such that
- all patches are at a disease-free equilibrium but the system is not at a metapopulation disease-free equilibrium
- or, there are at least two patches that have different types of patch-level equilibrium (empty, disease-free or endemic)
</div>

<p style="margin-bottom:1cm;"></p> 

E.g., 
$$
((S_1,I_1,R_1),(S_2,I_2,R_2))=((+,0,0),(+,+,+))
$$
is mixed, so is
$$
((S_1,I_1,R_1),(S_2,I_2,R_2))=((+,0,0),(+,0,+))
$$


---

<div class="theorem">

Suppose that movement is similar for all compartments (MSAC) and that the system is at equilibrium

- If patch $p\in\mathcal{P}$ is empty, then all patches in $\mathcal{A}(p)$ are empty 
- If patch $p\in\mathcal{P}$ is at a disease free equilibrium, then the subsystem consisting of all patches in $\{p,\mathcal{A}(p)\}$ is at a metapopulation disease free equilibrium 
- If patch $p\in\mathcal{P}$ is at an endemic equilibrium, then all patches in $\mathcal{D}(p)$ are also at an endemic equilibrium
- If $\mathcal{G}^c$ is strongly connected for some compartment $c\in\mathcal{C}$, then there does not exist mixed equilibria
</div>

<p style="margin-bottom:1cm;"></p> 

Note that MSAC $\implies$ $\mathcal{A}^c=\mathcal{A}$ and $\mathcal{D}^c=\mathcal{D}$ for all $c\in\mathcal{C}$

---

# Interesting (IMHO) problems

More is needed on inheritance problem, in particular GAS part (Li, Shuai, Kamgang, Sallet, and older stuff: Michel & Miller, Šiljak)

Incorporate travel time (delay) and events (infection, recovery, death ..) during travel

What is the minimum complexity of the movement functions $m$ below
$$
\begin{aligned}
s_{kp}' &= f_{kp}(S_p,I_p)+\textstyle{\sum_{q\in\mathcal{P}}} m_{kpq}(S,I)s_{kq} \\
i_{\ell p}' &= g_{\ell p}(S_p,I_p)+\textstyle{\sum_{q\in\mathcal{P}}} m_{\ell pq}(S,I)i_{\ell q}
\end{aligned}
$$
required to observe a metapopulation-induced behaviour?

---

<!-- _backgroundImage: "linear-gradient(to bottom, #f1c40f, 20%, white)" -->
# <!-- fit -->Global stability considerations

---

# $|\mathcal{P}|$-SLIRS model

$$
\begin{aligned}
S_{p}' &=\mathcal{B}_p\left(N_p\right)+\nu_pR_p-\Phi_p-d_pS_p
\color{red}{+\textstyle{\sum_{q\in\mathcal{P}}} m_{Spq}S_{q}} \\
L_{p}' &=\Phi_p-\left( \varepsilon_{p}+d_{p}\right)L_{p}
\color{red}{+\textstyle{\sum_{q\in\mathcal{P}}} m_{Lpq}L_{q}} \\
I_{p}' &=\varepsilon_pL_p-(\gamma_p+d_p)I_p
\color{red}{+\textstyle{\sum_{q\in\mathcal{P}}} m_{Ipq}I_{q}} \\
R_{p}' &=\gamma _{p}I_{p}-\left(\nu_{p}+d_{p}\right)R_{p}
\color{red}{+\textstyle{\sum_{q\in\mathcal{P}}} m_{Rpq}R_{q}}
\end{aligned}
$$

$$
\Phi_p=\beta_p\frac{S_pI_p}{N_p^{q_p}},\qquad q_p\in\{0,1\}
$$


<div style = "position: relative; bottom: -20%; font-size:20px;">

- JA & PvdD. [Disease spread in metapopulations](https://server.math.umanitoba.ca/~jarino/publications/ArinoVdD-2006-FIC48.pdf). *Fields Institute Communications* **48**:1-13 (2006)
- JA. [Diseases in metapopulations](https://server.math.umanitoba.ca/~jarino/papers/Arino_metapopulations.pdf). In *Modeling and Dynamics of Infectious Diseases*, World Scientific (2009)
</div>

---

The linear stability result for $\mathcal{R}_{0}<1$ can be strengthened to a global result

<div class="theorem">

Let $\mathcal{R}_0$ be computed as explained earlier, and use proportional incidence. If $\mathcal{R}_0<1$, then the DFE of system $|\mathcal{P}|$-SLIRS is globally asymptotically stable
</div>

---

# Proof 

Since $\ S_{i}\leq N_{i},$ $\Phi_i\leq\beta_iN_iI_i/N_i$, and the equation for $L'$ gives the inequality
$$
\begin{equation}
\frac{d}{dt}L_i \leq \beta_iI_i-(\varepsilon_i+d_i)L_i+\sum_{j\in\mathcal{P}}m_{ij}^LL_{j}
-\sum_{j\in\mathcal{P}}m_{ji}^LL_i  \label{eq:14}
\end{equation}
$$
For comparison, define a linear system given by the equation above and the original equation for $I'$
$$
\begin{align*}
\frac{d}{dt}L_i &= \beta_iI_i-(\varepsilon_i+d_i)L_i+\sum_{j\in\mathcal{P}}m_{ij}^LL_j
-\sum_{j\in\mathcal{P}}m_{ji}^LL_i \\
\frac{d}{dt}I_i &= \varepsilon_iE_i-(\gamma_i+d_i+\delta_i)I_i+\sum_{j\in\mathcal{P}}m_{ij}^II_j
-\sum_{j\in\mathcal{P}}m_{ji}^II_i
\end{align*}
$$

---

- This system linear has coefficient matrix $F-V$, and so (by some argument in the proof of local stability based on $\mathcal{R}_0$) satisfies $\lim\limits_{t\rightarrow \infty }L_{i}=0$ and $\lim\limits_{t\rightarrow \infty }I_{i}=0$ for $\mathcal{R}_{0}=\rho (FV^{-1})<1$ 
- Using a comparison theorem, it follows that these limits also hold for the nonlinear system in $L_i'$ and $I_i'$
- That $\lim\limits_{t\rightarrow \infty }R_{i}=0$ and $\lim\limits_{t\rightarrow \infty }S_{i}=N_{i}^{{}}\,^{\ast }$ follow from the equations for $S_i'$ and $R_i'$

Thus for $\mathcal{R}_{0}<1,$ the disease free equilibrium is globally asymptotically stable and the disease dies out.

---

# $|\mathcal{S}|\;|\mathcal{P}|$-SLIRS (multiple species)

$\mathcal{S}$ a set of species
$$
\begin{aligned}
S_{sp}' &= \mathcal{B}_{sp}(N_{sp})+\nu_{sp}R_{sp}-\Phi_{sp}-d_{sp}S_{sp}
\color{red}{+\textstyle{\sum_{q\in\mathcal{P}}} m_{Sspq}S_{sq}} \\
L_{sp}' &= \Phi_{sp}-(\varepsilon_{sp}+d_{sp})L_{sp}
\color{red}{+\textstyle{\sum_{q\in\mathcal{P}}}m_{Lspq}L_{sq}} \\
I_{sp}' &= \varepsilon_{sp}L_{sp}-(\gamma_{sp}+d_{sp})I_{sp}
\color{red}{+\textstyle{\sum_{q\in\mathcal{P}}} m_{Ispq}I_{sq}} \\
R_{sp} &= \gamma _{sp}I_{sp}-(\nu_{sp}+d_{sp})R_{sp}
\color{red}{+\textstyle{\sum_{q\in\mathcal{P}}} m_{Rspq}R_{sq}}
\end{aligned}
$$

$$
\Phi_{sp}=\sum_{k\in\mathcal{S}}\beta_{skp}\frac{S_{sp}I_{kp}}{N_p^{q_p}},\qquad q_p\in\{0,1\}
$$

<div style = "position: relative; bottom: -8%; font-size:20px;">

- JA, Davis, Hartley, Jordan, Miller \& PvdD. [A multi-species epidemic model with spatial dynamics](https://server.math.umanitoba.ca/~jarino/papers/ArinoDavisHartleyJordanMillerVdD-2005-MMB22.pdf). *Mathematical Medicine and Biology* **22**(2):129-142 (2005) 
- JA, Jordan \& PvdD. [Quarantine in a multi-species epidemic model with spatial dynamics](https://server.math.umanitoba.ca/~jarino/publications/ArinoJordanVdD-2007-MBS206.pdf). *Mathematical Biosciences* **206**(1):46-60 (2007)
</div>

---

<div class="theorem">

For the $|\mathcal{S}|\;|\mathcal{P}|$-SLIRS system, with equal movement rates for all states, define $\mathcal{R}_0$ using the method described earlier and use proportional incidence. If $\mathcal{R}_0<1$, then the DFE is globally asymptotically stable
</div>

---

# Proof of the result

To establish the global stability of the DFE, consider the **nonautonomous** system consisting of $L'$, $I'$ and $R'$, with $L'$ written in the form
$$
\begin{equation}\label{sys:nonauton_E}
\begin{aligned}
\frac{d}{dt}L_{sp} =& \sum_{j\in\mathcal{S}}
\beta_{sjp}(N_{sp}-L_{sp}-I_{sp}-R_{sp})\frac{I_{jp}}{N_{jp}} \\
&-(d_{sp}+\varepsilon_{sp})L_{sp}+\sum_{q\in\mathcal{P}} m_{spq}L_{sq}
-\sum_{q\in\mathcal{P}} m_{sqp}L_{sp}
\end{aligned}
\end{equation}
$$
in which $S_{sp}$ has been replaced by $N_{sp}-L_{sp}-I_{sp}-R_{sp}$, and $N_{sp}$ is a solution of the equation for the total population
$$
\begin{equation}
\frac{d}{dt}N_{sp}=\sum_{q\in\mathcal{P}}m_{spq}N_{sq}-\sum_{q\in\mathcal{P}}m_{sqp}N_{sp},
\end{equation}
$$

---

# To continue, we need this

<div class="theorem">

Suppose movement is identical for all epidemiological states, that disease is not lethal ($\delta_{sp}=0$), and that in each patch, birth compensates natural death, that is, $b_{sp}(N_{sp})=d_{sp}N_{sp}$. Then the movement model is given, for all $s=1,\ldots,|\mathcal{S}|$ and all $p=1,\ldots,|\mathcal{P}|$, by
$$
\begin{equation}\label{eq:Nsp_spSEIRS}
\frac{d}{dt}N_{sp}=\sum_{q\in\mathcal{P}}m_{spq}N_{sq}-\sum_{q\in\mathcal{P}}m_{sqp}N_{sp},
\end{equation}
$$
and there holds
$$
\lim_{t\to\infty}N_{sp}(t)=N_{sp}^*>0
$$
</div>

---

Write this system as
$$
\begin{equation}\label{sys:nonauton}
x' = f(t,x)
\end{equation}
$$
where $x$ is the $3|\mathcal{S}||\mathcal{P}|$ dimensional vector consisting of the $L_{sp}$, $I_{sp}$ and $R_{sp}$ 

The DFE of the original system corresponds to the equilibrium $x=0$ in the the nonautonomous system

System for $N'$ can be solved for $N_{sp}(t)$ independently of the epidemic variables, and result earlier implies that the time dependent functions $N_{sp}(t)\to N^*_{sp}$ as $t\to\infty$

---

Substituting this large time limit value $N_{sp}^*$ for $N_{sp}$ in the nonautonomous equation for $L'$ gives  
$$
\begin{equation}\label{sys:asympt_auton_E}
\begin{aligned}
\frac{d}{dt}L_{sp} =& \sum_{j\in\mathcal{S}}
\beta_{sjp}(N_{sp}^*-L_{sp}-I_{sp}-R_{sp})\frac{I_{jp}}{N_{jp}^*} \\
&-(d_{sp}+\varepsilon_{sp})L_{sp}+\sum_{q\in\mathcal{P}} m_{spq}L_{sq}
-\sum_{q\in\mathcal{P}} m_{sqp}L_{sp}
\end{aligned}
\end{equation}
$$
Therefore, the nonautonomous system is *asymptotically autonomous*, with limit equation
$$
\begin{equation}\label{sys:asympt_auton}
x' = g(x)
\end{equation}
$$

---

To show that 0 is a globally asymptotically stable equilibrium for the limit system, consider the linear system
$$
\begin{equation}\label{sys:linear}
x'=\mathcal{L}x
\end{equation}
$$
where $x$ is the $3|\mathcal{S}||\mathcal{P}|$ dimensional vector consisting of the $L_{sp}$, $I_{sp}$ and $R_{sp}$. In $\mathcal{L}$, we replace $S_{sp}/N_{jp}$ with $N^*_{sp}/N^*_{jp}$. Equations \eqref{sys:spSEIRS_Isp} and \eqref{sys:spSEIRS_Rsp} are not affected by this transformation, whereas \eqref{sys:spSEIRS_Esp} takes the form
$$ 
\begin{equation}\label{sys:lin_E}
\frac{dL_{sp}}{dt} = \sum_{j\in\mathcal{S}}
\beta_{sjp}\frac{N_{sp}^*}{N_{jp}^*}I_{jp}
-(d_{sp}+\varepsilon_{sp})L_{sp}+\sum_{q\in\mathcal{P}} m_{spq}L_{sq}
-\sum_{q\in\mathcal{P}} m_{sqp}L_{sp}
\end{equation}
$$
Comparing \eqref{sys:asympt_auton_E} and \eqref{sys:lin_E}, we note that $g(x)\leq\mathcal{L}x$ for all $x \in \mathbb{R}_+^{3|\mathcal{S}||\mathcal{P}|}$

---

In system \eqref{sys:linear}, the equations for $L_{sp}$ and $I_{sp}$ do not involve $R_{sp}$. Let $\tilde x$ be the part of the vector $x$ corresponding to the variables $E_{sp}$ and $I_{sp}$, and $\tilde{\mathcal{L}}$ be the corresponding submatrix of $\mathcal{L}$.

The method of used to prove local stability can also 
be applied to study the stability of the $\tilde x=0$ equilibrium of the subsystem $\tilde x'=\tilde{\mathcal{L}}\tilde x$, with $\tilde{\mathcal{L}}=F-V$

Therefore, if $\mathcal{R}_0<1$, then the equilibrium $\tilde x=0$ of the subsystem $\tilde x'=\tilde{\mathcal{L}}\tilde x$ is stable. When $\tilde x=0$, \eqref{sys:spSEIRS_Rsp} takes the form
$$
\frac{d}{dt}R_s = (M_s-D_s)R_s
$$
with $R_s=(R_{s1},\ldots,R_{s|\mathcal{P}|})^T$ and $D_s$ is the diagonal matrix with $p$th diagonal entry equal to $d_{sp}$

---

It was shown in the proof of Theorem~\ref{th:GAS_metapop1} that $(-M_s)$ is a singular M-matrix. It follows that $-M_s+D_s$ is a nonsingular M-matrix for each $D_s$

Thus the equilibrium $R_s=0$ of this linear system in $R_s$ is stable

As a consequence, the equilibrium $x=0$ of \eqref{sys:linear} is stable when $\mathcal{R}_0<1$

Using a standard comparison theorem, it follows that 0 is a globally asymptotically stable equilibrium of \eqref{sys:asympt_auton}

---

For $\mathcal{R}_0<1$, the linear system \eqref{sys:lin_E} and \eqref{sys:spSEIRS_Isp} has a unique equilibrium (the DFE) since its coefficient matrix $F-V$ is nonsingular

The proof of global stability is completed using results on asymptotically autonomous equations

---

<!-- _backgroundImage: "linear-gradient(to bottom, #f1c40f, 20%, white)" -->
# <!--- fit --->Epilogue / Postlude

---

# In conclusion

- Space is a fundamental component of the epidemic spread process and **cannot** be ignored, both in modelling **and** in public health decision making

- One way to model space is to use metapopulation models

- Metapopulation models are easy to analyse locally, give interesting problems at the global level


- We will in [Practicum 02](https://julien-arino.github.io/3MC-course-epidemiological-modelling/2022_04_3MC_EpiModelling_P02_Analysis_LargeScaleModels.html) that simulation (deterministic and stochastic) can be costly in RAM and cycles but is easy

- Metapopulation models are not the only solution