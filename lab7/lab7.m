clear;
close all;

w = -pi:0.01:pi;
z = exp(1j * w);

H1 = 1 - 2 * cos(pi/6) * z.^(-1) + z.^(-2);
H2 = 1 - 2 * cos(pi/3) * z.^(-1) + z.^(-2);
H3 = 1 - 2 * cos(pi/2) * z.^(-1) + z.^(-2);
H4 = 1 - 2 * cos(2*pi/3) * z.^(-1) + z.^(-2);
H5 = 1 - 2 * cos(5*pi/6) * z.^(-1) + z.^(-2);
H6 = 1 - 2 * cos(pi) * z.^(-1) + z.^(-2);

figure;

subplot(2,3,1);
plot(w, abs(H1), 'LineWidth', 2);
title('\theta = \pi/6');
xlabel('\omega');
ylabel('|H(\omega)|');
grid on;
ylim([0 4.5]); % Set y-axis limits
xlim([-pi pi]); % Set x-axis limits

subplot(2,3,2);
plot(w, abs(H2), 'LineWidth', 2);
title('\theta = \pi/3');
xlabel('\omega');
ylabel('|H(\omega)|');
grid on;
ylim([0 4.5]); % Set y-axis limits
xlim([-pi pi]); % Set x-axis limits

subplot(2,3,3);
plot(w, abs(H3), 'LineWidth', 2);
title('\theta = \pi/2');
xlabel('\omega');
ylabel('|H(\omega)|');
grid on;
ylim([0 4.5]); % Set y-axis limits
xlim([-pi pi]); % Set x-axis limits

subplot(2,3,4);
plot(w, abs(H4), 'LineWidth', 2);
title('\theta = 2\pi/3');
xlabel('\omega');
ylabel('|H(\omega)|');
grid on;
ylim([0 4.5]); % Set y-axis limits
xlim([-pi pi]); % Set x-axis limits

subplot(2,3,5);
plot(w, abs(H5), 'LineWidth', 2);
title('\theta = 5\pi/6');
xlabel('\omega');
ylabel('|H(\omega)|');
grid on;
ylim([0 4.5]); % Set y-axis limits
xlim([-pi pi]); % Set x-axis limits

subplot(2,3,6);
plot(w, abs(H6), 'LineWidth', 2);
title('\theta = \pi');
xlabel('\omega');
ylabel('|H(\omega)|');
grid on;
ylim([0 4.5]); % Set y-axis limits
xlim([-pi pi]); % Set x-axis limits

sgtitle('Magnitude Response of the Filter for Different \theta Values by 曹正阳');

% Save the figure as a PNG file
saveas(gcf, '7.3_filter_magnitude_response.png');

%%

