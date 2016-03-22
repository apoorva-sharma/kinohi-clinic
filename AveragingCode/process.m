clear
close all
clc

%% Make the averaged Teflon image

filenames = dir('./Teflon_320/');

TeflonAvg = zeros(2048,2048);

numimages = length(filenames) - 2;

for i = 3:length(filenames)
    filename = ['./Teflon_320/',filenames(i).name];
    TeflonImg = imread(filename);
    TeflonImg = double(rgb2gray(TeflonImg));
    TeflonAvg = TeflonAvg + TeflonImg/numimages;
end


%% Make the averaged background image

filenames = dir('./Background_320/');

BackgndAvg = zeros(2048,2048);

numimages = length(filenames) - 2;

for i = 3:length(filenames)
    filename = ['./Background_320/',filenames(i).name];
    BackgndImg = imread(filename);
    BackgndImg = double(rgb2gray(BackgndImg));
    BackgndAvg = BackgndAvg + BackgndImg/numimages;
end

%%

TeflonFinal = TeflonAvg - BackgndAvg;
% Rescale to 0 to 255
TeflonFinal = TeflonFinal - min(min(TeflonFinal));
TeflonFinal = 255*TeflonFinal / max(max(TeflonFinal));
TeflonFinal = uint8(TeflonFinal);

%% Save as PNG

imwrite(TeflonAvg,'TeflonFinal.png');


    
    
    
    