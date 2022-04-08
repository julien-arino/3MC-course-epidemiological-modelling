---
marp: true
title: Practicum 03 - Analysis, studying stochastic models in R. Simulating agent-based models
description: 3MC Course on Epidemiological Modelling - Julien Arino - Practicum 03 - Analysis, studying stochastic models in R. Simulating agent-based models
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

# Practicum 03 - Analysis, studying stochastic models in R. Simulating agent-based models

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
- Analysing stochastic models
- More on stochastic models in R
- Simulating agent-based models

---

<!-- _backgroundImage: "linear-gradient(to bottom, #f1c40f, 20%, white)" -->
# <!--fit-->Analysing stochastic models

---

<!-- _backgroundImage: "radial-gradient(white, 80%, #156C26)" -->
# <!--fit-->Analysing stochastic models
- Asymptotic behaviour of a DTMC
- Regular DTMC
- Absorbing DTMC
- Random walks
- CTMC

---

<!-- _backgroundImage: "linear-gradient(to bottom, #156C26, 20%, white)" -->
# <!--fit-->Asymptotic behaviour of a DTMC

---

Let $p_i(n)$ be the probability that the state $S_i$ will occur on the $n^{th}$ repetition of the experiment, $1\leq i\leq r$

Since one the states $S_i$ must occur on the $n^{th}$ repetition
$$
p_1(n)+p_2(n)+\cdots+p_r(n)=1
$$

---

Let $p_i(n+1)$ be the probability that state $S_i$, $1\leq i\leq r$, occurs on $(n+1)^{th}$ repetition of the experiment

There are $r$ ways to be in state $S_i$ at step $n+1$:
- Step $n$ is $S_1$. Probability of getting $S_1$ on $n^{th}$ step is $p_1(n)$, and probability of having $S_i$ after $S_1$ is $p_{1i}$. Therefore, by multiplication principle, $P(S_i|S_1)=p_{1i}p_1(n)$
- We get $S_2$ on step $n$ and $S_i$ on step $(n+1)$. Then $P(S_i|S_2)=p_{2i}p_2(n)$
- ...
-  Probability of occurrence of $S_i$ at step $n+1$ if $S_r$ at step $n$ is $P(S_i|S_r)=p_{ri}p_r(n)$

Therefore, $p_i(n+1)$ is sum of all these
$$
\begin{align*}
p_i(n+1) &= P(S_i|S_1)+\cdots+P(S_i|S_r) \\
&= p_{1i}p_1(n)+\cdots+p_{ri}p_r(n)
\end{align*}
$$

---

Therefore,
$$
\begin{align*}
p_1(n+1) &= p_{11}p_1(n)+p_{21}p_2(n)+\dots+p_{r1}p_r(n) \\
& \vdots\\
p_k(n+1) &= p_{1k}p_1(n)+p_{2k}p_2(n)+\dots+p_{rk}p_r(n) \\
& \vdots\\
p_r(n+1) &= p_{1r}p_1(n)+p_{2r}p_2(n)+\dots+p_{rr}p_r(n)
\end{align*}
$$

---

In matrix form
$$
p(n+1)=p(n)P, \quad n=1,2,3,\dots
$$
where $p(n)=(p_1(n),p_{2}(n),\dots , p_r(n))$ is a (row) probability vector and $P=(p_{ij})$ is a $r\times r$ **transition matrix**
$$
P=
\begin{pmatrix}
p_{11} & p_{12} & \cdots & p_{1r} \\
p_{21} & p_{22} & \cdots & p_{2r} \\
&&& \\
p_{r1} & p_{r2} & \cdots & p_{rr}
\end{pmatrix}
$$

---

So
$$
(p_1(n+1),\ldots,p_r(n+1))= 
(p_1(n),\ldots,p_r(n))
\begin{pmatrix}
p_{11} & p_{12} & \cdots & p_{1r} \\
p_{21} & p_{22} & \cdots & p_{2r} \\
&&& \\
p_{r1} & p_{r2} & \cdots & p_{rr}
\end{pmatrix}
$$

It is easy to check that this gives the same expression as 
$$
p(n+1)=p(n)P, \quad n=1,2,3,\dots
$$

---

# Stochastic matrices

<div class="definition">

The nonnegative $r\times r$ matrix $M$ is **stochastic** if $\sum_{j=1}^ra_{ij}=1$ for all $i=1,2,\dots, r$
</div>

<div class="theorem">

Let $M$ be a stochastic matrix $M$. Then all eigenvalues $\lambda$ of $M$ are such that $|\lambda|\leq 1$. Furthermore, $\lambda =1$ is an eigenvalue of $M$
</div>

To see that $1$ is an eigenvalue, write the definition of a stochastic matrix, i.e., $M$ has row sums 1. In vector form, $M\mathbf{1}=\mathbf{1}$. Now remember that $\lambda$ is an eigenvalue of $M$, with associated eigenvector $v$, iff $Mv=\lambda v$. So, in the expression $M\mathbf{1}=\mathbf{1}$, we read an eigenvector, $\mathbf{1}$, and an eigenvalue, $1$

---

# Asymptotic behavior

Let $p(0)$ be the initial distribution (row) vector. Then
$$
\begin{align*}
p(1) &= p(0)P \\
p(2) &= p(1)P\\
&= (p(0)P)P \\
&= p(0)P^2
\end{align*}
$$
Iterating, we get that for any $n$,
$$
p(n)=p(0)P^n
$$
Therefore, 
$$
\lim_{n\rightarrow +\infty}p(n)=\lim_{n\rightarrow +\infty}p(0)P^n=p(0)\lim_{n\rightarrow +\infty}P^n
$$

---

# Additional properties of stochastic matrices

<div class="theorem">

If $M,N$ are stochastic matrices, then $MN$ is a stochastic matrix
</div>

<div class="theorem">

If $M$ is a stochastic matrix, then for any $k\in\mathbb{N}$, $M^k$ is a stochastic matrix
</div>

---

<!-- _backgroundImage: "linear-gradient(to bottom, #156C26, 20%, white)" -->
# Regular DTMC

---

# Not much use in disease models

- In disease models, the state $I=0$ is *absorbing*, so chains are not *regular*
- Worth taking a quick look at, though

---

#  Regular Markov chain

<div class="definition">

A **regular Markov chain** is one in which $P^k$ is positive for some integer $k>0$, i.e., $P^k$ has only positive entries, no zero entries
</div>

<div class="definition">

A nonnegative matrix $M$ is **primitive** if, and only if, there is an integer $k>0$ such that $M^k$ is positive
</div>

<div class="theorem">

A Markov chain is regular if, and only if, the transition matrix $P$ is primitive
</div>

---

#  Important result for regular Markov chains

<div class="theorem">

If $P$ is the transition matrix of a regular Markov chain, then

1. the powers $P^n$ approach a stochastic matrix $W$
2. each row of $W$ is the same (row) vector $w=(w_1,\ldots,w_r)$
3. the components of $w$ are positive
</div>

So if the Markov chain is regular
$$
\lim_{n\rightarrow +\infty}p(n)=p(0)\lim_{n\rightarrow +\infty}P^n
=p(0)W
$$

---

#  Left and right eigenvectors

Let $M$ be an $r\times r$ matrix, $u,v$ be two column vectors, $\lambda\in\mathbb{R}$. Then, if  
$$
Mu=\lambda u
$$
$u$ is the (right) eigenvector corresponding to $\lambda$, and if
$$
v^TM=\lambda v^T
$$
then $v$ is the left eigenvector corresponding to $\lambda$. Note that to a given eigenvalue there corresponds one left and one right eigenvector

---

The vector $w$ is in fact the left eigenvector corresponding to the eigenvalue 1 of $P$. (We already know that the (right) eigenvector corresponding to 1 is $\mathbf{1}$.)

To see this, remark that, if $p(n)$ converges, then $p(n+1)=p(n)P$, so $w$ is a fixed point of the system. We thus write
$$
wP=w
$$
and solve for $w$, which amounts to finding $w$ as the left eigenvector corresponding to the eigenvalue 1

Alternatively, we can find $w$ as the (right) eigenvector associated to the eigenvalue 1 for the transpose of $P$
$$
P^Tw^T=w^T
$$

---

Now remember that when you compute an eigenvector, you get a result that is the eigenvector, to a multiple

So the expression you obtain for $w$ might have to be normalized (you want a probability vector). Once you obtain $w$, check that the norm $\|w\|$ defined by
$$
\|w\|=w_1+\cdots+w_r
$$
is equal to one. If not, use
$$
\frac{w}{\|w\|}
$$

---

# Another way to check regularity
<div class="theorem">

A matrix $M$ is primitive if the associated connection graph is strongly connected, i.e., that there is a path between any pair $(i,j)$ of states, and that there is at least one positive entry on the diagonal of $M$
</div>

This is checked directly on the transition graph
![width:100% center](https://raw.githubusercontent.com/julien-arino/3MC-course-epidemiological-modelling/main/FIGS/graphe_hybride.png)

---

<!-- _backgroundImage: "linear-gradient(to bottom, #156C26, 20%, white)" -->
# Absorbing DTMC

---

#  Absorbing states, absorbing chains

<div class="definition">

A state $S_i$ in a Markov chain is **absorbing** if whenever it occurs on the $n^{th}$ generation of the experiment, it then occurs on every subsequent step. In other words, $S_i$ is absorbing if $p_{ii}=1$ and $p_{ij}=0$ for $i\neq j$
</div>

<div class="definition">

A **Markov chain is absorbing** if it has at least one absorbing state, and if from every state it is possible to go to an absorbing state
</div>

<div class="definition">

In an absorbing Markov chain, a state that is not absorbing is called **transient**
</div>

---

#  Some questions on absorbing chains

Suppose we have a chain like the following

![width:100% center](https://raw.githubusercontent.com/julien-arino/3MC-course-epidemiological-modelling/main/FIGS/graphe_absorbant.png)

1. Does the process eventually reach an absorbing state?
2. Average number of times spent in a transient state, if starting in a transient state?
3. Average number of steps before entering an absorbing state?
4. Probability of being absorbed by a given absorbing state, when there are more than one, when starting in a given transient state?

---

#  Reaching an absorbing state

Answer to question 1:
<div class="theorem">

In an absorbing Markov chain, the probability of reaching an absorbing state is 1
</div>

---

#  Standard form of the transition matrix

For an absorbing chain with $k$ absorbing states and $r-k$ transient states, the transition matrix can be written as
$$
P=\begin{pmatrix}
\mathbb{I}_k & \mathbf{0} \\
R & Q
\end{pmatrix}
$$

|     | Absorbing states | Transient states |
|:---:|:---:|:---:|
| **Absorbing states** | $\mathbb{I}_k$ | $\mathbf{0}$ |
| **Transient states** | $R$ | $Q$ |

$\mathbb{I}_k$ the $k\times k$ identity, $\mathbf{0}\in\mathbb{R}^{k\times(r-k)}$, $R\in\mathbb{R}^{(r-k)\times k}$, $Q\in\mathbb{R}^{(r-k)\times(r-k)}$

---

The matrix $\mathbb{I}_{r-k}-Q$ is invertible. Let

- $N=(\mathbb{I}_{r-k}-Q)^{-1}$ be the **fundamental matrix** of the Markov chain
- $T_i$ be the sum of the entries on row $i$ of $N$
- $B=NR$

Answers to our remaining questions:

2. $N_{ij}$ is the average number of times the process is in the $j$th transient state if it starts in the $i$th transient state
3. $T_i$ is the average number of steps before the process enters an absorbing state if it starts in the $i$th transient state
4. $B_{ij}$ is the probability of eventually entering the $j$th absorbing state if the process starts in the $i$th transient state

---

<!-- _backgroundImage: "linear-gradient(to bottom, #156C26, 20%, white)" -->
# Random walks

---

#  Drunk man's walk 1.0 (regular case)

- chain of states $S_1,\ldots,S_p$
- if in state $S_i$, $i=2,\ldots,p-1$, probability 1/2 of going left (to $S_{i-1}$) and 1/2 of going right (to $S_{i+1}$)
- if in state $S_1$, probability 1 of going to $S_2$
- if in state $S_p$, probability 1 of going to $S_{p-1}$

![width:100% center](https://raw.githubusercontent.com/julien-arino/3MC-course-epidemiological-modelling/main/FIGS/drunk_mans_walk_regular.png)

---

#  Transition matrix for DMW 1.0

$$
P=\begin{pmatrix}
0 & 1 & 0 & 0 & 0 & \cdots & 0\\
1/2 & 0 & 1/2 & 0 & & & \\
0 & 1/2 & 0 & 1/2 & & & \\
\vdots & & \ddots & \ddots & \ddots & & \vdots \\
& & & & & & \\
& & & & 1/2 & 0 & 1/2 \\
& & & & 0 & 1 & 0
\end{pmatrix}
$$
Clearly a primitive matrix, so a regular Markov chain

---

We need to solve $w^TP=w^T$, that is,
$$
\begin{align*}
\frac 12 w_2 &= w_1 \\
w_1 +\frac 12 w_3 &= w_2 \\
\frac 12 w_2+\frac 12 w_4 &= w_3 \\
\frac 12 w_3+\frac 12 w_5 &= w_4 \\
& \vdots \\
\frac 12 w_{p-3}+\frac 12 w_{p-1} &= w_{p-2} \\
\frac 12 w_{p-2}+w_p &= w_{p-1} \\
\frac 12 w_{p-1} &= w_p
\end{align*}
$$

---

Express everything in terms of $w_1$:
$$
\begin{align*}
w_2 &= 2w_1 \\
w_1 +\frac 12 w_3 &= w_2 \Leftrightarrow w_3 = 2(w_2-w_1)=2w_1\\
\frac 12 w_2+\frac 12 w_4 &= w_3 \Leftrightarrow w_4=2(w_3-\frac 12 w_2)=2(w_3-w_1)=2w_1\\
\frac 12 w_3+\frac 12 w_5 &= w_4 \Leftrightarrow w_5=2(w_4-\frac 12 w_3)=2(w_4-w_1)=2w_1\\
& \vdots \\
\frac 12 w_{p-3}+\frac 12 w_{p-1} &= w_{p-2} \Leftrightarrow w_{p-1} = 2w_1 \\
\frac 12 w_{p-2}+w_p &= w_{p-1} \Leftrightarrow w_p=w_{p-1}-\frac 12 w_{p-2}=w_1\\
\frac 12 w_{p-1} &= w_p \qquad (\textrm{confirms that }w_p=w_1)
\end{align*}
$$

---

So we get
$$
w^T=\left(w_1,2w_1,\ldots,2w_1,w_1\right)
$$
We have
$$
\begin{align*}
\sum_{i=1}^p w_i &= w_1+\left(\sum_{i=2}^{p-1}2w_1\right)+w_1 \\
&= 2w_1+\sum_{i=2}^{p-1}2w_1 \\
&= \sum_{i=1}^{p-1} 2w_1  \\
&= 2w_1\sum_{i=1}^{p-1}1  \\
&= 2w_1(p-1)
\end{align*}
$$

---

Since 
$$
\sum_{i=1}^p w_i = 2w_1(p-1)
$$
to get a probability vector, we need to take 
$$
w_1=\frac{1}{2(p-1)}
$$
So 
$$
w^T=\left(\frac{1}{2(p-1)},\frac{1}{p-1},\ldots,\frac{1}{p-1},\frac{1}{2(p-1)}\right)
$$

---

Now assume we take an initial condition with $p(0)=(1,0,\ldots,0)$, i.e., the walker starts in state 1. Then
$$
\lim_{t\to\infty}p(t)=p(0)W=p(0)w=p(0)\cdot w^T
$$
so
$$
\lim_{t\to\infty}p(t)=(1,0,\ldots,0)\cdot\left(\frac{1}{2(p-1)},\frac{1}{p-1},\ldots,\frac{1}{p-1},\frac{1}{2(p-1)}\right)
$$

---

#  Drunk man's walk 2.0 (absorbing case)

- chain of states $S_1,\ldots,S_p$
- if in state $S_i$, $i=2,\ldots,p-1$, probability 1/2 of going left (to $S_{i-1}$) and 1/2 of going right (to $S_{i+1}$)
- if in state $S_1$, probability 1 of going to $S_1$
- if in state $S_p$, probability 1 of going to $S_p$

![width:100% center](https://raw.githubusercontent.com/julien-arino/3MC-course-epidemiological-modelling/main/FIGS/drunk_mans_walk_absorbing.png)

---

#  Transition matrix for DMW 2.0

$$
P=\begin{pmatrix}
1 & 0 & 0 & 0 & 0 & \cdots & 0\\
1/2 & 0 & 1/2 & 0 & & & \\
0 & 1/2 & 0 & 1/2 & & & \\
\vdots & & \ddots & \ddots & \ddots & & \vdots \\
& & & & & & \\
& & & & 1/2 & 0 & 1/2 \\
& & & & 0 & 0 & 1
\end{pmatrix}
$$

---

#  Put $P$ in standard form

Absorbing states are $S_1$ and $S_p$, write them first, then write other states

|     | $S_1$ | $S_p$ | $S_2$ | $S_3$ | $S_4$ | $\cdots$ | $S_{p-2}$ | $S_{p-1}$ |
|:---:|:-----:|:-----:|:-----:|:-----:|:-----:|:--------:|:---------:|:---------:|
$S_1$ | 1 | 0 | 0 | 0 | 0 | $\cdots$ | 0 | 0 |
$S_p$ | 0 | 1 | 0 | 0 | 0 | $\cdots$ | 0 | 0 |
$S_2$ | 1/2 | 0 | 0 | 1/2 | 0 | $\cdots$ | 0 | 0 |
$S_3$ | 0 | 0 | 1/2 | 0 | 1/2 | $\cdots$ | 0 | 0 |
$\vdots$ |  |  |  |  | | | | |
$S_{p-2}$ | 0 | 0 | 0 | 0 | 0 | $\cdots$ | 0 | 1/2 |
$S_{p-1}$ | 0 | 1/2 | 0 | 0 | 0 | $\cdots$ | 1/2 | 0 |

---

So we find
$$
P=\begin{pmatrix}
\mathbb{I}_2 & \mathbf{0} \\
R & Q
\end{pmatrix}
$$
where $\mathbf{0}$ a $2\times(p-2)$-matrix, $R$ a $(p-2)\times 2$ matrix and $Q$ a $(p-2)\times (p-2)$ matrix

---

$$
R=
\begin{pmatrix}
1/2 & 0 \\
0 & 0 \\
\vdots & \vdots \\
0 & 0 \\
0 & 1/2   
\end{pmatrix}
$$
and
$$
Q=
\begin{pmatrix}
0 & 1/2 & 0 & \\
1/2 & 0 & 1/2 & \\
0 & 1/2 & 0 & \\
&& \ddots & \ddots & \ddots \\
&&&& \\
0 &&& 1/2 & 0 & 1/2 \\
0 &&&&1/2 & 0
\end{pmatrix}
$$

---

$$
\mathbb{I}_{p-2}-Q=
\begin{pmatrix}
1 & -1/2 & 0 & \\
-1/2 & 1 & -1/2 & \\
0 & -1/2 & 1 & \\
&& \ddots & \ddots & \ddots \\
&&&& \\
0 &&& -1/2 & 1 & -1/2 \\
0 &&&& -1/2 & 1
\end{pmatrix}
$$

This is a **symmetric tridiagonal Toeplitz** matrix 

(symmetric: obvious; tridiagonal: there are three diagonal bands; Toeplitz: each diagonal band is constant)

---

#  Inverting a symmetric tridiagonal matrix

Gérard Meurant [A Review on the Inverse of Symmetric Tridiagonal and Block Tridiagonal Matrices](https://doi-org.uml.idm.oclc.org/10.1137/0613045) (1992): if 
$$
J_k=
\begin{pmatrix}
\alpha_1 & \beta_1 \\
\beta_1 & \alpha_2 & \beta_2 \\
& \ddots &\ddots &\ddots \\
&& \beta_{k-2} & \alpha_{k-1} & \beta_{k-1} \\
&&& \beta_{k-1} & \alpha_k
\end{pmatrix}
$$
$$
\delta_1=\alpha_1,\quad \delta_j=\alpha_j-\frac{\beta_{j-1}^2}{\delta_{j-1}},j=2,\ldots,k
$$
$$
d^{(k)}_k=\alpha_k,\quad d^{(k)}_j=\alpha_j-\frac{\beta_j^2}{d^{(k)}_{j+1}},j=k-1,\ldots,1
$$
then we have the result on the next slide

---

#  Inverse of a symmetric tridiagonal matrix

<div class="theorem">

The inverse of the symmetric tridiagonal matrix $J_k$ is given by
$$
(J_k^{-1})_{ij} = (-1)^{j-i}\beta_i\cdots\beta_{j-1}\frac{d_{j+1}^{(k)}\cdots d_k^{(k)}}{\delta_i\cdots\delta_k},\;\forall i,\forall j>i
$$
$$
(J_k^{-1})_{ii} = \frac{d_{i+1}^{(k)}\cdots d_k^{(k)}}{\delta_i\cdots\delta_k},\;\forall i
$$
</div>

---

Note that $\alpha_1=\cdots=\alpha_k=1$ and $\beta_1=\cdots=\beta_{k-1}=-1/2$

Write $\alpha:=\alpha_i=1$ and $\beta:=\beta_i=-1/2$

We have $\delta_1 = \alpha = 1$, and the general term takes the form
$$
\delta_j = \alpha-\frac{\beta^2}{\delta_{j-1}}=1-\frac{1}{4\delta_{j-1}},\quad j=2,\ldots,k
$$

---

$$
\begin{align*}
\delta_2 &= 1-\frac 14= \frac 34 \\
\delta_3 &= 1-\frac{1}{4\frac 34} = \frac 23 \\
\delta_4 &= 1-\frac{1}{4\frac 23} = 1-\frac 38 = \frac 58 \\
\delta_5 &= 1-\frac{1}{4\frac 58} = 1-\frac 25 = \frac 35 \\
\delta_6 &= 1-\frac{1}{4\frac 35} = 1-\frac 5{12} = \frac 7{12} \\
\delta_7 &= 1-\frac{1}{4\frac 7{12}} = 1-\frac 37 = \frac 47
\end{align*}
$$

---

Taking a look at the few terms in the sequence, we get the feeling that
$$
\delta_{2n}=\frac{2n+1}{4n} \textrm{ and } \delta_{2n+1}=\frac{n+1}{2n+1}
$$
A little induction should confirm this. Induction hypothesis (changing indices for odd $\delta$):
$$
\mathcal{P}_n:
\begin{cases}
\delta_{2n-1} &= \frac{n}{2n-1} \\
\delta_{2n} &= \frac{2n+1}{4n}
\end{cases}
$$
$\mathcal{P}_1$ is true. Assume $\mathcal{P}_j$. Then
$$
\delta_{2j+1} = 1-\frac{1}{4\delta_{2j}}=1-\frac{1}{4\frac{2j+1}{4j}}=1-\frac{j}{2j+1}=\frac{j+1}{2j+1}
$$
$$
\delta_{2j+2} = 1-\frac{1}{4\delta_{2j+1}} = 1-\frac{1}{4\frac{j+1}{2j+1}}=1-\frac{2j+1}{4(j+1)}=\frac{2(j+1)+1}{4(j+1)}
$$
So $\mathcal{P}_{j+1}$ holds true

---

In fact, we can go further, by expressing
$$
\delta_{2n}=\frac{2n+1}{4n} \textrm{ and } \delta_{2n+1}=\frac{n+1}{2n+1}
$$
in terms of odd and even $j$. If $j$ is even,
$$
\delta_j=\frac{j+1}{2j}
$$
while if $j$ is odd,
$$
\delta_j=\frac{(j+1)/2}{j}
$$
But the latter gives
$$
\delta_j=\frac{j+1}{2j}
$$
so this formula holds for all $j$'s

---

For the $d_j^{(k)}$'s, we have $d_k^{(k)}=1$ and
$$
d_j^{(k)} = 1-\frac{1}{4d_{j+1}^{(k)}}
$$
So $d_k^{(k)}=\delta_1$ and
$$
d_{k-j+1}^{(k)} = \delta_j=\frac{j+1}{2j},\quad j=2,\ldots,k
$$
The form
$$
d_j^{(k)} = \delta_{k-j+1}
$$
is also useful

---

In summary

| $\delta_1$ | $\delta_2$ | $\cdots$ | $\delta_j$ | $\cdots$ | $\delta_{k-1}$ | $\delta_k$ |
|:----------:|:----------:|:--------:|:----------:|:--------:|:--------------:|:----------:|
| $d_k^{(k)}$ | $d_{k-1}^{(k)}$ | $\cdots$ | $d_{k-j+1}^{(k)}$ | $\cdots$ | $d_2^{(k)}$ | $d_1^{(k)}$ |
| 1 | $\frac 34$ | $\cdots$ | $\frac{j+1}{2j}$ | $\cdots$ | $\frac{k}{2(k-1)}$ | $\frac{k+1}{2k}$ |

---

In $J^{-1}$, the following terms appear
$$
\frac{d_{j+1}^{(k)}\cdots d_k^{(k)}}{\delta_i\cdots\delta_k},\;\forall i,\forall j>i
$$
and
$$
\frac{d_{i+1}^{(k)}\cdots d_k^{(k)}}{\delta_i\cdots\delta_k},\;\forall i
$$

---

We have, $\forall i$,
$$
\begin{align*}
\frac{d_{i+1}^{(k)}\cdots d_k^{(k)}}{\delta_i\cdots\delta_k}
&= \frac{\delta_{k-(i+1)+1}\cdots\delta_{k-k+1}}{\delta_i\cdots\delta_k} \\
&= \frac{\delta_{k-i}\cdots\delta_{1}}{\delta_i\cdots\delta_k} \\
&= \frac{\delta_{1}\cdots\delta_{k-i}}{\delta_i\cdots\delta_k} \\
&= \frac{\prod\limits_{j=1}^{k-i}\frac{j+1}{2j}}{\prod\limits_{j=i}^{k}\frac{j+1}{2j}} \\
&= \prod\limits_{j=1}^{k-i}\frac{j+1}{2j}\prod\limits_{j=i}^{k}\frac{2j}{j+1}
\end{align*}
$$

---

<!-- _backgroundImage: "linear-gradient(to bottom, #156C26, 20%, white)" -->
# CTMC

---

# Several ways to formulate CTMC's

A continuous time Markov chain can be formulated in terms of
- infinitesimal transition probabilities
- branching process
- time to next event

Here, time is in $\mathbb{R}_+$

---

For small $\Delta t$,
$$
\begin{align*}
p_{ji}(\Delta t) &= \mathbb{P}\left\{I(t+\Delta)=j|I(t)=i\right\} \\
&=
\begin{cases}
B(i)\Delta t+o(\Delta t) & j=i+1 \\
D(i)\Delta t+o(\Delta t) & j=i-1 \\
1-[B(i)+D(i)]\Delta t+o(\Delta t) & j=i \\
o(\Delta t) & \textrm{otherwise}
\end{cases}
\end{align*}
$$
with $o(\Delta t)\to 0$ as $\Delta t\to 0$

---

# Forward Kolmogorov equations

Assume we know $I(0)=k$. Then
$$
\begin{multline*}
p_i(t+\Delta t)= p_{i-1}(t)B(i-1)\Delta t+p_{i+1}(t)D(i+1)\Delta t \\
+p_i(t)[1-(B(i)+D(i))\Delta t]+o(\Delta t)
\end{multline*}
$$
Compute $(p_i(t+\Delta t)-p_i(t))/\Delta t$ and take $\lim_{\Delta t\to 0}$, giving
$$
\begin{align*}
\frac d{dt}p_0 &= p_1D(1) \\
\frac d{dt}p_i &= p_{i-1}B(i-1)+p_{i+1}D(i+1)-p_i[B(i)+D(i)] \quad i=1,\ldots,N
\end{align*}
$$

**Forward Kolmogorov equations** associated to the CTMC

---

# In vector form

Write previous system as
$$
p'=Qp
$$
with
$$
Q=
\begin{pmatrix}
0 & D(1) & 0 & \cdots & 0 \\
0 & -(B(1)+D(1)) & D(2) & \cdots & 0 \\
0 & B(1) & -(B(2)+D(2)) & \cdots & 0 \\
&&& \\
&&&& D(N) \\
&&&& -D(N)
\end{pmatrix}
$$
$Q$ **generator matrix**. Of course,
$$
p(t)=e^{Qt}p(0)
$$


---

# Linking DTMC and CTMC for small $\Delta t$

DTMC:
$$
p(t+\Delta t)=P(\Delta t)p(t)
$$
for transition matrix $P(\Delta t)$. Let $\Delta t\to 0$, obtain Kolmogorov equations for CTMC
$$
\frac d{dt} p = Qp
$$
where
$$
Q=\lim_{\Delta t\to 0}\frac{P(\Delta t)-\mathbb{I}}{\Delta t}=P'(0)
$$


---

<!-- _backgroundImage: "linear-gradient(to bottom, #f1c40f, 20%, white)" -->
# More on stochastic models in R

---

# Parallelisation

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

![bg contain](https://raw.githubusercontent.com/julien-arino/3MC-course-epidemiological-modelling/main/FIGS/many_CTMC_sims_with_means.png)

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

---

<!-- _backgroundImage: "linear-gradient(to bottom, #f1c40f, 20%, white)" -->
# Simulating agent-based models


---

# Some simulation systems

- [AnyLogic](https://www.anylogic.com/). Free (limited) personal edition, not open source
- [NetLogo](http://ccl.northwestern.edu/netlogo/). GPL