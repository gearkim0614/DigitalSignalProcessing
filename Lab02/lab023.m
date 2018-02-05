% ss(1).freq = 21; ss(1).complexAmp = exp(j*pi/4);
% ss(2).freq = 15; ss(2).complexAmp = 2i;
% ss(3).freq = 9; ss(3).complexAmp = -4;

function sigOut = addCosVals( cosIn, dur, tstart, dt )
% ADDCOSVALS Synthesize a signal from sum of sinusoids

freq = [cosIn(:).freq];
fmax = max(freqlist);
dt = 1/(fmax*32);
tstart:dt:(tstart+dur)

values = zero(1,length(tt));
for x = 1:length(cosIn)
    out.values = out.values + real(cosIn(x).complexAmp.*exp(2i.*pi.*freqlist(x).*tt));
end

out.times = tt;
plot(out.times,out.values);
end
