direc = 'try1';
filenames = dir(strcat(direc,'\*.png'));
nimg = length(filenames);

finalfft = zeros(1,2048);
for imgname=filenames'
    img = imread(strcat(direc,'\',imgname.name));
    imgff = flatfield(double(img));
    clear img;
    ffts = fft(imgff,size(imgff,2),2);
    absffts = abs(ffts);
    fftsum = sum(absffts,1);
    finalfft = finalfft + fftsum;
end
clear fftsum
clear ffts;
clear absffts;


