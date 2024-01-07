% helloooooo lab2 for digital signal processing

%%
%2.3 EXAMPLE DISCRETE—TIME SYSTEMS

%generate signal
n=-10:20;
sig1 = 1*(n==0)-1*(n==-5);
sig2 = 1*(n>=0)-1*(n>=11);
%plot the sig
g=figure('Name','2.3 Example Discrete-Time Systems 12110623曹正阳');
subplot(2,3,1)
stem(n,sig1)
title("signal 1") 
subplot(2,3,2)
stem(n,differentiator(sig1))
title("differentiator on signal 1") 
subplot(2,3,3)
stem(n,integrator(sig1))
title("integrator on signal 1") 
subplot(2,3,4)
stem(n,sig2)
title("signal 2") 
subplot(2,3,5)
stem(n,differentiator(sig2))
title("differentiator on signal 2") 
subplot(2,3,6)
stem(n,integrator(sig2))
title("integrator on signal 2") 



%%
%2.4 DIFFERENCE EQUATIONS
n=-20:0.2:20;
dicra = n==0;
g=figure('Name','2.4 Difference Equations 12110623曹正阳');
subplot(321)
stem(n,dicra);
title("\delta[n]")
subplot(322)
stem(n,S_1(dicra));
title("impulse response of S_1")
subplot(323)
stem(n,S_2(dicra));
title("impulse response of S_2")
subplot(324)
stem(n,S_1(S_2(dicra)));
title("impulse response of S_1(S_2)")
subplot(325)
stem(n,S_2(S_1(dicra)));
title("impulse response of S_2(S_1)")
subplot(326)
stem(n,S_1(dicra)+S_2(dicra));
title("impulse response of S_1+S_2")



%%
%2.5 AUDIO FILTERING
audio_vector=audioread('music.au');
g=figure('Name','2.5 Aduio Filtering 12110623曹正阳');
subplot(311)
Y=fft(audio_vector);
plot(abs(Y))
ylim([-10 1000])
title("original signal")
%soundsc(audio_vector, 8000); %you can choose which one to play by deleting"%"

audio_vector=audioread('music.au');
y=S_1(audio_vector);
Y=fft(y);
subplot(312)
plot(abs(Y))
ylim([-10 1000])
title("signal through S1")
%soundsc(y);

audio_vector=audioread('music.au');
y=S_2(audio_vector);
subplot(313)
Y=fft(y);
plot(abs(Y))
ylim([-10 1000])
title("signal through S2")
%soundsc(y);

%%
%2.6 INVERSE SYSTEMS
g=figure('Name','2.6 Inevrs Systems 12110623曹正阳');
n=-2:0.05:2;
dicra = n==0;
subplot(211)
stem(n,S_3(dicra));
ylim([-1 1.5])
title("Impulse response of S3")
subplot(212)
stem(n,S_3(S_2(dicra)));
ylim([-1 1.5])
title("Impulse response of S3(S2)")

%%
%2.7 SYSTEM TEST

s1=[0 1 2 3 4 5 6 7 8 9 0 0 1 0 0 0];
s2=[0 0 0 1 2 3 4 5 6 7 8 9 0 0 1 0];
s3=[1 2 3 1 2 5 6 1 1 9 8 6 5 4 0 0];
%linearity test
g=figure('Name','2.7 System Test_linearity test 12110623曹正阳');
n=1:16;
subplot(231)
stem(n,bbox4(s1+s3))
title("bbox4( s1[n]+s3[n] )")
subplot(234)
stem(n,bbox4(s3)+bbox4(s1))
title("bbox4( s1[n])+bbox4(s3[n] )")
subplot(232)
stem(n,bbox5(s1+s3))
title("bbox5( s1[n]+s3[n] )")
subplot(235)
stem(n,bbox5(s3)+bbox5(s1))
title("bbox5( s1[n])+bbox5(s3[n] )")
subplot(233)
stem(n,bbox6(s1+s3))
ylim([0 500])
title("bbox6( s1[n]+s3[n] )")
subplot(236)
stem(n,bbox6(s3)+bbox6(s1))
ylim([0 500])
title("bbox6( s1[n])+bbox6(s3[n] )")

%time invariance test
g=figure('Name','2.7 System Test_time invariance test 12110623曹正阳');
n=1:16;
subplot(231)
stem(n,bbox4(s1))
title("bbox4(s1[n])")
subplot(234)
stem(n,bbox4(s2))
title("bbox4(s1[n-2])")
subplot(232)
stem(n,bbox5(s1))
title("bbox5(s1[n])")
subplot(235)
stem(n,bbox5(s2))
title("bbox5(s1[n-2])")
subplot(233)
stem(n,bbox6(s1))
title("bbox6(s1[n])")
subplot(236)
stem(n,bbox6(s2))
title("bbox6(s1[n-2])")

%%
%2.8 STOCK MARKET EXAMPLE
load stockrates.mat
g=figure('Name','2.8 Stock Market Example 12110623曹正阳');
subplot(311)
n=1:length(rate);
plot(n,rate)
ylim([0 53])
title("original")
subplot(312)
dude = filter1(rate,0);
plot(n,dude)
title("filter1")
ylim([0 53])
subplot(313)
dude = filter2(rate,0,0);
ylim([0 53])
plot(n,dude)
title("filter2")



%%
% below these two function is for "2.3 EXAMPLE DISCRETE—TIME SYSTEMS"
function y=differentiator(x)
   % y[n]=(x[n]-x[n-1])/1
   L=length(x);
   y=zeros(1,L);
   for n=2:L-2
      y(n)=x(n)-x(n-1);
   end
end

function y=integrator(x)
    % y[n]=0.5*(x[n]-x[n-1])+y[n-1]
    L=length(x);
    y=zeros(1,L+1);
    for n=2:L
        y(n)=0.5*(x(n)+x(n-1)) + y(n-1);
    end
    y=y(2:L+1);
end

%%
% below these two function is for "2.4 DIFFERENCE EQUATIONS"
function y=S_1(x)
   % y[n]=x[n]-x[n-1]
   L=length(x);
   y=zeros(1,L);
   for n=2:L-2
      y(n)=x(n)-x(n-1);
   end
end

function y=S_2(x)
    % y[n]=0.5*y[n-1]+x[n]
    L=length(x);
    y=zeros(1,L);
    for n=2:L
        y(n)=0.5*y(n-1)+x(n);
    end
end

%%
% below these two function is for "2.6 Inverse Systems"

function y=S_3(x)
    % y[n]=-0.5*x[n-1]+x[n]
    L=length(x);
    y=zeros(1,L);
    for n=2:L
        y(n)=-0.5*x(n-1)+x(n);
    end
end

%%
% below is for 2.8 Stock Market Example

function y=filter1(x,avgvalYester)
%avgvalue[today] = 0.8 * avgvalue[yesterday] + 0.2 * (value[today]) 
    L=length(x);
    y=zeros(1,L);
    for n=1:L
        if n==1
            y(n)=0.8*avgvalYester+0.2*x(n);
        else
            y(n)=0.8*y(n-1)+0.2*x(n);
        end
    end
end

function y=filter2(x,avgvalYester,valueBefore)
%avgvalue[today] = avgvalue[yesterday] + 1/3(value[today]−value[3 daysago]) 
    L=length(x);
    y=zeros(1,L);
    for n=1:L
        if n==1
            y(n)=avgvalYester+1/3*(x(n)-valueBefore);
        elseif n==2 || n==3 || n==4
            y(n)=y(n-1)+1/3*(x(n)-valueBefore);
        else
            y(n)=y(n-1)+1/3*(x(n)-x(n-3));
        end        
    end
end


