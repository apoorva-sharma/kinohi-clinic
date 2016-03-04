% 3/2 calibration
lambda_d = 632;
slope = 26/156;
row = 1045;

fringe = imread('img/3-2/HeNe_RedLaser1.png');

figure(1)
[lambda,spectrum] = extractspectrum(fringe,row,slope,lambda_d);
title('HeNe + RedLaser')


fringe = imread('img/3-2/Hydrogren1.png');

figure(2)
[lambda,spectrum] = extractspectrum(fringe,row,slope,lambda_d);
title('Hydrogen')


fringe = imread('img/3-2/Sodium1.png');

figure(3)
[lambda,spectrum] = extractspectrum(fringe,row,slope,lambda_d);
title('Sodium Vapor')


fringe = imread('img/3-2/Neon1.png');

figure(4)
[lambda,spectrum] = extractspectrum(fringe,row,slope,lambda_d);
title('Neon')
