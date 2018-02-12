function xs = shortSinus(amp, freq, pha, fs, dur)
% amp = 0;
% freq = frequency in cycle per second
% pha = phase, time offset for the first peak
% fs = number of sample values per second
% dur = duration in sec
% shortSinus(0, 1200, 0, 4000, dur)
tt = 0 : 1/fs : dur; % time indices for all the values
xs = amp * cos( freq*2*pi*tt + pha );
end
