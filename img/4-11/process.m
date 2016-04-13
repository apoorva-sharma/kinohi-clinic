direc = 'Acetal';
filenames = dir(strcat(direc,'\*.png'));
nimg = length(filenames);

finalfft = zeros(1,2048);

for imgname=filenames'
    img = imread(strcat(direc,'\',imgname.name));
    ffts = fft(img,size(img,2),2);
    absffts = abs(ffts);
    fftsum = sum(absffts,1);
    finalfft = finalfft + fftsum;
end


