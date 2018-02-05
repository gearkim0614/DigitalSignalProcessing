%% 2.1 Interactive Input in MATLAB
% 
% a = input('What do you want to reverse: ','s');
% aflip = flip(a)

%% 2.2 Generating Sinusoids and Decaying Sinusoids
%variables
A = 10;
b = 0.8;
freq = 40;
omega = freq / ((2*pi));
phi = pi / 4;
fs = 8000;
tStart = 0;
tEnd = 2;

%formula
tt = tStart : 1/fs : tEnd; %time indices for all the values
xs = A*exp(-b*tt).*cos(omega*tt + phi);

%new B
b_inc = 3;
xe = A*exp(-b_inc*tt).*cos(omega*tt + phi);

%plot it
plot(tt,xs, 'b-', tt,xe, 'r--'), grid on
title('TEST PLOT of Decaying sinusoid')
xlabel('Time (sec)')
ylabel('Amplitude')
legend('Decay of b=0.8','Decay of b=3')


%% 2.3 Reading WAV file into MATLAB and Playing an Array
clear,clc
xx= audioread('threevotes.wav');

%xx is the length, divide by fs to get smple rate in sample/sec
length(xx);
t = linspace(0.25,0.5,length(xx));
plot(t,xx)
title('Sound wave of .wav file')
xlabel('Time (sec)')
ylabel('Amplitude')
legend('threevotes.wav')

%% 2.4 Processing the Data and Writing the Result into a wav file 
clear,clc
[xx,fs] = audioread('threevotes.wav');

xx_reverse = xx(length(xx):-1:1);

t = linspace(0.25,0.5,length(xx));
plot(t,xx_reverse)

audiowrite('threevotesReversed.wav', xx_reverse, fs);

%% 2.5 Recording and Playing sounds in MATLAB (for HW)
clear,clc

recObj = audiorecorder(8000, 16, 1);
% an object here is like a device or channel
% fs = 8000; use 8000 values for each second of sound
% nbit = 16; use 2 bytes to represent a value
% nchannel = 1; use 2 for stereo recording...
% (need stereo microphone)
% you may try other numbers

disp('Start speaking for 5 seconds.')
recordblocking(recObj, 5);
disp('End of recording');

% Play back the recording.
play(recObj);

% Store data in double-precision array.
myRecording = getaudiodata(recObj);

% Plot the samples.
plot(myRecording);
xlim([20000 20400])

% I can write the recording into .wav if I wish using:
% audiowrite command like (2.4)







