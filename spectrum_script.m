% 2/28 calibration
lambda_d = 632;
slope = 0.325; %(26nm/80pixels)
row = 348;

fringe = imread('img/28feb_658laserpointer2.png');

figure(1)
[lambda,spectrum] = extractspectrum(fringe,row,slope,lambda_d);



fringe = imread('img/28feb_632.png');

figure(2)
[lambda,spectrum] = extractspectrum(fringe,row,slope,lambda_d);



% 2/28 calibration
lambda_d = 632;
slope = 0.325; %(26nm/80pixels)
row = 465;

fringe = imread('img/2-25 SHS Testing/25feb_sodiumvapor.png');

figure(3)
[lambda,spectrum] = extractspectrum(fringe,row,slope,lambda_d);

