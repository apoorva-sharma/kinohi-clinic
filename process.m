% Kunal Menda
% Feb 14 2016
% This code uses ImageData.mat. It takes the FFT2 of each of
% the images taken from the 785 nm diode at different temperatures. 
% All images and their FFTs are plotted. 

%%
close all

% Make the figure
hf = figure(2);
set(hf,'PaperUnits','Points');
set(hf,'PaperPosition',[650,550,350*2.5,300*7]);

subplot(6,2,1);
img = T25_02;
imagesc(img) % Plots just the image
title 'T=25.02C'
subplot(6,2,2);
F = fft2(img); % Take FFT
imagesc(100*log(1+abs(fftshift(F)))); colormap(gray); % Plot magnitude of FFT. 
 %See http://stackoverflow.com/questions/13549186/how-to-plot-a-2d-fft-in-matlab
title('magnitude spectrum');

subplot(6,2,3);
img = T30_02;
imagesc(img)
title 'T=30.02C'
subplot(6,2,4);
F = fft2(img);
imagesc(100*log(1+abs(fftshift(F)))); colormap(gray); 
title('magnitude spectrum');

subplot(6,2,5);
img = T34_96;
imagesc(img)
title 'T=34.96C'
subplot(6,2,6);
F = fft2(img);
imagesc(100*log(1+abs(fftshift(F)))); colormap(gray); 
title('magnitude spectrum');

subplot(6,2,7);
img = T44_99;
imagesc(img)
title 'T=44.99C'
subplot(6,2,8);
F = fft2(img);
imagesc(100*log(1+abs(fftshift(F)))); colormap(gray); 
title('magnitude spectrum');

subplot(6,2,9);
img = T60_01;
imagesc(img)
title 'T=60.01C'
subplot(6,2,10);
F = fft2(img);
% F = fftshift(F);
imagesc(100*log(1+abs(fftshift(F)))); colormap(gray); 
title('magnitude spectrum');

subplot(6,2,11);
img = T60_01_Rot;
imagesc(img)
title 'T=60.01C Rot'
subplot(6,2,12);
F = fft2(img);
imagesc(100*log(1+abs(fftshift(F)))); colormap(gray); 
title('magnitude spectrum');

print -dpng -r300 'TempFFT_WithRot.png'

%%

% This code averages the 5 different images of different temperatures,
% and takes the FFT, just to show that FFT is linear. (You can see the 
% 5 peaks). This is a useful image to try to make the software with.

hf = figure(2);
set(hf,'PaperUnits','Points');
set(hf,'PaperPosition',[650,550,350,300*2.5]);

subplot(2,1,1);
img = T25_02/5 + T30_02/5 + T34_96/5 + T44_99/5 + T60_01/5;
imagesc(img)
title 'All Added'
subplot(2,1,2);
F = fft2(img);
imagesc(100*log(1+abs(fftshift(F)))); colormap(gray); 
title('magnitude spectrum');

figure()
[xx,yy] = meshgrid(1:1280,1:960);
surf(xx,yy,100*log(1+abs(fftshift(F))));
