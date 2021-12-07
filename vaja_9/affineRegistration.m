function [oT, oCP, oImage] = affineRegistration(iType, rCP, iCP, iImage)
%affineRegistration poravna sliko
%vhodni argumentu
% iType - tip afine preslikave
% rCP - kontrolne točke na referenčni sliki
% iCP - kontrolne točke na premični sliki
% iImage - premična slika

    % inicializiraj preslikavo z identiteto
    oT = eye(3); oImage = iImage; oCP = iCP;
    %vzamemo x in y koordinate
    X = rCP(:,1);
    Y = rCP(:,2);
    U = iCP(:,1);
    V = iCP(:,2);
    %afina interpolacijska poravnava
    if strcmp(iType, "interpolation")
        %določi referenčno matriko
        XY = [X'; Y'; ones(1,length(X))];
        %določi vhodno matriko
        UV = [U'; V'; ones(1,length(U))];
        if det(XY)~=0
            oT = UV/XY;
        end
        
    elseif strcmp(iType, "approximation")
       %koliko točk imamo?
        K = length(X);
        % izacunaj elemente matrike
        xx = mean(X.^2);
        yy = mean(Y.^2);
        xy = mean(X.* Y);
        x = mean(X);
        y = mean(Y);
        ux= mean(U.*X);
        uy = mean (U.*Y);
        vx= mean(V.*X);
        vy = mean (V.*Y);
        u = mean(U);
        v = mean(V);
        XY1 = [xx xy x;
             xy,yy,y;
             x, y, 1];
        
        XY = [XY1, zeros(3,3); zeros(3,3), XY1];
        UV = [ux uy u vx vy v]';
        if det(XY)~=0
            oT = XY\UV;
            oT = [reshape(oT,3,2)';0 0 1];
        end
    end
    oCP = inv(oT)*[iCP'; ones(1, size(iCP,1))];
    oCP = oCP(1:2,:)';
    
    %afina preslikava slike glede na matriko preslikave
    oImage = transformImage('affine', iImage, [1,1],oT,0, 1);
    
    
end