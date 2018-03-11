%% 4.2.1(a)
A = imread('HP110v3.png');
xn = A(50,:,:);

%% 4.2.1(b)
yn = conv(xn, [1, -1]);
subplot(2, 1, 1);stem(xn);
subplot(2, 1, 2);stem(yn);

%% 4.2.1(c)
dn = (abs(yn) > 50) .* yn;
ln = find(dn);

%% 4.2.1(d)
deltan = conv(ln, [1, -1]);
deltan = deltan(2:end-1);
figure;subplot(2, 1, 1);stem(ln);
subplot(2, 1, 2);stem(deltan);

%% 4.2.1(f)
for i = 3:length(deltan)-60
        total(i - 2) = sum(deltan(i:i+58));
end
theta1 = mean(total ./ 95);

%% 4.2.1(g)
rdeltan = round(deltan ./ theta1);

%% 4.2.1(h)
out = [];
for i = 1:length(rdeltan)-59
    t = decodeUPC(rdeltan(i:i+58));
    if isempty(find(t == -1, 1))
        out = t;
    end
end