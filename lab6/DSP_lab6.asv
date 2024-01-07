%% 6.2.2 Poles and zeros of z-transform
% For right-sided sequences: ROC extends outward from the outermost pole to infinity.
% For left-sided: ROC inwards from the innermost pole to the original point.
% For two-sided: ROC either is a ring or do not exist
P1 = [-1 2 -3 6 -3 2 -1];
D1 = [1 zeros(1,6)];
P2 = [3 -2.4 15.36 3.84 9];
D2 = [5 -8.5 17.6 4.7 -6];
P3 = [2 0.2 6.4 4.6 2.4];
D3 = [5 1 6.6 4.2 24];

zeros1 = roots(P1);
poles1 = roots(D1);
display(zeros1);
display(poles1);
% right-sided

zeros2 = roots(P2);
poles2 = roots(D2);
display(zeros2);
display(poles2);
display(max(abs(poles2)));
display(min(abs(poles2)));
%all possible

zeros3 = roots(P3);
poles3 = roots(D3);
display(zeros3);
display(poles3);
display(max(abs(poles3)));
display(min(abs(poles3)));
%all possible

subplot(311),zplane(zeros1,poles1),title('H_1(z)');
subplot(312),zplane(zeros2,poles2),title('G_1(z)');
subplot(313),zplane(zeros3,poles3),title('G_2(z)');
%% 6.2.3 z-transform and frequency response
FreRes([1 2 0 2 1],1);
FreRes([1 0 -1],[1 -1.2 0.95]);

%% 6.2.4 Inverse z-transform
[r_1,p_1,k_1] = PartialFrac([-7.8 3],[-1.12 0.9 1]); % X = -2.47826/(1-0.7 z^-1) + 5.4783/(1+1.6 z^-1)
[r_2,p_2,k_2] = PartialFrac([1.28 1.8 3],[-0.2 -0.1 1]);% Y = 2.8889/(1+0.4z^-1) + 6.511/(1-0.5 z^-1) - 6.4

% first equation
zeros1 = roots(r_1(1));
poles1 = roots([1 p_1(1)]);
display(zeros1);
display(poles1);

zeros2 = roots(r_1(2));
poles2 = roots([1 p_2(2)]);
display(zeros2);
display(poles2);
display(max(abs(poles2)));
display(min(abs(poles2)));

subplot(211)
zplane(zeros1,poles1)
hold on
zplane(zeros2,poles2)
ylim([-1.2 1.2])
xlim([-1.2 1.2])

% second equation
zeros1 = roots(r_2(1));
poles1 = roots([1 p_2(1)]);
display(zeros1);
display(poles1);

zeros2 = roots(r_2(2));
poles2 = roots([1 p_2(2)]);
display(zeros2);
display(poles2);
display(max(abs(poles2)));
display(min(abs(poles2)));

subplot(212)
zplane(zeros1,poles1)
hold on
zplane(zeros2,poles2)
ylim([-1.2 1.2])
xlim([-1.2 1.2])

%% 6.2.5 Stability Conditions

poles1 = [0.943 0.902];
zeros1 = [0 0];
b1 = 1;
a1 = [1 -1.845 0.850586];

[h1,t1] = impz(b1,a1);

poles2 = [1 0.85];
zeros2 = [0 0];
b2 = 1;
a2 = [1 -1.85 0.85];

[h2,t2] = impz(b2,a2);

figure(1); % H1

subplot(121), zplane(zeros1',poles1');
subplot(122), stem(t1,h1), xlabel('t'), ylabel('h');

figure(2); % H2

subplot(121), zplane(zeros2',poles2');
subplot(122), stem(t2,h2), xlabel('t'), ylabel('h');

%% 6.3.1 Four Types of Linear Phase FIR Filters
clear;
h=[-0.0035,-0.0039,0.0072,0.0201,-0.0000,-0.0517,-0.0506,0.0855,0.2965,0.4008,0.2965,0.0855,-0.0506,-0.0517,-0.0000,0.0201,0.0072,-0.0039,-0.0035];
[mag,phase]=FreRes(h,1);
figure;
P=h;%Since h is symmetrical impulse response;
D=[1 zeros(1,18)];
zeros = roots(P);
poles = roots(D);
zplane(zeros,poles)
clear;
h=[3 -2 1 0 -1 2 -3];
[mag,phase]=FreRes(h,1);

%%
clear;
n=0:18;
h=[-0.0035,-0.0039,0.0072,0.0201,-0.0000,-0.0517,-0.0506,0.0855,0.2965,0.4008,0.2965,0.0855,-0.0506,-0.0517,-0.0000,0.0201,0.0072,-0.0039,-0.0035];
h1=h;
h1(2:2:19)=-h1(2:2:19);

h2=zeros(1,91);
h2(1:5:91)=h(1:1:19);

[mag1,phase1]=FreRes(h1,1);

[mag2,phase2]=FreRes(h2,1);

%% 6.3.2 Design of Simple FIR Filters

% Clear workspace and command window
clear;

% Generate frequency values
w = linspace(0, pi, 5000);

% Define the number of stages for the cascade filter
M = 3;

% Calculate the frequency response for the cascade filter
H_cascade = exp(-1i * 3 * w / 2) .* (cos(w / 2)).^3;

% Calculate the frequency response for the higher order moving average filter
H_moving_average = (1/M) * sin(M .* w / 2) ./ sin(w / 2) .* exp(-1j * (M-1) .* w / 2);

% Plot the frequency responses
plot(w, 20 * log10(abs(H_cascade)),'r');
hold on;
plot(w, 20 * log10(abs(H_moving_average)),'g');

% Plot the 3-dB cutoff line
plot(w, -3 * ones(1, 5000),'b');

% Set y-axis limits for better visualization
ylim([-100, 0]);

% Add labels and legend
xlabel('Frequency (\omega)');
ylabel('Gain (dB)');
legend('Cascade Filter', 'Higher Order Moving Average Filter', '3-dB Cutoff Line');
%% 6.4 IIR Filters

clear;

% Calculate filter coefficient
alpha_hpf = (1 - sqrt(1 - cos(0.2 * pi)^2)) / cos(0.2 * pi);

% Define frequency range
omega = linspace(0, pi, 5000);

% Define function handle for magnitude response
magnitude_response = @(omega) sqrt(((1 + alpha_hpf)^2 * (1 - cos(omega))) ./ (2 * (1 + alpha_hpf^2 - 2 * alpha_hpf * cos(omega))));

% Calculate magnitude response
H = magnitude_response(omega);

% Plot magnitude response and 3-dB cutoff line
plot(omega, 20 * log10(abs(H)));
hold on;
plot(omega, -3 * ones(1, 5000));

% Add labels and title
xlabel('Angular Frequency (rad/s)');
ylabel('Magnitude Response (dB)');
title('Simple Highpass IIR Filter');

% Add legend
legend('Simple Highpass IIR Filter', '3-dB Cutoff Line');



%% FUNCTIONs
function [mag, phase] = FreRes(num, den)
% https://ww2.mathworks.cn/matlabcentral/answers/90780-how-i-can-plot-the-magnitude-and-phase-response-oh-the-function
    % num and den are vectors specifying the coefficients of numerator and denominator.

    % Generate the powers of z for numerator and denominator
    nPowers = 0:-1:1-length(num); % Powers for numerator: z^0, z^(-1), z^(-2), ...
    dPowers = 0:-1:1-length(den); % Powers for denominator: z^0, z^(-1), z^(-2), ...

    % Symbolic variable for frequency
    syms w

    % Evaluate the numerator and denominator polynomials
    numerator = sum(num .* exp(1i * w).^nPowers);
    denominator = sum(den .* exp(1i * w).^dPowers);

    % Obtain the transfer function expression
    transferFunction = numerator / denominator;

    % Calculate magnitude and phase responses
    mag = abs(transferFunction);
    phase = angle(transferFunction);

    % Plot the magnitude response
    figure;
    subplot(1, 3, 1);
    fplot(w, abs(transferFunction), [-pi, pi]);
    xlabel('w (rad)');
    ylabel('Magnitude Response');
    title('Magnitude Response');

    % Plot the magnitude response in dB
    subplot(1, 3, 2);
    fplot(w, 20 * log10(abs(transferFunction)), [-pi, pi]);
    xlabel('w (rad)');
    ylabel('Magnitude Response (dB)');
    title('Magnitude Response (dB)');

    % Plot the phase response
    subplot(1, 3, 3);
    fplot(w, angle(transferFunction), [-pi, pi]);
    xlabel('w (rad)');
    ylabel('Phase Response');
    title('Phase Response');
end

function [rho,lambda,k] = PartialFrac(b,a)
% Inputs:
%   input b=[bm ... b1 b0] refers to coefficients of [z^(-m) ... z^(-1) z^0].
%   input a=[an ... a1 a0] refers to coefficients of [z^(-m) ... z^(-1) z^0].
% Difination:
%   b for numerator and a for denominator;
%   Partial fraction format: K(z) + sum(rho/(1-lambda*z^(-1)));
[r, p, k] = residue(b,a);
rho = -r./p;
lambda = 1./p;
end

