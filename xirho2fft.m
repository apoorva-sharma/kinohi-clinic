function [F] = xirho2fft(xi,rho)

img_dim = [1280 960];

[x_mesh, y_mesh] = meshgrid(0:img_dim(1)-1, 0:img_dim(2)-1);

xi_x = xi*cos(rho);
xi_y = xi*sin(rho);

img = cos(2*pi*(xi_x.*x_mesh + xi_y.*y_mesh));
figure(1)
image(img, 'CDataMapping','scaled');

F = fft2(img);

figure(2)
imagesc(100*log(1+abs(fftshift(F)))); colormap(gray); 

end