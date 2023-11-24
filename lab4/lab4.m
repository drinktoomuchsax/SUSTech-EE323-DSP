%% 4.2.3 WINDOWS EFFECTS (1)

j=sqrt(-1);
w = -100*pi:pi:100*pi;
N = 100;
% W_ejw = exp(-0.5*j*w*(N-1))*(sin(0.5.*w*N)/sin(0.5.*w));
W_ejw = (1-exp(-j*w*N))./(1-exp(-j*w)); 
W_ejw(1,101) = N;
figure
subplot(211)
plot(w, abs(W_ejw)), title('Amplitude plot')
subplot(212)
plot(w, angle(W_ejw)), title('Phase plot')

%% 4.2.3 WINDOWS EFFECTS (2)
for i=1:2:10
    figure
    step = 1;
    n=-5*i:step:5*i;
    x = cos(pi*n*0.25);
    
    [X_tr,w] = DTFT(x,512);
    plot(w, abs(X_tr)), title('Amplitude plot')
end
%% 4.2.3 WINDOWS EFFECTS (2) REASON 1
for i=1:2:10
    figure
    step = 1;
    n=-5*i:step:5*i;
    [X_tr,w] = DTFT(n,512);
    plot(w, abs(X_tr)), title('Amplitude plot')
end
%https://www.physik.uzh.ch/local/teaching/SPI301/LV-2015-Help/lvanlsconcepts.chm/Windowing_Signals.html
%% 4.2.3 WINDOWS EFFECTS (2) REASON 2
for i=1:2:10
    figure
    step = 1;
    n=-5*i:step*i:5*i;
    [X_tr,w] = DTFT(n,512);
    plot(w, abs(X_tr)), title('Amplitude plot')
end
%https://www.physik.uzh.ch/local/teaching/SPI301/LV-2015-Help/lvanlsconcepts.chm/Windowing_Signals.html
%% 4.3.1 Computing the DFT
% Case 1: x[n] = delta[n] for N = 10
N = 10;
x1 = zeros(1, N);
x1(1) = 1;
X1 = DFTsum(x1);
figure;
subplot(2, 2, 1);
stem(abs(X1));
title('Magnitude of DFT for delta[n]');

% Case 2: x[n] = 1 for N = 10
x2 = ones(1, N);
X2 = DFTsum(x2);
subplot(2, 2, 2);
stem(abs(X2));
title('Magnitude of DFT for x[n] = 1');

% Case 3: x[n] = exp(j*2*pi*n/10) for N = 10
n = 0:N-1;
x3 = exp(1j * 2 * pi * n / 10);
X3 = DFTsum(x3);
subplot(2, 2, 3);
stem(abs(X3));
title('Magnitude of DFT for exp(j*2*pi*n/10)');

% Case 4: x[n] = cos(2*pi*n/10) for N = 10
x4 = cos(2 * pi * n / 10);
X4 = DFTsum(x4);
subplot(2, 2, 4);
stem(abs(X4));
title('Magnitude of DFT for cos(2*pi*n/10)');


% IDFT of all the signal above
figure
x_1 = IDFTsum(X1);
x_2 = IDFTsum(X2);
x_3 = IDFTsum(X3);
x_4 = IDFTsum(X4);
subplot(2,4,1)
stem(abs(x_1));
title('Magnitude of IDFT of DFT for delta[n]');
subplot(2,4,2)
stem(abs(x_2));
title('Magnitude of IDFT of DFT for x[n] = 1');
subplot(2,4,3)
stem(abs(x_3));
title('Magnitude of IDFT of DFT for exp(j*2*pi*n/10)');
subplot(2,4,4)
stem(abs(x_4));
title('Magnitude of IDFT of DFT for cos(2*pi*n/10)');
subplot(2,4,5)
stem(abs(x1));
title('Magnitude of delta[n]');
subplot(2,4,6)
stem(abs(x2));
title('Magnitude of x[n] = 1');
subplot(2,4,7)
stem(abs(x3));
title('Magnitude of exp(j*2*pi*n/10)');
subplot(2,4,8)
stem(abs(x4));
title('Magnitude of cos(2*pi*n/10)');


% 4.3.2 Matrix Representation of the DFT

A = DFTmatrix(5)

N = 10;
A = DFTmatrix(N);
figure

% Case 1: x[n] = delta[n] for N = 10
x1 = zeros(1, N).';
x1(1) = 1;
x1 = x1.';
X_1 = x1*A;
subplot(2, 3, 1);
stem(abs(X_1));
title('Magnitude of DFT for delta[n] using matrix representation');
subplot(2, 3, 4);
stem(abs(X1));
title('Magnitude of DFT for delta[n]');


% Case 2: x[n] = 1 for N = 10
x2 = ones(1, N).';
X_2 = A*x2;
subplot(2, 3, 2);
stem(abs(X_2));
title('Magnitude of DFT for x[n] = 1 using matrix representation');
subplot(2, 3, 5);
stem(abs(X2));
title('Magnitude of DFT for x[n] = 1');

% Case 3: x[n] = exp(j*2*pi*n/10) for N = 10
n = 0:N-1;
n = n.';
x3 = exp(1j * 2 * pi * n / 10);
X_3 = A*x3;
subplot(2, 3, 3);
stem(abs(X_3));
title('Magnitude of DFT for exp(j*2*pi*n/10) using matrix representation');
subplot(2, 3, 6);
stem(abs(X3));
title('Magnitude of DFT for exp(j*2*pi*n/10)');

%% 4.3.2 IDFTmatrix
B = IDFTmatrix(5)

C = IDFTmatrix(5)*DFTmatrix(5)

%% time compare
clear;
n=0:511;
x=cos(2*pi*n);
A=DFTmatrix(512);
% DFTsum     t1
start1=cputime;
X=DFTsum(x);
end1=cputime;
t1=end1-start1
x=x';
% DFTmatrix     t2
start2=cputime;
X=A*x;
end2=cputime;
t2=end2-start2

%% functions

function [X,k] = DFTsum(x)
N = length(x);
j=sqrt(-1);
X = zeros(size(1:N));

for k=1:N
    for n=1:N
        X(1,k) = X(1,k) + x(1,n)*exp(-j*2*pi*k*(n-1) / N);
    end
end
end

function [x,k]=IDFTsum(X)
N = length(X);
j=sqrt(-1);

x = zeros(1,N);
for n =1:N
    for k = 1:N
        x(1,n) = x(1,n) + (1/N)*X(1,k)*exp(j*2*pi*k*(n-1)/N);
    end
end
end

function A = DFTmatrix(N)
j=sqrt(-1);
A=zeros(N,N);
    for k=1:N
        for n=1:N
            A(k,n)=exp(-j*2*pi*(k-1)*(n-1)/N);
        end
    end
end

function B = IDFTmatrix(N)
    A=DFTmatrix(N);
    B=(1/N)*A';
end