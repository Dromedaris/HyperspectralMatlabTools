function r = HSI_COM(frame,spectral_band)
r = [0;0];
[n1, n2] = size(frame);

load('endmembers_blackandwhite2.mat')

B = black_swir(spectral_band);
W = white_swir(spectral_band);

f_lambda = @(y) (W-y)/(W-B);

som_norm_factor = 0;
som_x_1 = 0;
som_x_2 = 0;

for i = 1:n1
    for j = 1:n2
        pixelvalue = frame(i,j);
        f = f_lambda(pixelvalue);
        
        som_norm_factor = som_norm_factor + f;
        som_x_1 = som_x_1 + i*f;
        som_x_2 = som_x_2 + j*f;

    end
end


r(1) = som_x_1/som_norm_factor;
r(2) = som_x_2/som_norm_factor;



end