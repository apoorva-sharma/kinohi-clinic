function [ lambda, spectrum ] = extractspectrum(fringe, row, slope,lambda_d )
%Extractspectrum draws the spectrum based the a fringe image
%   fringe = fringe image
%   row = the row on the fft where the peak values occur
%   slope = the calibration slope (nanometers/pixel)
%   lambda_d = design frequency, frequency where the fringes are completely
%   horizontal

F = fft2(fringe);
Fscaled = abs(fftshift(F));

spectrum = Fscaled(row,:);

pixel = (0:1279) - 640;
lambda = lambda_d + slope*pixel;

plot(lambda,spectrum)
xlabel('wavelength (nm)')
ylabel('log(intensity)')
title('Spectrum')

end

