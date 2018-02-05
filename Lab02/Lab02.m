% %% 3.2 Vectorization
% clear,clc
% dt = 1/800; 
% XX = rand(1,3).*exp(2i*pi*rand(1,3));
% freq = 20; 
% % ccsum= zeros(1,500);
% 
% %tt
% tt = dt.* (1:500);
% xx = [1:1:1];
% tt = tt .* xx;
% 
% %ccsum
% Ak = abs(XX)' * ones(1,500);
% phik = angle(XX)' * ones(1,500);
% ccsum = sum(Ak.*cos(2.*pi.*freq.*tt+phik));
% 
% plot(tt,ccsum) %-- Plot the sum sinusoid
% grid on, zoom on, shg

%% 3.3 M-file to Generate One sinusoid
% sigIn = 2;
% dur = 2;
% tstart = -1 ;
% dt = 1;

function sigOut = makeCosVals(sigIn, dur, tstart, dt)
freq = sigIn.freq;
X = sigIn.complexAmp;
%...(Fill in several lines of code)...
A = abs(X);
phi = angle(x);
tt = tstart:dt:(tstart+dur); %-- Create the vector of times
xx = A*cos(2*pi*freq*tt*phi); %-- Vectorize the cosine evaluation

sigOut.times = tt; %-- Put vector of times into the output structure
sigOut.values = xx; %-- Put values into the output structure
end

function something()
%% One
mySig.freq = 2; %-- (in hertz)
mySig.complexAmp = 5*exp(j*pi/4);
dur = 2;
start = -1;
dt = 1/(32*mySig.freq);
mySigWithVals = makeCosVals( mySig, dur, start, dt );
%- Plot the values in sigWithVals

plot(mySigWithVals.times,mySigWithVals.values);
end
