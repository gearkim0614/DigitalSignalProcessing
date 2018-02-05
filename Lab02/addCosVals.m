% ss(1).freq = 21; ss(1).complexAmp = exp(j*pi/4);
% ss(2).freq = 15; ss(2).complexAmp = 2i;
% ss(3).freq = 9; ss(3).complexAmp = -4;

function sigOut = addCosVals( cosIn, dur, tstart, dt )
% ADDCOSVALS Synthesize a signal from sum of sinusoids

freqlist = [cosIn(:).freq];
fmax = max(freqlist);
dt = 1/(fmax*32);
tt=tstart:dt:(tstart+dur);

sigOut.values = zeros(1,length(tt));
for x = 1:length(cosIn)
    sigOut.values = sigOut.values + real(cosIn(x).complexAmp.*exp(2i.*pi.*freqlist(x).*tt));
end

sigOut.times = tt;
plot(sigOut.times,sigOut.values);
end
