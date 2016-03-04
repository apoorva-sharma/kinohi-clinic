lambda_d = 785e-9;
phi = 0.1*pi/180;
meters_per_pixel = 1.984375e-5; %(1in covers 1280 pixels)

lambda = linspace(lambda_d,lambda_d+30e-9,50);

centroids_x1_all = zeros(size(lambda));
centroids_x2_all = zeros(size(lambda));

for i=1:length(lambda)
    l = lambda(i);
    [xi, rho] = to_xi_rho(l, lambda_d, phi, meters_per_pixel);
    F = xirho2fft(xi,rho);
    % Change the array 'F' back to normal scaling
    Fscaled = 100*log(1+abs(fftshift(F)));
   
    % Set a threshold to remove all points that are not the centroids and
    % turn it into a black and white image.
    threshold = 0.7*max(Fscaled(:));
    F_bw = Fscaled > threshold;

    % Calculate the centroids of F
    s = regionprops(F_bw,'centroid');
    centroids = cat(1,s.Centroid);
    centroids_x1 = centroids(1,1);
    centroids_x2 = centroids(2,1);
    centroids_x1_all(i) = centroids_x1;
    centroids_x2_all(i) = centroids_x2;
    
end

%Fit curves a line for the two sets of data. The row vectors are transposed 
%into column vectors. Type f1 to get the coefficients for the curve fit.

f1 = fit(lambda.',centroids_x1_all.','poly1');
% f1(x) = p1*x + p2
%      Coefficients (with 95% confidence bounds):
%        p1 =  -1.884e+10  (-1.889e+10, -1.879e+10)
%        p2 =   1.543e+04  (1.538e+04, 1.547e+04) 

f2 = fit(lambda.',centroids_x2_all.','poly1');
%      f2(x) = p1*x + p2
%      Coefficients (with 95% confidence bounds):
%        p1 =   1.884e+10  (1.879e+10, 1.889e+10)
%        p2 =  -1.415e+04  (-1.419e+04, -1.41e+04)



% plot(f1,lambda.',centroids_x1_all.');

% This allows you to see the black and white image with the centroids
% superimposed
imshow(F_bw)
hold on
plot(centroids(:,1),centroids(:,2), 'b*')
hold off