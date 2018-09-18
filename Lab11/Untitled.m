clear
[ecgsig, fs, fint] = ECGmakeSig15('kkim703');
yy = filter( [1, -0.47933, 0.81],[1, -0.53259, 1], ecgsig);
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