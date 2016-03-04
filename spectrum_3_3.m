% 2/28 calibration
lambda_d = 632;
slope = 26/156;
row = 1001;

fringe = imread('img/3-3/NoSample1.png');

figure(1)
[lambda,spectrum_0] = extractspectrum(fringe,row,slope,lambda_d);



fringe = imread('img/3-3/Styro1.png');
[lambda,spectrum_1] = extractspectrum(fringe,row,slope,lambda_d);

fringe = imread('img/3-3/Styro2.png');
[lambda,spectrum_2] = extractspectrum(fringe,row,slope,lambda_d);

fringe = imread('img/3-3/Styro3.png');
[lambda,spectrum_3] = extractspectrum(fringe,row,slope,lambda_d);

spectrum = (spectrum_1 + spectrum_2 + spectrum_3)./3;
spectrum = spectrum - spectrum_0;
plot(lambda, spectrum);