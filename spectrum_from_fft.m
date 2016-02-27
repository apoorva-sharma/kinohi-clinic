function [X] = spectrum_from_fft(F)

Fscaled = 100*log(1+abs(fftshift(F)));

% Find y position to sweep
threshold = 0.7*max(Fscaled(:));
F_bw = Fscaled > threshold;
s = regionprops(F_bw,'centroid');
centroids = cat(1,s.Centroid);

X = zeros(1,size(F,2));

yposes = [centroids(:,2)];
for i = 1:length(yposes)
    y_pos = round(yposes(i));
    X = X + abs(F(y_pos,:));
end

end