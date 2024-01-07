## SUSTech DSP tutorial8

#### 12110623 曹正阳

## Q1 
#### (a)
DFT: $$X[k] = \sum_{n=0}^{N-1} x[n] \cdot e^{-j(2\pi/N)kn}$$

let $n' = 0,L,2L,,,(N-1)L, 0\leq n' \leq NL-L$ , so $n = \frac{n'}{L}, 0\leq n\leq N-1$

$$Y[k] = \sum_{n=0}^{NL-1} y[n] \cdot e^{-j(2\pi/NL)kn} = \sum_{n'=0}^{(N-1)L} x[\frac{n'}{L}] \cdot e^{-j(2\pi/NL)kn'} $$

because $n = \frac{n'}{L}$, so 
$$Y[k] = \sum_{n'=0}^{(N-1)L} x[\frac{n'}{L}] \cdot e^{-j(2\pi/NL)kn'} = \sum_{n=0}^{N-1} x[n] \cdot e^{-j(2\pi/N)kn} =X[k]$$

this means that when $0\leq k \leq N-1$, $y[k] = X[k]$

And $e^{-j(2\pi/N)kn}$ is periodic, when $ N \leq k \leq LN-1$, the value of $e^{-j(2\pi/N)kn}$ will rotate to N samples before, that is when $ N \leq k \leq LN-1$, $y[k] = X[\langle k \rangle_N]$

#### (b)
<img src="/q1b.jpg" height="500" />

## Q2
#### (a)
$y[n] =\left\{{ −3, 4, −4, 0, −7, 8, 2, −5, 6}\right\}, −5 ≤ n ≤ 3 $ 
So $y[-3] = -4$

#### (b)
$z[n] =\left\{{−3, 4, −4, 0, −7, 8, 2, −5, 6}\right\}, −5 ≤ n ≤ 3 $ 
So $z[2] = -5$

## Q3
$$x[n]=\left\{{−3, 2, −1, 4}\right\}, 0 ≤ n ≤ 3 $$
$$h[\lang n-m\rang_4]=\left\{{1, 3, 2, −2,1, 3, 2, −2   ,1, 3, 2, −2,1, 3, 2, −2}\right\}, -8 ≤ n ≤ 7$$
$y[n] = \sum_{m=0}^{N-1}x[m]h[\lang n-m\rang_4]=\left\{{(-3*1+2*-2+-1*2+3*4), (-3*3+2*1+-1*-2+4*2), (-3*2+2*3+-1*1+4*-2), (-3*-2+2*2+-1*3+4*1)}\right\}$
So $y[n]  = \left\{{3, 3, −9, 11}\right\}, 0 ≤ n ≤ 3$

## Q4
#### (a)
Without loss of generality, let length of $x[n]$ is 4, length of $h[n]$ is 3.
$y_L[n] =x[n]\ast h[n]= \sum_{k=0}^{7} x[k]h[k-n]$
> $y_L[0] = h[0]x[0]$
> $y_L[1] = h[0]x[1] + h[1]x[0]$
> $y_L[2] = h[0]x[2] + h[1]x[1] + h[2]x[0]$
> $y_L[3] = h[0]x[3] + h[1]x[2] + h[2]x[1]$
> $y_L[4] = h[1]x[3] + h[2]x[2]$
> $y_L[5] = h[2]x[3]$

$y_C[n] = \sum_{k=0}^{3} x[k]h[\lang k-n\rang_4]$
> $y_C[0] = h[0]x[0] + h[1]x[3] + h[2]x[2]$
> $y_C[1] = h[0]x[1] + h[1]x[0] + h[2]x[3]$
> $y_C[2] = h[0]x[2] + h[1]x[1] + h[2]x[0]$
> $y_C[3] = h[0]x[3] + h[1]x[2] + h[2]x[1]$

So, $y_C[n] = y_L[n] + y_L[n+N]$, N is the length of $x[n]$

#### (b)
$y_L[n] = [-6,    22,    -3  , -54,    77 ,    9,   -28  ,  63 ,   -6  ,  13    ,12]$

So, $y_C[n] = [-6-28,22+63,-3-6,-54+13,77+12,9] = [-34,85,-9,-41,89,9]$

## Q5
> Correct: "determine \(X[k]\) in terms of \(G[k]\)  and \(X[k]\)." -> "determine \(X[k]\) in terms of \(G[k]\)  and \(H[k]\)."

According to Decimation-in-time FFT algorithm
$$G[k] = \frac{1}{2}(X_0[\lang k\rang_{\frac{N}{2}}] +X_1[\lang k\rang_{\frac{N}{2}}])$$
$$H[k] = \frac{1}{2}(X_0[\lang k\rang_{\frac{N}{2}}] -X_1[\lang k\rang_{\frac{N}{2}}])$$
and
$$X[k] = X_0[\lang k\rang_{\frac{N}{2}}] + W_N^k X_1[\lang k\rang_{\frac{N}{2}}]$$
So $X[k] = (1 + W_N^k) G\left[\langle k \rangle_{N/2}\right] + (1 - W_N^k) H\left[\langle k \rangle_{N/2}\right]$$

## Q6
#### (a)
when \(N\) is even so that \(N/2\) is an integer.

\[ X[N/2] = \sum_{n=0}^{N-1} x[n] \cdot e^{-j(2\pi/N)(N/2)n} \]

\[ X[N/2] = \sum_{n=0}^{N-1} x[n] \cdot e^{-j\pi n} \]

\(e^{-j\pi n}\) takes values of \((-1)^n\). therefore:

\[ X[N/2] = \sum_{n=0}^{N-1} x[n] \cdot (-1)^n \]


separate the sum into two part, one is positive and the other is minus:

\[ X[N/2] = \sum_{n=0}^{N-1} x[n] \cdot (-1)^n = \sum_{n=0}^{N/2-1} x[n] - \sum_{n=N/2}^{N-1} x[n] \]

since the \[x[n]] is symmetric, the sum cancels out:

\[ X[N/2] = 0 \]

#### (b)
\(x[n]\) is an antisymmetric sequence,so \(x[n] = -x[\langle N - 1 - n \rangle_N]\), so:
\[ X[k] = \sum_{n=0}^{N-1} (-x[\langle N - 1 - n \rangle_N]) \cdot e^{-j(2\pi/N)kn} \]

when \(k = 0\):

\[ X[0] = \sum_{n=0}^{N-1} (-x[\langle N - 1 - n \rangle_N]) \cdot e^{-j(2\pi/N) \cdot 0 \cdot n} \]

\[ X[0] = \sum_{n=0}^{N-1} (-x[\langle N - 1 - n \rangle_N]) \]

Now, the sum of an antisymmetric sequence over a symmetric range is zero because the positive and negative terms cancel each other out, that is:

\[ X[0] = 0 \]

#### (c)

\[ X[k] = \sum_{n=0}^{N-1} x[n] \cdot e^{-j(2\pi/N)kn} \]

substitute $n$ with $2l$:

\[ X[2l] = \sum_{n=0}^{N-1} x[n] \cdot e^{-j(2\pi/N)(2l)n} = \sum_{n=0}^{N-1} x[n] \cdot e^{-j(4\pi/N)ln} \]

because \(x[n] = -x[\langle n + M \rangle_N]\):

\[ X[2l] = \sum_{n=0}^{N-1} (-x[\langle n + M \rangle_N]) \cdot e^{-j(4\pi/N)ln} \]

since \(N = 2M\), we have:

\[ X[2l] = \sum_{n=0}^{N-1} (-x[\langle n + M \rangle_{2M}]) \cdot e^{-j(4\pi/(2M))ln} \]

and \(\langle n + M \rangle_{2M}\) is equivalent to \(n + M - 2M = n - M\) for \(0 \leq n \leq 2M - 1\). so:

\[ X[2l] = \sum_{n=0}^{N-1} -x[n - M] \cdot e^{-j(4\pi/(2M))ln} \]

for \(l = 0, 1, \ldots, M-1\), the term \(e^{-j(4\pi/(2M))ln}\) will be periodic with a period of \(2M/l\), and since \(N = 2M\), the period is \(N/l\). Therefore, the sum over \(n\) will include terms that form a geometric series with a common ratio of \(e^{-j(4\pi/(2M))l(N/l)} = e^{-j2\pi l} = 1\).

\[ X[2l] = \sum_{n=0}^{N-1} -x[n - M] \cdot e^{-j(4\pi/(2M))ln} = \sum_{n=0}^{N-1} x[n - M] \]

## Q7
DFT of $x[n]$ : $X[k] = DFT([2,1,2,0]) = [5,-2-i,1,-2+i]$
DFT of $w[n]$ : $X[k] = DFT([-4,0-3,2]) = [-5,-3-2i,1,-3+2i]$

$Y[k] = \frac{W[k]}{X[k]} = [1,-1-i,1,-1+i]$
so 
$$y[n] = [-2,1,-2,1]$$