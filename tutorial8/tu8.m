%%Q1 (b)
x=[1 1 4 3 2];
y=[x x x x];
n_x = 0:4;
n=0:19;
subplot(211)
stem(n_x,x,"LineWidth",2)
xlim([0 20])
ylim([0 5])
title("X[k]");
subplot(212)
stem(n,y,"LineWidth",2)
ylim([0 5])
title("Y[k]");

%% Q2
x = [2, -5, 6, -3, 4, -4, 0, -7,8];%9number
n=-5-9*2:1:3+9*2;
y=[x x x x x]; %7 x
stem(n,y,"LineWidth",2)
ylim([-8 10])

%% Q4
g = [3, -5, 2, 6, -1, 4];
h = [-2, 4, 7, -5, 4, 3];
z = conv(g,h);
disp(z)

%% Q7
x = [2 1 2];
w = [-4 0 -3 2];

Y = 