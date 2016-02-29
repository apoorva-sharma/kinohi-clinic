img = imread('img/2-25 SHS Testing/25feb_sodiumvapor.png');
img = im2double(img);

figure(1)
image(img, 'CDataMapping','scaled');

F = fft2(img);

figure(2)
imagesc(100*log(1+abs(fftshift(F)))); colormap(gray); 


Fscaled = abs(fftshift(F));

spectrum = Fscaled(465,:);

figure(3)
% plot(spectrum);
% semilogx(spectrum);

% slope is 26 nm/65 pixels = 0.4
pixel = (0:1279) - 640;
nm = 632+0.4*pixel;

plot(nm,spectrum)
xlabel('wavelength (nm)')
ylabel('log(intensity)')
title('Spectrum')