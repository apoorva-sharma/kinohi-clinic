function [ row632, row658, slope ] = spectrum_calibration( fringe )
%This function takes in a fringe image with both 632 nm and 658 nm light
%and finds the calibration parameters: row where the 632 spectrum is
%and the row where the 658 spectrum is and the calibration slope

fringe1 = rgb2gray(fringe);
F = fft2(fringe1);
Fscaled = log(1+abs(fftshift(F)));

% Set a threshold to remove all points that are not the centroids and make
% it black and white
threshold1 = 0.76*max(Fscaled(:));
F_bw1 = Fscaled > threshold1;

% Calculate the centroids of F
s1 = regionprops(F_bw1,'centroid');
centroids1 = cat(1,s1.Centroid);

% Find the rightmost centroid (corresponds to 658 nm)
[Max,I_max] = max(centroids1(:,1));
row658 = centroids1(I_max,2);

% Redo the centroids with a higher threshold to eliminate the centroids on
% the outer region.
threshold2 = 0.8*max(Fscaled(:));
F_bw2 = Fscaled > threshold2;
s2 = regionprops(F_bw2,Fscaled,{'Centroid','WeightedCentroid'});
centroids2 = cat(1,s2.WeightedCentroid);

%Find the lowest centroid
[Max2, I_max2] = max(centroids2(:,2));
row632 = centroids2(I_max2,2);

%Find the slope
col658 = centroids1(I_max,1);
col632 = centroids2(I_max2,1);

pixels = abs(col658-col632);
slope = (658-632)/pixels;

