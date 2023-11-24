% 12110623 曹正阳
%lba1 for digital signal processing

%1.3.1
lab1p3p1_1 = @(t) sin(5*t).^2;
lab1p3p1_1 = integral(lab1p3p1_1,0,2*pi);
lab1p3p1_2 = @(t) exp(t);
lab1p3p1_2 = integral(lab1p3p1_2,0,1);
%1.3.2
n=0:2:60;
y=sin(n/6);
f=figure('Name','#1.3.2 12110623曹正阳');
subplot(3,1,1)
stem(n,y)

n1=0:2:60;
z=sin(n1/6);
subplot(3,1,2)
plot(n1,z)
n2=0:10:60;
w=sin(n2/6);
subplot(3,1,3)
plot(n2,w)

%1.3.3

fun1 = @(t) sin(5*t)^2;
fun2 = @(t) exp(t);

I = [];
N = [];
for resolution = 1:100
    %I is the integral of fun1, N is ***** of fun2
    I(end+1)=integ1(fun1,resolution,0,2*pi);
    N(end+1)=integ1(fun1,resolution,0,1);
    n=1:100;
end

g=figure('Name','# 1.3.3 12110623曹正阳');
subplot(2,1,1)
plot(n,I)
xlabel('howManyRectangles')
ylabel('sin(5*t)^2')
subplot(2,1,2)
plot(n,N)
xlabel('howManyRectangles')
ylabel('exp(t)')

% as for the reason why I(5)=I(10)=0, i guess its due to the periodicity of
% sin func, 5 and 10 just meet the periodicity of sin(5t), so some the area
% of retangle just offset each other

%1.5 SPECIAL FUNC

g = figure("Name","#1.5.1 12110623曹正阳");
subplot(2,1,1)
t1=-10*pi:0.2:10*pi;
plot(t1,sinc(t1))
xlabel('times')
ylabel('sinc(t)')

subplot(2,1,2)
t2=-2:1:2;
syms t
fplot(rectangularPulse(t), [-2,2])

g = figure("Name","#1.5.2_1 12110623曹正阳");
subplot(3,1,1)
n = -20:20;
for a=[0.8 1 1.5]
    fun = a.^n.*(heaviside(n)-heaviside(n-10));
    if a == 0.8
        subplot(3,1,1)
        stem(n,fun)
    elseif a ==  1
        subplot(3,1,2)
        stem(n,fun)
    elseif a == 1.5
        subplot(3,1,3)
        stem(n,fun)
    end
end

g = figure("Name","#1.5.2_2 12110623曹正阳");
n = -20:20;
for a=[0.8 1 1.5]
    fun = cos(0.25*pi.*n).*a.^n.*heaviside(n);
    if a == 0.8
        subplot(3,1,1)
        stem(n,fun)
    elseif a ==  1
        subplot(3,1,2)
        stem(n,fun)
    elseif a == 1.5
        subplot(3,1,3)
        stem(n,fun)
    end
end

%1.6 SAMPLING
g = figure("Name","#1.6 12110623曹正阳");
for T_s=[0.1 1/3 0.5 10/9]
    if T_s == 0.1
        n = 0:100;
        fun = sin(2*pi.*n*T_s);
        subplot(4,1,1)
        axis([0,100,-1,1])
        stem(n,fun)
    elseif T_s == 1/3
        n = 0:30;
        fun = sin(2*pi.*n*T_s);
        subplot(4,1,2)
        axis([0,30,-1,1])
        stem(n,fun)
    elseif T_s == 0.5
        n = 0:20;
        fun = sin(2*pi.*n*T_s);
        subplot(4,1,3)
        axis([0,20,-1,1])
        stem(n,fun)
    elseif T_s == 10/9
        n = 0:9;
        fun = sin(2*pi.*n*T_s);
        subplot(4,1,4)
        axis([0,9,-1,1])
        stem(n,fun)
    end
end


%1.7 Raaaaaaaanndom signal
g = figure("Name","#1.7_sig 12110623曹正阳");
rng(666,'twister');
sig1 = randn(1,1000); %default mean is 0 and variance is 1
subplot(2,1,1)
plot(-500:499,sig1)
rng(996,'twister');
sig2 = randn(1,1000)+0.2; %mean:0.2 var:1 
subplot(2,1,2)
plot(-500:499,sig2)


g = figure("Name","#1.7_ave 12110623曹正阳");
n = 2:1000;
ave1 = [];
for i = n
    temSig = sig1(1:i);
    ave1(end+1) = mean(temSig);
end
ave2 = [];
for i = n
    temSig = sig2(1:i);
    ave2(end+1) = mean(temSig);
end
plot(n,ave1)
hold on
plot(n,ave2)
hold off
legend('ave1','ave2')
%its obviously that different noise got diff mean value


function integral=integ1(FUNCTION,resolution,START,END)
    integral = 0;
    intervalLength = (END-START)/resolution;
    for t = START:intervalLength:END
        integral = integral+FUNCTION(t)*intervalLength;
    end
end




