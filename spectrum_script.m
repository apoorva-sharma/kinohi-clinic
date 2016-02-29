% 2/28 calibration
lambda_d = 632;
slope = 0.325; %(26nm/80pixels)
row = 348;

fringe = imread('img/28feb_sodium2.png');

[lambda,spectrum] = extractspectrum(fringe,row,slope,lambda_d);
