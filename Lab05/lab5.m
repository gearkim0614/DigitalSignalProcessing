%% 3.1 Chrisp Aliasing

f1 = 900;
f2 = 11400;
fs = 4000;
dt = 1/fs;
tStart = 0;
tStop = 5;
tt = tStart: dt: tStop;
xx = cos(2*pi*tt.*(900+1050*tt));

spectrogram(xx,256,[],[],fs,'yaxis');

%% 3.2 Periodic full-wave
tStop = 5;
fs = 1000;
Amp = 1; 
T = 1;
tt=0:(1/fs):tStop;
xx=Amp*abs(sin(2*pi*tt/T));

spectrogram(xx,2500,[],[],fs,'yaxis');
%plotspec(xx,fs,2500);
%plotspecDB(xx,fs,2500,80);


%% 3.4 Periodic full-wave
tStop = 5;
fs = 1000;
Amp = 1;
T = 2;
tt=0:(1/fs):tStop;
xx=Amp*abs(sin(2*pi*tt/T));

%spectrogram(xx,5000,[],[],fs,'yaxis');
%plotspec(xx,fs,5000);
plotspecDB(xx,fs,5000,80);

