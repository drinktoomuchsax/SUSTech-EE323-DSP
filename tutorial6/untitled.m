b = [993 002 991 1];
a = [1 996 992 993];
freqz(b, a, 1024);

%%

W = -pi:(2*pi)/8192:pi;
d3 = rand(1)*10^6;
d2 = rand(1)*10^6;
d1 = rand(1)*10^6;
[H,W] = freqz([d3 d2 d1 1],[1 d1 d2 d3],W);
plot(W,abs(H));