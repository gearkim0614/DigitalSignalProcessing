function [ phoneNumber ] = decodeDTMF( yout, fs, R )
%decodeDTMF  Find biggest avg power
%  and make that a row or column index
%  Then compress repeated characters
%  Look for at least 3-in-a row for valid detect.
%
% NOTE: columns of yout correspond to increasing DTMF freqs

TTkeys = ['1','2','3','A';
'4','5','6','B';
'7','8','9','C';
'*','0','#','D'];

thresh = 20/3;  %- 20:1 ratio of biggest to avg of other 3 channels
[Yrow,Irow]=sort(yout(:,1:4),2);
rowMask = Yrow(:,4)>thresh*(Yrow(:,1:3)*[1;1;1]);
[Ycol,Icol]=sort(yout(:,5:8),2);
colMask = Ycol(:,4)>thresh*(Ycol(:,1:3)*[1;1;1]);
rowDet = Irow(:,4).*rowMask;
colDet = Icol(:,4).*colMask;

Lyout = size(yout,1);
TTout = [];
for k6=1:length(rowDet)
    if rowDet(k6)==0 | colDet(k6)==0
        TTout(k6) = 'Z';
    else
        TTout(k6) = TTkeys(rowDet(k6),colDet(k6));
    end
end
TTchar = char(TTout);

tttt = TTout;
jkl3inArow = find(tttt(1:end-2)==tttt(2:end-1) & tttt(2:end-1)==tttt(3:end));
tttt=tttt(jkl3inArow);
% char(tttt);
jkl3compress = find(tttt(1:end-3)==tttt(2:end-2) & tttt(2:end-2)==tttt(3:end-1) & tttt(3:end-1)==tttt(4:end));
tttt(jkl3compress) = [];
%char(tttt);
jklOne = find(tttt(1:end-1)==tttt(2:end));
tttt(jklOne) = [];
%char(tttt);
phoneNumber = char(tttt(2:2:end));



