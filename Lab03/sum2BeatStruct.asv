%3.1 (a)
function sigBeatSum = sum2BeatStruct(sigBeatIn)

sigBeatSum.f1 = sigBeatIn.fc + sigBeatIn.fDelt; %-- frequencies in Equation (4)
sigBeatSum.f2 = sigBeatIn.fc - sigBeatIn.fDelt; %--
sigBeatSum.X1 = (sigBeatIn.Amp./2) * exp((sigBeatIn.phiDelt + sigBeatIn.phic).*(j));%-- complex amps for sinusoids in Equation (4)
sigBeatSum.X2 = (sigBeatIn.Amp./2) * exp((sigBeatIn.phiDelt - sigBeatIn.phic).*(j));%--

%--- Assume the five basic fields are present, plus the starting and ending times
%--- Add the four fields for the parameters in Equation (4)
sigBeatSum.f1, sigBeatSum.f2, sigBeatSum.X1, sigBeatSum.X2

end
