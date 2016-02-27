img = imread('25feb_632.png');
img = im2double(img);

figure(1)
image(img, 'CDataMapping','scaled');

F = fft2(img);

figure(2)
imagesc(100*log(1+abs(fftshift(F)))); colormap(gray); 


Fscaled = 100*log(1+abs(fftshift(F)));

spectrum = Fscaled(465,641:end);

figure(3)
% plot(spectrum);
% semilogx(spectrum);

% slope is 26 nm/65 pixels = 0.4
pixel = 0:639;
nm = 632+0.4*pixel;

plot(nm,spectrum)
xlabel('wavelength (nm)')
ylabel('log(intensity)')
title('Spectrum')