%% 5.2.1 Shifting the Frequency Range
N = 20;
x = hamming(N);
[X, k] = DFTsum(x);
figure;
plot(k, abs(X));
xlabel('Index k');
ylabel('|X_{20}[k]|');
title('Magnitude of 20-point DFT of Hamming window by 12110623-曹正阳');
grid on;
%
N = 20;
x = hamming(N);

[X_DTFT, w_DTFT] = DTFTsamples(x);

figure;
plot(w_DTFT, abs(X_DTFT));
xlabel('Frequency (rad/sample)');
ylabel('|X(\omega)|');
title('Magnitude of DTFT Samples of Hamming Window by 12110623-曹正阳');
grid on;


%% 5.2.2 Zero Padding
clear;
% Generate the finite-duration signal x[n] for N1 = 50
n1 = 0:49;
x_n1 = sin(0.1 * pi * n1);

% Compute DTFT samples for N1 = 50
[X_DTFT_50, w_DTFT_50] = DTFTsamples(x_n1);

% Generate the finite-duration signal x[n] for N2 = 200
n2 = 0:199;
n2(n2>=49) = 0; % explain that sin(0) = 0
x_n2 = sin(0.1 * pi * n2);

% Compute DTFT samples for N2 = 200
[X_DTFT_200, w_DTFT_200] = DTFTsamples(x_n2);

% Plot the magnitude of DTFT samples versus frequency for N1 = 50
figure;
subplot(2, 1, 1);
plot(w_DTFT_50, abs(X_DTFT_50), 'r');
xlabel('Frequency (rad/sample)');
ylabel('|X(\omega)|');
title('Magnitude of DTFT Samples (N = 50)');
grid on;

% Plot the magnitude of DTFT samples versus frequency for N2 = 200
subplot(2, 1, 2);
plot(w_DTFT_200, abs(X_DTFT_200), 'b');
xlabel('Frequency (rad/sample)');
ylabel('|X(\omega)|');
title('Magnitude of DTFT Samples (N = 200)');
grid on;

sgtitle('12110623-曹正阳');
%% 5.3.1 Implementation of Divide-and-Conquer DFT
N = 10;

% Signal 1: 𝑥[𝑛] = 𝛿[𝑛] for 𝑁 = 10
x1 = zeros(1, N);
x1(1) = 1;  % Impulse at n=0

% Signal 2: 𝑥[𝑛] = 1 for 𝑁 = 10
x2 = ones(1, N);

% Signal 3: 𝑥[𝑛] = 𝑒^(j2πn/N) for 𝑁 = 10
n = 0:N-1;
x3 = exp(1i * 2 * pi * n / N);

% Test dcDFT function
X1 = dcDFT(x1);
X2 = dcDFT(x2);
X3 = dcDFT(x3);

% Plot the results
figure;

subplot(3, 2, 1);
stem(n, x1, 'r');
title('Signal 1: $\delta[n]$ for $N = 10$', 'Interpreter', 'latex');

subplot(3, 2, 2);
stem(fftshift(abs(X1)), 'b');
title('DFT of Signal 1', 'Interpreter', 'latex');

subplot(3, 2, 3);
stem(n, x2, 'r');
title('Signal 2: $x[n] = 1$ for $N = 10$', 'Interpreter', 'latex');

subplot(3, 2, 4);
stem(fftshift(abs(X2)), 'b');
title('DFT of Signal 2', 'Interpreter', 'latex');

subplot(3, 2, 5);
stem(n, real(x3), 'r');
title('Signal 3: $x[n] = e^{(j2\pi n / N)}$ (Real part) for $N = 10$', 'Interpreter', 'latex');

subplot(3, 2, 6);
stem(fftshift(abs(X3)), 'b');
title('DFT of Signal 3', 'Interpreter', 'latex');

sgtitle('12110623-曹正阳');



%% FUNCTIONs

function [X, w] = DTFTsamples(x)
    N = length(x);
    [X_DFT, k] = DFTsum(x);
    w = (2 * pi / N) * k;
    w(w >= pi) = w(w >= pi) - 2 * pi;
    X = fftshift(X_DFT);
    w = fftshift(w);
end

function X = dcDFT(x)
    % Check if the length of x is even
    if mod(length(x), 2) ~= 0
        error('Input vector length must be even dude');
    end
    
    %j = sqrt(-1);
    %i == j %turns out that we can just use i
    x0 = x(1:2:end);  % Even
    x1 = x(2:2:end);  % Odd

    X0 = DFTsum(x0);
    X1 = DFTsum(x1);

    N = length(x);
    W_N = exp(-1i * 2 * pi / N * (0:N/2-1));

    X1 = X1 .* W_N;
    X = zeros(1, N);
    for k = 1:N/2
        X(k) = X0(k) + X1(k);
        X(k + N/2) = X0(k) - X1(k);
    end
end

