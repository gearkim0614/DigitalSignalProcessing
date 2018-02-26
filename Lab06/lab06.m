%% 3.2 Aliasing a Sinusoidal-FM Signal
A = 2;
fc = 800;
alpha = 1000;
beta = 1.5;
gamma = 0;
fs = 4000;
tt = 0:(1/fs):2;

xx = A.*cos(2.*pi.*fc.*tt + alpha.*cos(2.*pi.*beta.*tt + gamma));
soundsc(xx,fs);
plotspec(xx + 1i*10^-10, fs, 128);

%% 3.3 Synthesizing a Test Image
xpix = ones(256,1)*cos(2*pi*(0:255)/32);
show_img(xpix);

%% 3.4 Aliasing in a Test Image
wd1 = 2*pi*1/32; 
xpix1 = ones(256,1)*cos(wd1*(0:255));

wd4 = 2*pi*4/32; 
xpix4 = ones(256,1)*cos(wd4*(0:255));
subplot(2,2,1);
imshow(xpix4);
title('xpix4');

wd12 = 2*pi*12/32; 
xpix12 = ones(256,1)*cos(wd12*(0:255));
subplot(2,2,2);
imshow(xpix12);
title('xpix12');

% Down - samp by 2
subplot(2,2,3);
imshow(xpix4(1:2:end,1:2:end));
title('xpix4-down');

subplot(2,2,4);
imshow(xpix12(1:2:end,1:2:end));
title('xpix12-down');


