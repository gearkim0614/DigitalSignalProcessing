%% 4.1 Sampling a Photographic Image and Observe Aliasing
lighthouse = imread('lighthouse.png');
lighthouse_downsized = lighthouse(1:2:end, 1:2:end, :);

show_img(lighthouse);
trusize; % This will be 428 x 642
show_img(lighthouse_downsized);
trusize; % This will be 214 x 321

%% 4.2 Observing Aliasing on an my Image
myPicture = imread('myGrayscale.jpg');
myPicture_downsized = myPicture(1:3:end, 1:3:end, :);

show_img(myPicture);
trusize; % This will be 428 x 642
show_img(myPicture_downsized);
trusize; % This will be 214 x 321
