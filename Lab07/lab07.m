load('echart.mat');

m = 65; %65/147/221 choose one

bdiffh = [1, -1];
xx = echart(m, :);
yy = conv(xx, bdiffh);

nn = 1:length(xx);
subplot(2,1,1);
stem(nn-1,xx(nn));
subplot(2,1,2);
stem(nn-1,yy(nn), 'filled');
xlabel('Time Index (n)');
find(yy)