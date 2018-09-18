clear
%% 1
bb = 8.1*poly( -0.9^(-1)*exp(j*2*pi*[1,-1]/3) );
aa = poly( -0.9*exp(j*2*pi*[1,-1]/3) );
H = freqz(bb, aa, 2*pi*[-1:0.05:1]);
magnitude = abs(H);
% [((1-r^(-1)*exp(j*(pi/3))*z^(-1))*(1-r^(-1)*exp(-j*(pi/3))*z^(-1)]
% [((1-r*exp(j*(pi/3))*z^(-1))*(1-r*exp(-j*(pi/3))*z^(-1)]


%% 4
[ecgsig, fs, fint] = ECGmakeSig15('kkim703');
%yy = filter( [1, -1.6401, 0.81],[1, -1.8223, 1], ecgsig);
yy = filter( [1, -1.8223, 1],[1, -1.6401, 0.81], ecgsig);
n = 1:11250;
figure;
subplot(1, 2, 1); 
plot(n,ecgsig);
subplot(1, 2, 2); 
plot(n,yy);
figure;
plotspec(ecgsig, fs, 512);
figure 
plotspec(yy, fs, 512);
%(0.9*cos(2*pi*(750/50.7))),(0.9*sin(2*pi*(750/50.7)))
%(cos(2*pi*(750/50.7))),(sin(2*pi*(750/50.7)))