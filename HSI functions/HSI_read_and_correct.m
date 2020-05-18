function [HSI_corr, border] = HSI_read_and_correct(HSI_filename)

interpolationmethod = 'cubic';

[HSI, lambda, n1, n2, nb] = HSI_reader(HSI_filename);

if 1099 < min(lambda ) && max(lambda ) < 1671
    % SWIR
    reference_channel = 50;
    load('average_path_SWIR_cubic.mat')
    r = average_path;
    
elseif 468 < min(lambda ) && max(lambda) < 901
    %VNIR
    reference_channel = 75;
    load('average_path_VNIR_cubic.mat')
    r = average_path;
else
    msg = 'Error occurred. Wavelength is not belonging to either SWIR or VNIR';
    error(msg)
end

R = sqrt(r(1,:).^2+r(2,:).^2);
border = ceil(max(R))+1;

x = 1:n1;
y = 1:n2;

xq = border:(n1-border);
yq = border:(n2-border);

HSI_corr = zeros(length(xq),length(yq),nb);

[X,Y] = meshgrid(y,x);
[Xq,Yq] = meshgrid(yq,xq);

for i = 1:nb
    if i == reference_channel
        HSI_corr(:,:,i) = HSI(xq,yq,i);
    else
        Vi = HSI(x,y,i);
        ri = r(:,i);
        ri = ri; 
        HSI_corr(:,:,i) = interp2(X,Y,Vi,Xq+ri(1),Yq+ri(2),interpolationmethod); 
    end
end

end
