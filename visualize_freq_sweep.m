lambda_d = 785e-9;
phi = 0.1*pi/180;
meters_per_pixel = 1.984375e-5; %(1in covers 1280 pixels)

lambda = linspace(lambda_d,lambda_d+30e-9,50);


for l=lambda
    [xi, rho] = to_xi_rho(l, lambda_d, phi, meters_per_pixel);
    F = xirho2fft(xi,rho);
    pause(0.01);
end