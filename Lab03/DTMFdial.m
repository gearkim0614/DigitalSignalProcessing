
function xx = DTMFdial(keyNames,fs)
TTkeys = ['1','2','3','A'; '4','5','6','B'; '7','8','9','C'; '*','0','#','D'];
%
TTcolTones = [1209,1336,1477,1633]; %-- in Hz
%freq1 = TTcolTones(kk)
TTrowTones = [697,770,852,941];
%freq2 = TTrowTones(kk)
durDualTone = 180/1000; %-- in seconds
durSilence = 48/1000;
%
t = 0:1/fs:durDualTone;
tsit = zeros(1,durSilence*fs);

x=[];
for k=1:length(keyNames)
    [jrow,jcol] = find(keyNames(k)==TTkeys); %- which key?
    x = [x (cos(2*pi*TTrowTones(jrow).*(t)))+(cos(2*pi*TTcolTones(jcol).*(t)))];
    x = [x tsit];
end
% x=DTMFdial('268*073A',5000);
plotspec(x,fs,512);
grid on;
% tt=1/fs:1/fs:(0.18+0.048)*length(keyNames);
% tt = [tt 0 0 0 0 0 0 0 0];
% tt = [tt zeros(1,8)];
% plot(tt,x);
end


