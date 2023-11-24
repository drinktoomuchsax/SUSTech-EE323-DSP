## 4.2.3
Determine an expression for 𝑋(𝑒𝑗𝜔) (the DTFT of the non-truncated signal)
$$X(e^{j\omega} = \sum x[n]e^{-j\omega n} = \sum\frac{1}{2}(e^{j\frac{\pi}{4}n}+e^{-j\frac{\pi}{4}n}) = \pi(\delta(w-\frac{\pi}{4}) + \delta(w+\frac{\pi}{4}) )$$

Describe the difference between | 𝑋tr(𝑒𝑗𝜔)| and |𝑋(𝑒𝑗𝜔)| . What is the reason for this difference?
$$ \begin{aligned} X_{tr}(e^{j\omega})&=Ft{x[n]\times w[n]}\&=X(e^{j\omega})\circledast W(e^{j\omega})\&=(\pi\delta(\omega-\frac{\pi}{4})+\pi\delta(\omega+\frac{\pi}{4}))\circledast W(e^{j\omega})\&=\pi W(e^{j(\omega-\pi/4)})+\pi W(e^{j(\omega+\pi/4)}) \end{aligned} $$​ 
​
## 4.3.3

$$ B_{kn}=\frac{1}{N}e^{j2\pi(k-1)(n-1)/N} $$