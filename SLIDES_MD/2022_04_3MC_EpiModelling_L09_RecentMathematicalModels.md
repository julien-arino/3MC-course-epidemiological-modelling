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

---

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

