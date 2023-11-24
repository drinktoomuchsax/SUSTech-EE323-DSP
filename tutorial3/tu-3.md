## SUSTech_DSP_tutorial3

#### 12110623 曹正阳

## Q1 

#### (a)
$u[n] = [0,0,16,4,-22,40,-5,-27,9,-6,-1,3,-1,2,0]$
#### (b)
$v[n] = [0,0,0,0,0,6,12,-5,16,40,-8,23,22,21,0,9,2,0]$
#### (c)
$g[n] = [0,0,0,2454,-17,-37,41,52,-19,-5,-24,5,12,7,1]$

## Q2

$
y[n] = x_1[n]\circledast x_2[n] = \sum_{k=-\infty}^{\infty}x_1[k]x[n-k]
$

$
v[n] = x_1[n-N_1]\circledast x_2[n-N_1] = \sum_{k=-\infty}^{\infty}x_1[k-N_1]\circledast x_2[n-(k-N_2)]   =  \sum_{k=-\infty}^{\infty}x_1[k]\circledast x_2[(n-N_2-N_1)-k]  =  y[n-N_2-N_1]
$

## Q3

The convolution opertation is multipling and summing two sequence while sliding. So the length of the result is the sum of the length of two sequence minus 1.

Suppose L,M,N,K,R are all bigger than 0
The length:
- $h[n]: N+M+1$
- $g[n]: N-K+1$
- $w[n] -R+L+1$

So for each of the result, the length is:

- $y_1[n]: 2N+2M+1$
- $y_2[n]: 2N-2K+1$
- $y_3[n]: 2N-K+M+1$
- $y_4[n]: N+M+L-R+1$

## Q4
Because the $\mu[n]$ is the causal signal and $a^n\mu[n]$ is the causal system. 
So 
$$a^n\mu[n]\circledast\mu[n] = \sum^{\infty}_{k=-\infin}a^n\mu[k]\mu[n-k]=\sum^{\infty}_{k=0}a^n\mu[k]\mu[n-k]+\sum^{-1}_{k=-\infin}a^n\mu[k]\mu[n-k]=\sum^{\infty}_{k=0}a^n\mu[k]\mu[n-k]=\sum^{n}_{k=0}a^k\mu[n-k]=\frac{1-a^{n+1}}{1-a}\mu[n]$$

## Q5
$h_{cs}[n]=\frac{1}{2}(h[n]+h^*[-n])$
$h_{ca}[n]=\frac{1}{2}(h[n]-h^*[-n])$
$g_{cs}[n]=\frac{1}{2}(g[n]+g^*[-n])$
$g_{ca}[n]=\frac{1}{2}(g[n]-g^*[-n])$

#### (a)
$a[n]=h_{cs}[n]\circledast g_{cs}[n] = \frac{1}{2}(h[n]+h^*[-n])\circledast\frac{1}{2}(g[n]+g^*[-n])$
$a^*[-n]=\frac{1}{2}(h^*[-n]+h[n])\circledast\frac{1}{2}(g^*[-n]+g[n]) = a[n]$

so, the $a[n]$ is conjugate symmetric.

#### (b)
$b[n] = h_{ca}[n]\circledast g_{cs}[n] = \frac{1}{2}(h[n]-h^*[-n])\circledast\frac{1}{2}(g[n]+g^*[-n])$
$b^*[-n]  = \frac{1}{2}(h^*[-n]-h[n])\circledast\frac{1}{2}(g^*[-n]+g[n]) = -b[n]$

so, the $a[n]$ is conjugate antisymmetric.

#### (c)
$c[n] = h_{ca}[n]\circledast g_{ca}[n] = \frac{1}{2}(h[n]-h^*[-n])\circledast\frac{1}{2}(g[n]-g^*[-n])$
$c^*[-n]  = \frac{1}{2}(h^*[-n]-h[n])\circledast\frac{1}{2}(g^*[-n]-g[n]) = c[n]$

so, the $a[n]$ is conjugate symmetric.

## Q6

#### (a)

$\sum^{\infty}_{n=-\infty}|x_1[n]| = \sum^{\infty}_{n=-\infty}|\alpha^n\mu[n-1]| = \sum^{\infty}_{n=1}|\alpha|^n = \frac{|\alpha|-|\alpha|^n}{1-|\alpha|}$

when$|\alpha| < 1$,the $\frac{|\alpha|-|\alpha|^n}{1-|\alpha|}$ converges

#### (b)
$\sum^{\infty}_{n=-\infty}|x_2[n]| = \sum^{\infty}_{n=-\infty}|n\alpha^n\mu[n-1]| = \sum^{\infty}_{n=1}n|\alpha|^n = \sum^{\infty}_{n=1}(n+1)|\alpha|^n - |\alpha|^n  = \sum^{\infty}_{n=0}(n+1)|\alpha|^n - |\alpha|^n = \frac{1}{(1-|\alpha|)^2}-\frac{1}{1-|\alpha|}$

when$|\alpha| < 1$,the $\frac{1}{(1-|\alpha|)^2}-\frac{1}{1-|\alpha|}$ converges

#### (c)

$\sum^{\infty}_{n=-\infty}|x_3[n]| = \sum^{\infty}_{n=-\infty}|\frac{\mu[n-1]}{(2+n)(3+n)}|  = \sum^{\infty}_{n=1}|\frac{1}{(2+n)(3+n)}|  =  \sum^{\infty}_{n=1}|\frac{1}{(2+n)} -\frac{1}{(3+n)}| $

because $3+n>2+n$, so
$\sum^{\infty}_{n=1}|\frac{1}{(2+n)} -\frac{1}{(3+n)}| = \sum^{\infty}_{n=1}|\frac{1}{(2+n)}| - |\frac{1}{(3+n)}|$

$\lim_{n \to \infty}|\frac{1}{(2+n)}| - |\frac{1}{(3+n)}|  = 0$

So, the abs sum converges.


## Q7

The is is stable if and only if the $\sum^{\infty}_{n=-\infty}|h[n]|$ converges.

$\sum^{\infty}_{n=-\infty}|h[n]| = \sum^{\infty}_{n=-\infty}|\alpha^n\mu[-n-1]| = \sum^{-1}_{n=-\infty}|\alpha|^n = \frac{|\alpha|^{-\infty}-|\alpha|^{-1}}{1-|\alpha|}$

Only when $|\alpha|>1$, $\frac{|\alpha|^{-\infty}-|\alpha|^{-1}}{1-|\alpha|}$ converges.

So when $|\alpha|>1$, the system is BIBO stable.

## Q8
We all know that $\delta[n] = \mu[n] - \mu[n-1]$. So, $h[n] = s[n] - s[n-1]$.

Plus $y[n] = h[n]\circledast x[n]$, so $y[n] = s[n]\circledast x[n] -s[n-1]\circledast x[n]$


## Q9

$s[n] = \mu[n]\circledast h[n] = \sum^{\infty}_{k=-\infty}h[n]\mu[n-k]  =  \sum^{n}_{k=-\infty}h[n] = \sum^{n}_{k=-\infty}(-a)^n\mu[n] = \sum^{n}_{k=0}(-a)^n = \frac{1-(-a)^{n+1}}{1+a}$ where $n\geq0$

## Q10

$h[n] = x[n] \circledast h_T[n]\circledast Inverse(\delta[n] -h_5[n] \circledast h_T[n])$

where $h_T[n] = h_4[n]\circledast(h_1[n]\circledast h_2[n] +h_3[n])$