% Recording, saving, and playing the file.

recorder = audiorecorder;
disp('Recording started.');
recordblocking(recorder, 5);
disp('Recording finished');
y = getaudiodata(recorder);
save('myRecording.wav', 'y');
soundsc(y, 8000);

% Plot it (paste in command)

plot (y)
plotspecDB(y, 8000, 512, 80);