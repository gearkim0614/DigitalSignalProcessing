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
title('Title')
xlabel('Time in seconds')
ylabel('Amplitude')
xlim([20000 20400]);


% I can write the recording into .wav if I wish using:
% audiowrite command like (2.4)