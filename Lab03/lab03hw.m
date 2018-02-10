%4.1 Beat Note Spectrogram
%%
sigBeat.Amp = 50; %-- B in Equation (3)
sigBeat.fc = 30; %-- center frequency in Eq. (3)
sigBeat.phic = pi./4; %-- phase of 2nd sinusoid in Eq. (3)
sigBeat.fDelt = 800; %-- modulating frequency in Eq. (3)
sigBeat.phiDelt = 0; %-- phase of 1st sinusoid Eq.~(\ref{Labeq:beatSigSum})
sigBeat.t1 = 0; %-- starting time
sigBeat.t2 = 4.04; %-- ending time
%
sigBeat.values = 1000;%-- vector of signal values
sigBeat.times = 1000;%-- vector of corresponding times
testingBeat = sum2BeatStruct(sigBeat);
% 
fs=8000;
tt=sigBeat.t1:1/fs:sigBeat.t2;
%
testingBeat.values = ((sigBeat.Amp/2)*cos(2*pi*testingBeat.f1*tt + (sigBeat.phiDelt+sigBeat.phic))) + ...
    (sigBeat.Amp/2)*(cos(2*pi*testingBeat.f2*tt + (sigBeat.phic-sigBeat.phiDelt)));
%
plotspec(testingBeat.values+j*1e-12,fs,512); grid on, shg
title('Lab 03 HW - Beat Note Spectrogram.');
xlabel('Time');
ylabel('Freq');

% 4.2 Touch-Tone Dial Function
%% 

