function r = HSI_pathfinder(HSI, reference_channel, interpolationmethod, limit)

% This function calculates the deviations of each wavelength channel, with
% respect to a certain channel ()
% Idealy an image is give with a black an white image, which is black/white
% int the whole spectrum
%
% Input
%     HSI_filename -- name of the file (without extention) e.g. 'meteorite_corrected'
%     when the files meteorite_corrected.raw and meteorite_corrected.hdr
%     are represented.
%
%     reference_channel -- channel against which there will be optimized.
%     It is best to choose a noisefree central channel.
%
%     interpolationmethod -- cubic or linear interpixel interpolation.
%
%     limit -- estimation of the maximum total deviation (e.g. 5 pixels)
%     with respect tot the reference_chanel.
% Output
%     correction vector r (2xnb) with respect to the reference channel.



[n1, n2, nb] = size(HSI);

HSI(:,end,:) = []; % avoid square matrix for testing

[n1, n2, nb] = size(HSI);

x1 = 1:n1;
x2 = 1:n2;

lim = ceil(limit)+1;

x1q = lim:(n1-lim);
x2q = lim:(n2-lim);

r = zeros(2,nb);

[X1q,X2q] = meshgrid(x2q,x1q); % changed xq to yq
[X1,X2] = meshgrid(x2,x1);


Vq = HSI(x1q,x2q,reference_channel);

options = optimoptions('fmincon','Display','off');

for i = 1:nb
    if i == reference_channel
        ri = [0;0];
    else
        Vi = HSI(x1,x2,i);
%         'HSI'
%         [n1,n2]
%         'mesh big'
%         size(X1)
%         size(X2)
%         'Vi'
%         size(Vi)
%         'mesh small'
%         size(X1q)
%         size(X2q)
%         'Vq'
%         size(Vq)
        
        f = @(r) sum(sum((interp2(X1,X2,Vi,X1q+r(1),X2q+r(2),interpolationmethod)-Vq).^2));
        ri= fmincon(f,[0 0],[],[],[],[],[-limit,-limit],[limit,limit],[],options);
    end
    r(:,i) = ri;
end


end
