%% 3.4 Dual Tone Signals
% For the DTMF synthesis each key-press generates a signal that is the sum of two sinusoids. For example,
% when the key 3 is pressed, the two frequencies are 697 Hz and 1477 Hz, so the generated signal is the sum
% of two sinusoids which could be created in MATLAB via

Ts = 0.3e-3; %- Sampling period = 3 msec
fsamp = 1/Ts; %- Sampling rate
tt = 0:1/fsamp:0.3;
%freq3a=697; freq3b=1477;
freq8a=852; freq8b=1336;

%DTMFsig = cos(2*pi*freq3a*tt+rand(1)) + cos(2*pi*freq3b*tt+rand(1)); %- Use random phases
DTMFsig = cos(2*pi*freq8a*tt+rand(1)) + cos(2*pi*freq8b*tt+rand(1)); %- Use random phases

xx = zeros(1,round(2/Ts)); %- pre-allocate vector t8o hold DTMF signals
n1 = round(0.6/Ts); n2 = n1+length(DTMFsig)-1;
xx(n1:n2) = xx(n1:n2) + DTMFsig;
soundsc(xx,fsamp); %- Optional: Listen to a single DTMF signal
plotspec(xx,fsamp);
txx=0:Ts:2;
% plot(txx,xx);
grid on %- View its spectrogram