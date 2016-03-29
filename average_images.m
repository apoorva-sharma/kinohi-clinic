function [  ] = average_images( sampledir, backgnddir, numimages, sigmas, outname )
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here


%% Make the averaged Sample image

sampledir = ['./',sampledir,'/'];
filenames = dir(sampledir);

SampleAvg = zeros(2048,2048);

numimages = max(1,numimages);
numimages = min(numimages,length(filenames) - 2);

for i = 3:3+numimages-1
    filename = [sampledir,filenames(i).name];
    SampleImg = imread(filename);
    SampleImg = double(rgb2gray(SampleImg));
    SampleAvg = SampleAvg + SampleImg/numimages;
end


%% Make the averaged background image
backgnddir = ['./',backgnddir,'/'];
filenames = dir(backgnddir);

BackgndAvg = zeros(2048,2048);

numimages = max(1,numimages);
numimages = min(numimages,length(filenames) - 2);

for i = 3:3+numimages-1
    filename = [backgnddir,filenames(i).name];
    BackgndImg = imread(filename);
    BackgndImg = double(rgb2gray(BackgndImg));
    BackgndAvg = BackgndAvg + BackgndImg/numimages;
end

%%

SampleFinal = SampleAvg - BackgndAvg;
% Rescale to 0 to 255
SampleFinal_Scaled = SampleFinal - min(min(SampleFinal));
SampleFinal_Scaled = (255 / max(max(SampleFinal_Scaled)))*SampleFinal_Scaled;

% Boost Contrast

SFMean = mean(reshape(SampleFinal,numel(SampleFinal),1));
SFStd = std(reshape(SampleFinal,numel(SampleFinal),1));
NotOutliers = ((SampleFinal < SFMean + sigmas*SFStd)...
    & (SampleFinal > SFMean - sigmas*SFStd));
SampleFinal_Trimmed = SampleFinal.*NotOutliers...
    + SFMean*(~NotOutliers);

SampleFinal_Trimmed_Scaled = SampleFinal_Trimmed - min(min(SampleFinal_Trimmed));
SampleFinal_Trimmed_Scaled = 255*SampleFinal_Trimmed_Scaled...
    / max(max(SampleFinal_Trimmed_Scaled));




%% Save as PNG



% imwrite(uint8(SampleAvg),'SampleAvg.png');
% imwrite(uint8(BackgndAvg),'BackgndAvg.png');
% imwrite(uint8(SampleFinal_Scaled),'SampleFinal_Scaled.png');
imwrite(uint8(SampleFinal_Trimmed_Scaled),outname);

display('done')

end

