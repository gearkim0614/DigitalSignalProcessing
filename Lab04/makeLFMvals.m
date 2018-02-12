function sigOut = makeLFMvals( sigLFM, dt )


sigLFM.f1 = 200;%starting frequency (in Hz) at t = sigLFM.t1
sigLFM.t1 = 0;%starting time (in secs)
sigLFM.t2 = 1.5%;ending time
sigLFM.slope = 1800; %slope of the linear-FM (in Hz per sec)
sigLFM.complexAmp = 10*exp(j*0.3*pi);% expdefines the amplitude and phase of the FM signal
dt = 1/8000; %time increment for the time vector, typically 1/fs (sampling frequency)
% outLFMsig = makeLFMvals(myLFMsig,dt);
% sigOut.values = (vector of) samples of the chirp signal
% sigOut.times = vector of time instants from t=t1 to t=t2
%
if( nargin < 2 ) %-- Allow optional input argument for dt
dt = 1/8000; %-- 8000 samples/sec
end
%--------NOTE: use the slope to determine mu needed in psi(t)
%-------- use f1, t1 and the slope to determine f0 needed in psi(t)
dur = 1.5;
tt = sigLFM.t1 : dt : sigLFM.t2;
mu = sigLFM.slope ./ 2;
f0 = (sigLFM.f1) - (2*mu*sigLFM.t1);
psi = 2.*pi.*( f0.*tt + mu.*tt.*tt);
xx = real( 10 * exp(j*psi) );
sigOut.times = tt;
sigOut.values = xx;