function [HSI, lambda, n1, n2, nb] = HSI_reader(filename)

% HSI_Reader 
% 
% Input
%     filename -- name of the file (without extention) e.g. 'meteorite_corrected'
%     when the files meteorite_corrected.raw and meteorite_corrected.hdr
%     are represented.
% 
% Output
%     HSI -- Hyperspectral image datacube as an [nx,ny,nb] array. Every
%     frame is nx times ny and has a nb bands for every pixel.
% 
%     lambda -- Array containing the wavelength in nanometer
    
[~,filename,~] = fileparts(filename) ;


fid = fopen(strcat(filename,'.hdr'));

tline = fgetl(fid);

while ischar(tline)
    tline = fgetl(fid);
    if strcmp(tline,'wavelength = {')
        wavelength = split(fgetl(fid),', ');
    end
    
    if length(tline) > 8 && strcmp(tline(1:7),'lines =')
        n1 = str2num(tline(9:end)); % or ny, who cares?
    end
    
    if length(tline) > 10 && strcmp(tline(1:9),'samples =')
        n2 = str2num(tline(11:end));
    end
    
end
fclose(fid);
[nb,~] = size(wavelength); %number of bands
lambda = zeros(nb,1);

for i = 1:nb
    lambda(i) = str2num(wavelength{i});
end


HSI = multibandread([filename '.raw'],[n1,n2,nb],'float',0,'bsq','ieee-le');

HSI_rot = ones(n2, n1, nb);

for i = 1:nb
    frame  = HSI(:,:,i);
    HSI_rot(:,:,i) = rot90(frame,-1);
end

HSI = HSI_restrict(HSI_rot,10,0); 
% this one sets negative values to 0 and values higher than 1.5 to 1.5
% (otherwise the scale is of the charts)

[n1,n2,nb] = size(HSI);

end
