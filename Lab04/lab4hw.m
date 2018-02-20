%% 4.1
%3.2 Adding Short Sinusoid to a Long Signal Vector
% amps = [1, 1]
% freqs = [1200,750]
% phases = [0, 0]
fs = 4000;
dt = 1/fs;
dur=2.5;
inc=0.25;
samples = fs*dur;
xx = zeros(1,samples+1);
key1 = [0,3,7]; %ACE
key1dur = 0.2;
key2 = [12,7,3,0]; %AECA

for x = 1:length(key1)
    f = 440*2^(key1(x)/12);
    myStart = (x-1)*inc*fs+1;
    myEnd = (x-key1dur)*inc*fs;
    xx(myStart:myEnd) = xx(myStart:myEnd) + cos(f*2*pi*(dt:dt:0.2));
end

for y = 1:length(key2)
    f = 440*2^(key2(y)/12);
    myStart = y*inc*fs+1+0.5*fs;
    myEnd = 2.4*fs;
    xx(myStart:myEnd) = xx(myStart:myEnd) + cos(f*2*pi*(dt:dt:(1.9-inc*y)));
end

% plotspec(xx,fs,256); grid on
spectrogram(xx,256,[],[],4000,'yaxis');

%% 4.2

sigLFMexp.Amp = 7.7;
sigLFMexp.fc = 395;
sigLFMexp.beta = 1.77;
sigLFMexp.gamma = 5;
sigLFMexp.t1 = 0;
sigLFMexp.t2 = 3.04;

fs = 4000;
dt = 1/4000;

makeLFMhw(sigLFMexp,dt);
