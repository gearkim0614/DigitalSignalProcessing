%% Lab 2 Homework by Kibeom Kim

%% 1. State what happens to the approximation.
% As you increase the sum of the sinusoids, the waves flatten out resulting
% in a "square" wave.

%% 2. Generate the plot below with sum of 10 sinusoids.

close all
clear all

num_sinusoid = [10];
f0 = 1; %fundamental freq = 1 Hz
for jj = 1:length(num_sinusoid)
    clear cosAdd
    
    for kk = 1:num_sinusoid(jj) %calculate the freq and amp of each harmonic
        cosAdd(kk).freq = kk*f0;
        cosAdd(kk).complexAmp = (((1-(-1)^kk)/(pi*kk))*exp(j/2*pi));
    end
    
    cosAdd(kk).freq = 0
    cosAdd(kk).complexAmp = 0.5
    
    dur = 3;
    dt = 0;
    tstart = 0;
    a(jj) = addCosVals(cosAdd, dur, tstart, dt);

    plot(a(jj).times, (a(jj).values));
    title(sprintf('Sum of %d sinusoids',num_sinusoid(jj)));
end

