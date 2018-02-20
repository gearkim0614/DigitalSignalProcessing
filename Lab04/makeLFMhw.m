function makeLFMhw ( sigLFMexp, dt )
tt = sigLFMexp.t1 : dt: sigLFMexp.t2;
xx = sigLFMexp.Amp*cos(2*pi*(sigLFMexp.fc*tt+sigLFMexp.gamma/sigLFMexp.beta*exp(sigLFMexp.beta*tt)));

spectrogram(xx,256,[],[],1/dt,'yaxis');

end