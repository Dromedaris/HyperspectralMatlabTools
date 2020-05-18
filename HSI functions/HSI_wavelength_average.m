function HSI_mean = HSI_wavelength_average(HSI)

[n1, n2, ~] = size (HSI);

HSI_mean = zeros(n1,n2);
for i  = 1:n1
    for j  = 1:n2
        spectrum = HSI(i,j,:);
        HSI_mean(i,j) = mean(spectrum);
    end
end
