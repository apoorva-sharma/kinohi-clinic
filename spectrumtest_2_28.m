img = imread('img/28feb_632.png');
img = im2double(img);

figure(1)
image(img, 'CDataMapping','scaled');

F = fft2(img);

figure(2)
imagesc(100*log(1+abs(fftshift(F)))); colormap(gray); 


Fscaled = abs(fftshift(F));

spectrum = Fscaled(348,:);

figure(3)
plot(spectrum);
semilogx(spectrum);

% slope is 26 nm/80 pixels = 0.325
pixel = (0:1279) - 640;
nm = 632+0.325*pixel;

plot(nm,spectrum)
xlabel('wavelength (nm)')
ylabel('Intensity')
title('Spectrum')