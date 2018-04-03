function xx = DTMFdial(keyNames,fs)
   %DTMFDIAL  Create a signal vector of tones that will dial
   %           a DTMF (Touch Tone) telephone system.
   %
   % usage:  xx = DTMFdial(keyNames,fs)
   %  keyNames = vector of CHARACTERS containing valid key names
   %        fs = sampling frequency (1/Ts)
   %   xx = signal vector that is the concatenation of DTMF tones.
   %
   TTkeys =  ['1','2','3','A';
               '4','5','6','B';
               '7','8','9','C';
               '*','0','#','D'];
   TTcolTones = [1209,1336,1477,1633];  %-- in Hz
   TTrowTones = [697,770,852,941];
   numKeys = length(keyNames);
   durDualTone = 180/1000;  %-- in seconds
   LenDualTone = durDualTone * fs;
   durSilence = 48/1000;
   LenSilence = durSilence * fs;
   xx = zeros(1,numKeys * (LenDualTone + LenSilence));  %- initialize xx to be long enough to hold the entire output
   n1 = 1;
   for kk=1:numKeys
      [jrow,jcol] = find(TTkeys == keyNames(kk));  %- which key?
      %... more code to make the dual-tone signals
      %... precede each dual-tone signal with a short interval of silence
      tt = 0:1/fs:durDualTone;
      DTMFsig = cos(2*pi*TTcolTones(jcol)*tt+rand(1)) + cos(2*pi*TTrowTones(jrow)*tt+rand(1));
      xx((1:length(tt))+(kk-1)*(LenDualTone+LenSilence)) = DTMFsig;
   end
end