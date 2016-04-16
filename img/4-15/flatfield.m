function [ out ] = flatfield( img )
%FLATFIELD Applies Flatfield Calibration
%   Takes uint16 image in doubles
%   Needs FlatFieldCalibration.mat in same folder

load FlatFieldCalibration.mat

out = (img - offset)./NaNSensitivity;
Mean = nanmean(nanmean(out));

for i = 1:2048
    for j = 1:2048
        if(isnan(out(i,j)))
            out(i,j) = Mean;
        end
    end
end
            


end

