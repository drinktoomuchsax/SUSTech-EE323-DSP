%% 7.8 Filter Design Using the Kaiser Window
clear;
close all;
% Time indices
n = 0:20;
% Generate Kaiser windows for different beta values
kaiserWindow1 = kaiser(21, 0);
kaiserWindow2 = kaiser(21, 1);
kaiserWindow3 = kaiser(21, 5);

% Compute the DTFTs for each Kaiser window
[X1, w1] = DTFT(kaiserWindow1, 512);
[X2, w2] = DTFT(kaiserWindow2, 512);
[X3, w3] = DTFT(kaiserWindow3, 512);

% Plot the Kaiser windows and their DTFTs
figure(1);
sgtitle('Kaiser Windows and their DTFTs by曹正阳');
subplot(3, 2, 1);
stem(n, kaiserWindow1, 'o-');
xlabel('n(s)');
title('Kaiser window for \beta = 0');
ylim([0 1.1]);

subplot(3, 2, 2);
plot(w1, 20*log10(abs(X1)));
xlabel('w(rad)');
title('Magnitude of DTFT for \beta = 0');
ylim([-60 30]);

subplot(3, 2, 3);
stem(n, kaiserWindow2, 'o-');
xlabel('n(s)');
title('Kaiser window for \beta = 1');
ylim([0 1.1]);

subplot(3, 2, 4);
plot(w2, 20*log10(abs(X2)));
xlabel('w(rad)');
title('Magnitude of DTFT for \beta = 1');
ylim([-60 30]);

subplot(3, 2, 5);
stem(n, kaiserWindow3, 'o-');
xlabel('n(s)');
title('Kaiser window for \beta = 5');
ylim([0 1.1]);

subplot(3, 2, 6);
plot(w3, 20*log10(abs(X3)));
xlabel('w(rad)');
title('Magnitude of DTFT for \beta = 5');
ylim([-60 30]);


% Design a filter using a Kaiser window
figure(2);
load nspeech2;
omega_p = 1.8;
omega_c = 2.0;
omega_s = 2.2;
delta_p = 0.05;
delta_s = 0.005;
kaiserBeta = 4.0909;
filterOrder = 51;
kaiserWindow = kaiser(filterOrder, kaiserBeta);
filterImpulseResponse = LPFtrunc(filterOrder, 2);
filteredFilter = filterImpulseResponse .* kaiserWindow';
[H, omega] = DTFT(filteredFilter, 512);

% Plot the magnitude response of the filter
sgtitle('Magnitude Response of Filter Designed with Kaiser Window by 曹正阳');

% Plot 1: Entire frequency response
subplot(3, 1, 1);
plot(omega, abs(H));
title('Entire Frequency Response');
xlabel('Frequency (\omega)');
ylabel('Magnitude');
xlim([-pi, pi]);
ylim([-0.1, 1.1]);

% Plot 2: Zoom in on passband ripple
subplot(3, 1, 2);
plot(omega, abs(H));
title('Zoom In on Passband Ripple');
xlabel('Frequency (\omega)');
ylabel('Magnitude');
xlim([-pi, pi]);
ylim([-0.1, 1.1]);
axis([omega_p-0.2, omega_p+0.2, 1-delta_p, 1+delta_p]);
% Plot 3: Zoom in on stopband ripple
subplot(3, 1, 3);
plot(omega, abs(H));
title('Zoom In on Stopband Ripple');
xlabel('Frequency (\omega)');
ylabel('Magnitude');
xlim([-pi, pi]);
ylim([-0.1, 1.1]);
axis([omega_s-0.2, omega_s+0.2, 0, delta_s]);


% Apply the filter to the noisy speech signal
filteredSpeech = conv(filteredFilter, nspeech2);
[filteredDTFT, filteredOmega] = DTFT(filteredSpeech(10001:10400), 1024);

% Plot the magnitude response of the filtered signal
figure(3);
plot(filteredOmega, 20*log10(abs(filteredDTFT)));
title('Magnitude of Filtered nspeech2(10001:10400) in dB');
xlim([-3.5 3.5]);

% Save all figures as PNG
saveas(figure(1), 'kaiser_windows_and_dtfts.png');
saveas(figure(2), 'magnitude_response_kaiser_filter.png');
saveas(figure(3), 'magnitude_response_filtered_signal.png');

% Play the sounds
sound(nspeech2, 8e3);
pause(length(nspeech2)/8e3);  % Pause to listen to the original sound
sound(filteredSpeech, 8e3);

%% 8.4 FIR Filter Design Using Parks-McClellan Algorithm

% 𝜔𝑝 = 1.8, 𝜔𝑐 = 2.0, 𝜔𝑠 = 2.2, 𝛿𝑝 = 0.05, 𝛿𝑠 = 0.005
% Given design specifications
wp = 1.8;      % Passband frequency
ws = 2.2;      % Stopband frequency
delta_p = 0.05; % Passband ripple
delta_s = 0.005;% Stopband ripple

% Compute approximate filter length using firpmord
[n, fo, mo, w] = firpmord([wp, ws], [1, 0], [delta_p, delta_s], 2*pi);

% Design the FIR filter using firpm
b = firpm(n, fo, mo, w);


% Compute DTFT of the filter's response
dtft_points = 512;
[H, w] = DTFT(b, dtft_points);

% Compute passband and stopband ripple
passband_ripple = max(abs(mo(1) - abs(H(w <= wp))));
stopband_ripple = max(abs(abs(H(w >= ws))));

% Display filter length and ripple values
disp(['Parks-McClellan Filter Length : ', num2str(n)]);
disp('Kaiser-window Filter Length (calculated) : 51');
disp(['Passband Ripple (0.05 expected): ', num2str(passband_ripple)]);
disp(['Stopband Ripple (0.005 expected): ', num2str(stopband_ripple)]);

% Plot the magnitude of the DTFT in dB
figure;
plot(w, 20*log10(abs(H)));
title('Parks-McClellan Filter DTFT Magnitude');
xlabel('Frequency (radians/sample)');
ylabel('Magnitude (dB)');
grid on;


% Load the noisy speech signal
load('nspeech2.mat');

% Filter the speech signal using the designed filter
filtered_signal = filter(b, 1, nspeech2);

% Compute DTFT of the filtered signal
filtered_dtft_points = 1024;
[Filtered_H, Filtered_w] = DTFT(filtered_signal(10001:10400), filtered_dtft_points);

% Plot the magnitude of the DTFT in dB for the filtered signal
figure;
plot(Filtered_w, 20*log10(abs(Filtered_H)));
title('Filtered Signal DTFT Magnitude');
xlabel('Frequency (radians/sample)');
ylabel('Magnitude (dB)');
grid on;

% Compare with the spectrum of the noisy speech signal and Kaiser filtered signal
% (use the spectrum from the previous Kaiser filter design)
% Add appropriate code here based on your previous work.

% Listen to the noisy and filtered speech signals
sound(nspeech2, 8e3);          % Play the noisy signal
pause(length(nspeech2) / 8e3); % Pause between signals
sound(filtered_signal, 8e3);               % Play the filtered signal
pause(length(filtered_signal)/8e3);  % Pause to listen to the original sound
sound(filteredSpeech, 8e3);

%% FUNCTIONS

function h = LPFtrunc(N, wc)
    % LPFtrunc: Compute the truncated and shifted impulse response of a lowpass filter
    % Check if N is even, if so, make it odd
    if mod(N, 2) == 0
        N = N + 1;
    end
    % Compute the truncated and shifted impulse response
    n = -(N-1)/2:(N-1)/2;
    h = wc/pi * sinc(wc * n / pi);
end

function [X,w] = DTFT(x,M)
% This function computes samples of the DTFT of x. 
% To compute the DTFT of x, use
%
%             [X,w] = DTFT(x,0)
%
% where X is the vector of DTFT samples and w is the 
% vector of radial frequencies. To compute at least
% M samples of the DTFT, you may use the command
%
%             [X,w] = DTFT(x,M)
%
% This is useful when the plot of X versus w does
% not contain a sufficient number of points.

N = max(M,length(x));
N = 2^(ceil(log(N)/log(2)));

% Take the padded fft
X = fft(x,N);
w = 2*pi*( (0:(N-1))/N );
w = w - 2*pi*(w>=pi);

% Shift FFT to go from -pi to pi
X = fftshift(X);
w = fftshift(w);

end
