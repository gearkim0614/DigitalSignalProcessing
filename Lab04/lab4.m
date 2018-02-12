%%
%3.2 Adding Short Sinusoid to a Long Signal Vector
amps = [1, 1]
freqs = [1200,750]
phases = [0, 0]
fs = 4000;
tStart = [0.6, 0.2];
durs = [0.5,1.6];
%tEnd = [1.1,1.8];
maxTime = max(tStart+durs) + 0.1; %-- Add time to show signal ending
durLengthEstimate = ceil(maxTime*fs);
tt = (0:durLengthEstimate)*(1/fs); %-- be conservative (add one)
xx = 0*tt; %--make a vector of zeros to hold the total signal
for kk = 1:length(amps)
    nStart = round(tStart(kk)*fs)+1; %-- add one to avoid zero index
    xNew = shortSinus(amps(kk), freqs(kk), phases(kk), fs, durs(kk));
    Lnew = length(xNew);
    nStop = nStart+Lnew-1; %<========= Add code
    xx(nStart:nStop) = xx(nStart:nStop) + xNew;
end
plotspec(xx,fs,256); grid on

%%
%3.3 Spectrogram: Section Length and Negative Frequency
% -- Type these in command window --
% spectrogram(xx,1024,[ ],[ ],fs,'yaxis'); colorbar
% tt=0:1/fs:0.5; yy=xx+cos(1600*pi*tt); plotspec(yy,fs,1024); colorbar
% -- This is negative frequency --
plotspec(xx+j*1e-9,fs,1024); colorbar
% -- This is different section length --
% plotspec(xx+j*1e-9,fs,128); colorbar
%%
% 3.4 Function for a Chirp
fsamp = 8000; %-Number of time samples per second
dt = 1/fsamp;
dur = 1.1;
tt = 0 : dt : dur;
f1 = 400;
psi = 2*pi*(100 + f1*tt + 500*tt.*tt);
%xx = real( 7.7*exp(j*psi) );


% This is test code
myLFMsig.f1 = 200;
myLFMsig.t1 = 0; 
myLFMsig.t2 = 1.5;
myLFMsig.slope = 1800;
myLFMsig.complexAmp = 10*exp(j*0.3*pi);
dt = 1/8000; % 8000 samples per sec is the sample rate
outLFMsig = makeLFMvals(myLFMsig,dt);
%- Plot the values in outLFMsig
%- Make a spectrogram for outLFMsig to see the linear frequency change
spectrogram(outLFMsig.values,1024,[ ],[ ],fs,'yaxis'); colorbar
soundsc(outLFMsig.values, fsamp );


