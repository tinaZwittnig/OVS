function [oP, oH, oV] = getPlanarProjection(iImage, iDim, iNormVec, iFunc)

oP = [];
oH = [];
oV = [];

[N_cor, N_sag, N_ax] = size(iImage);
 
%stranska projekcija
if isequal(iNormVec, [1 0 0])
    oP = zeros(N_ax,N_cor);
    oH = (1:N_cor).*iDim(2);
    oV = (1:N_ax).*iDim(3);
    for z=1:N_ax
        for y = 1:N_cor
            oP(z,y) = feval(iFunc, iImage(y,:,z));
        end
    end
    
%čelna projekcija    
elseif isequal(iNormVec, [0 1 0])
    oP = zeros(N_ax,N_sag);
    oH = (1:N_sag).*iDim(1);
    oV = (1:N_ax).*iDim(3);
    for z=1:N_ax
        for x = 1:N_sag
            oP(z,x) = feval(iFunc, iImage(:,x,z));
        end
    end
    
    %prečna projekcija
elseif isequal(iNormVec,[0 0 1])
    oP = zeros(N_cor,N_sag);
    oH = (1:N_sag).*iDim(1);
    oV = (1:N_cor).*iDim(2);
    for y=1:N_cor
        for x = 1:N_sag
            oP(y,x) = feval(iFunc, iImage(y,x,:));
        end
    end
%ravnina, ki je pravokotna na z-ravnino
elseif iNormVec(3) == 0
    xn = iNormVec(1);
    yn = iNormVec(2);
    %izračunamo kot glede na normo
    phi = atan(xn/yn);
    rotirana = zeros(N_cor, N_sag, N_ax);
     for x = 0:N_sag-1
         for y = 0:N_cor-1
             %rotacija in translacija indeksa
             x2 = round((x-N_sag/2) * cos(phi) - (y-N_cor/2) * sin(phi)+ N_sag/2);
             y2 = round((x-N_sag/2) * sin(phi) + (y -N_cor/2) * cos(phi) + N_cor/2);
             for z = 0:N_ax-1
                 %pogledamo, ali pademo "ven"
                 if x2<0 | y2<0 | x2>=N_sag |y2>=N_cor
                   rotirana(y+1,x+1,z+1) = 0;
                else
                 %pogledamo kaj je na tem indeksu
                 rotirana(y+1,x+1,z+1) = iImage(y2+1,x2+1,z+1);
                end
                     
                
                
             end
                 
         end
     end
% na preseke dodamo funkcijo
    oP = zeros(N_ax,N_sag);

    for z=1:N_ax
        for x = 1:N_sag
            oP(z,x) = feval(iFunc, rotirana(:,x,z));
        end
    end
    
% odrežemo črnino na levi in desni
    for xod = 1: N_sag
        if max(oP(:,xod))
            k = xod;
            break
           
        end
    end
        for xod = N_sag:-1:1
        if max(oP(:,xod))
            k2 = xod;
            break
           
        end
        end
oH = (0:(k2-k)-1).*(iDim(1).*cos(phi)+iDim(2)*sin(phi));
oV = (0:N_ax-1).*iDim(3);
oP = oP(:,k:k2);
end


end