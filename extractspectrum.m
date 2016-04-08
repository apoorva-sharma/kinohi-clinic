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
Fscaled = log(1+abs(F));

spectrum = Fscaled(row,:);%+Fscaled(row-1,:)+Fscaled(row+1,:);

pixel = (0:(width-1));
lambda = lambda_d + slope*pixel;
wavenumber = (1/lambda_d - 1./lambda)*1e7;

plot(wavenumber,spectrum)
xlabel('wavenumber (cm^{-1})')
ylabel('intensity')
title('Spectrum')

end

