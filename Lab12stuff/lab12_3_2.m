%% Part a
fs = 8000;
f1 = 81;
f2 = 1031;
beta = 1.1;
tt = 0:1/fs:1.3;
bb1 = (beta + cos(2*pi*f1.*tt));
bb2 = cos(2*pi*f2.*tt);
bb = bb1.*bb2;
figure; plot(tt, bb);

% Part b
figure; plot(tt, abs(bb));
%%
% Part c
figure;
subplot(1, 3, 1); plotspec(bb, fs, 2048); title('b(t)');
subplot(1, 3, 2); plotspec(bb1, fs, 2048); title('b1(t)');
subplot(1, 3, 3); plotspec(abs(bb), fs, 2048); title('|b(t)|');

%% Part e
load('lpf.mat');
yy = filter(b, a, abs(bb));
figure; plot(tt, yy);