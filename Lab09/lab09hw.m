% Designing an FIR filter via optimization with firpm

%% 
fs = 10000;
f = [0.6*fs/2, 0.64*fs/2];
a = [1, 0];
dev = [0.05, 0.01];
[n, fo, ao, w] = firpmord(f, a, dev, fs);
b = firpm(n+1, fo, ao, w);
%% 
figure;
stem(b);
%% 
ww = -pi:pi/100:pi;
H = freqz(b, 1, ww);
figure;
plot(ww, abs(H));
%% 
slope = -(length(b)-1)/2;
disp(slope);