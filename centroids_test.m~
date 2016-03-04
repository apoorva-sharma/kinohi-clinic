fringe = imread('img/3-2/HeNe_RedLaser3.png');

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

%Find the centroid closest to this centroid
[Max2, I_max2] = max(centroids2(:,2));
row632 = centroids2(I_max2,2);

figure(1)
imshow(F_bw1)
hold on
plot(centroids1(:,1),centroids1(:,2), 'b*')
hold off

figure(2)
imshow(F_bw2)
hold on
plot(centroids2(:,1),centroids2(:,2), 'bo')
hold off
