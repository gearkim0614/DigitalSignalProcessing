%% 3.2
ts = 0.3/1000;
fs = 1/ts;

xx = DTMFdial('159D*286A', fs);
figure; %1
plotspec(xx, fs, 512);
%%
f2 = [697, 763, 776, 852];
a2 = [0, 1, 0];
dev2 = [0.01, 0.02, 0.01];
[n2, fo2, ao2, w2] = firpmord(f2, a2, dev2, fs);
bb2 = firpm(n2-11, fo2, ao2, w2);

ww2 = 0:pi/1000:pi;
H2 = freqz(bb2, 1, ww2);
figure; %2
plot(ww2, abs(H2));
%%
yy2 = firfilt(bb2, xx);
figure; %3
plotspec(yy2, fs, 512);
%%
f8 = [1477 1633];
a8 = [0, 1];
dev8 = [0.01, 0.02];
[n8, fo8, ao8, w8] = firpmord(f8, a8, dev8, fs);
bb8 = firpm(n8+6, fo8, ao8, w8);

ww8 = 0:pi/1000:pi;
H8 = freqz(bb8, 1, ww8);
figure; %4
plot(ww8, abs(H8));
%%
yy8 = firfilt(bb8, xx);
figure; %5
plotspec(yy8, fs, 512);

%% 3.4
bb = hamming(99);
figure;
ww = -pi:(pi/100):pi;
H = freqz(bb, 1, ww);
subplot(2,1,1);
plot(ww, abs(H)), grid on;
title('Magnitude Response');
subplot(2,1,2);
plot(ww, angle(H)), grid on;
xlabel('Normalized Radian Frequency');
title('Phase Response');