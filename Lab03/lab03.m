%3.1 (b)
sigBeat.Amp = 10; %-- B in Equation (3)
sigBeat.fc = 590; %-- center frequency in Eq. (3)
sigBeat.phic = 0; %-- phase of 2nd sinusoid in Eq. (3)
sigBeat.fDelt = 20; %-- modulating frequency in Eq. (3)
sigBeat.phiDelt = -2*pi/3; %-- phase of 1st sinusoid Eq.~(\ref{Labeq:beatSigSum})
sigBeat.t1 = 1.1; %-- starting time
sigBeat.t2 = 5.2; %-- ending time

sigBeat.values = 1000;%-- vector of signal values
sigBeat.times = 1000;%-- vector of corresponding times
sigBeatSum = sum2BeatStruct(sigBeat)
% 
fs=8000;
tt=sigBeat.t1:1/fs:sigBeat.t2;

xx = ((sigBeat.Amp/2)*cos(2*pi*sigBeatSum.f1*tt + (sigBeat.phiDelt+sigBeat.phic))) + ...
    ((sigBeat.Amp/2)*cos(2*pi*sigBeatSum.f2*tt + (sigBeat.phiDelt-sigBeat.phic)));

spectrogram(xx,1024,[ ],[ ],fs,'yaxis'); colorbar

audiowrite('beatSound.wav',xx,fs);

%%
%3.2
[xx, tt] = key2sinus(49,2,0,8000,0.5);
plot(tt,xx)

%%
%3.3
close all
key=13;
silence=27;
fs=8000;
tt=0:1/fs:6.6;

%(key*0.4)+(silence*0.1); %1-6.6

xx = [];
z=0;
for n=1:silence
    if mod(n,2)== 0 %if even (sound note)
        z=z+1;
        cell=39+z;
        
        [xx{n},~] = key2sinus(cell,2,0,8000,0.4);
    else mod(n,2) == 1 %if odd (silent)
        z=z+1;
        cell=39+z;
        [xx{n},~] = key2sinus(cell,0,0,8000,0.1);
    end                  
end

xxx=[xx{:}];
tt = tt(1:length(xxx));
audiowrite('pianoSound.wav',xxx,fs);
plot(tt,xxx)

   