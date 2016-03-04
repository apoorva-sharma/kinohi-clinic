function [ lambda, spectrum ] = extractspectrum(fringe, row, slope,lambda_d )
%Extractspectrum draws the spectrum based the a fringe image
%   fringe = fringe image
%   row = the row on the fft where the peak values occur
%   slope = the calibration slope (nanometers/pixel)
%   lambda_d = design frequency, frequency where the fringes are completely
%   horizontal

% ensure image is grayscale
if size(fringe,3) == 3
    fringe = rgb2gray(fringe);
end

width = size(fringe,2);
height = size(fringe,1);

F = fft2(fringe);
Fscaled = log(1+abs(fftshift(F)));

spectrum = Fscaled(row,:);

pixel = (0:(width-1)) - width/2;
lambda = lambda_d + slope*pixel;

plot(lambda,spectrum)
xlabel('wavelength (nm)')
ylabel('intensity')
title('Spectrum')

end

