%% 3.3 M-file to Generate One sinusoid

function sigOut = makeCosVals(sigIn, dur, tstart, dt)
freq = sigIn.freq;
X = sigIn.complexAmp;
%...(Fill in several lines of code)...
A = abs(X);
phi = angle(X);
tt = tstart:dt:(tstart+dur); %-- Create the vector of times
xx = A*cos(2*pi*freq*tt+phi); %-- Vectorize the cosine evaluation

sigOut.times = tt; %-- Put vector of times into the output structure
sigOut.values = xx; %-- Put values into the output structure
end


% function something()
% 
% mySig.freq = 2; %-- (in hertz)
% mySig.complexAmp = 5*exp(j*pi/4);
% dur = 2;
% start = -1;
% dt = 1/(32*mySig.freq);
% mySigWithVals = makeCosVals( mySig, dur, start, dt );
% %- Plot the values in sigWithVals
% 
% plot(makeCosVals.times,mySigWithVals.values);
% end
