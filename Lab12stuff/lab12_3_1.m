%% Part a
bb = [1, -1];
ww = -pi:pi/1000:pi;
H = freqz(bb, 1, ww);
figure; plot(ww, abs(H)); 
title('Pre-emphasis Frequency Response');

%% Part b
[xx, fs] = audioread('catsdogs.wav'); 
figure;
spectrogram(xx,512,'','',fs,'yaxis')
title('Before Pre-emphasis');
figure;
%conv
yy = conv(xx, bb);
spectrogram(yy,512,'','',fs,'yaxis')
title('After Pre-emphasis');

% plotspec(yy, fs, 256); 
