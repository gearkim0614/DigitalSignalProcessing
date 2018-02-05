%% 3.2 Vectorization
clear,clc
dt = 1/800; 
XX = rand(1,3).*exp(2i*pi*rand(1,3));
freq = 20; 
% ccsum= zeros(1,500);

%tt
tt = dt.* (1:500);
xx = [1:1:1];
tt = tt .* xx;

%ccsum
Ak = abs(XX)' * ones(1,500);
phik = angle(XX)' * ones(1,500);
ccsum = sum(Ak.*cos(2.*pi.*freq.*tt+phik));

plot(tt,ccsum) %-- Plot the sum sinusoid
grid on, zoom on, shg