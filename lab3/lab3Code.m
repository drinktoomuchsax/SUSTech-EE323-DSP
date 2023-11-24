% hello lab3
%% 3.1 BACKGROUND EXERCISES
%plot two period signal
figure("Name","3.5.1 12110623 曹正阳")
syms t
n=-10:10;
subplot(211)
fplot(rectangularPulse(t-(n*4+1)/2),[-5 5])
ylim([-0.1 1.3])
title("s( t ) = rect(t−1/2)")
subplot(212)
fplot((rectangularPulse(2*(t+n))-1/2),[-5 5])
ylim([-0.7 1])
title("s( t ) = rect(2t)−1/2")

%% 3.5 DT FREQUENCY ANALYSIS
% 3.5.1
figure("Name","3.5.1 12110623 曹正阳")

x=[0 0 0 0 1 0 0 0 0];
n=[-4 -3 -2 -1 0 1 2 3 4];
DW = 0.1;
dude = DTFT(x,1,DW);
l = -pi:DW:pi;
subplot(321)
plot(l,abs(dude))
subplot(322)
plot(l,angle(dude))

x=[0 0 0 0 0 0 1 0 0 0];
n=[-1 0 1 2 3 4 5 6 7 8 9 10];
DW = 0.01;
buddy = DTFT(x,7,DW);
l = -pi:DW:pi;
subplot(323)
plot(l,abs(buddy))
subplot(324)
plot(l,angle(buddy))

n=-20:20;
x=(0.5).^n.*heaviside(n);
DW = 0.01;
honey = DTFT(x,21,DW);
l = -pi:DW:pi;
subplot(325)
plot(l,abs(honey))
subplot(326)
plot(l,angle(honey))
% 
% figure("Name","3.5.1 12110623 曹正阳")
% w=-100:100;
% 
% bob = 1./(1-0.5*exp(-sqrt(-1)*w));
% plot(w,abs(bob))

function y=DTFT(x,n0,dw)
    w = -1*pi:dw:pi;
    i = sqrt(-1);
    
    y = 0;
    for n=n0:length(x)
        y = y + x(n)*exp(-i*w*(n+n0-1));
    end
end