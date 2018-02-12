% function specgram(xx,512,fs)
fs=8000; 
tt=0:1/fs:0.5; 
xx = cos(4000*pi*tt); 
spectrogram(xx,1024,[ ],[ ],fs,'yaxis'); colorbar
%--or
% tt=0:1/fs:0.5; yy=xx+cos(1600*pi*tt); plotspec(yy,fs,1024); colorbar
% plotspec(yy+j*1e-9,fs,1024); colorbar
% plotspec(yy+j*1e-9,fs,128); colorbar