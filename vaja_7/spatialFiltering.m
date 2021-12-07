function oImage = spatialFiltering(iType, iImage, varargin)
%spatialFiltering filtrira slika z danim filtorm.
%vhodni elementi:
%   iType - tip filtra , ki je v množici ['kernel, 'statistical',
%       'morphological']
%   iImage - vhodna slika
%   varargin - potrebni ostali vhodni parametri 
%izhodni elementi:
%   oImage - izhodna slika

[N ,M] = size(varargin{1}); %velikost filtra
n= floor(N./2);
m= floor(M./2);

iImage  = changeSpatialDomain('enlarge', iImage,n,m,'period', 127);
[Y, X] = size(iImage); %velikost vhodne matrike

oImage = zeros(Y,X);

vhodni = varargin;
filter = vhodni{1};
for y = 1+n:Y-n
    for x = 1+m:X-m
        %domena slike, ki pripada filtru
        F = iImage(y-n:y+n, x-m:x+m);
        
        %filriranje z jedrom
        if strcmp(iType, 'kernel')
            oImage(y,x) = sum(sum(filter.*F));
            
        %statistično filtriranje
        elseif strcmp(iType, 'statistical')
            oImage(y,x) = feval(vhodni{2},F(:));
            
        %morfološko filtriranje
        elseif strcmp(iType, 'morphological')
            R = vhodni{1}.*F;
            R(vhodni{1}==0)= [];
            if strcmp(vhodni{2},'erosion')
                oImage(y, x) = min(R(:));
            elseif strcmp(vhodni{2},'dilation')
                oImage(y, x) = max(R(:));
            end
        end
    end
end
oImage  = changeSpatialDomain('reduce', oImage,n,m);

end
