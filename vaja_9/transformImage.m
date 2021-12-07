% geometrijska preslikava v 2D
function oImage = transformImage(iType, iImage, iDim, iP, iBgr, iInterp)

    % privzeta interpolacija je reda 0
    if nargin < 6
        iInterp = 0;
    end
    % dimenzija vhodne in izhodne slike
    [Y,X] = size(iImage);
    % inicializacija izhodne slike
    oImage = ones(Y,X)*iBgr;
    C = [size(iImage,2) size(iImage,1)]/2.*iDim;
    % zanka èez vse slikovne elemente 
    for y = 1:Y
        for x = 1:X
            % trenutna toèka
            pt = [x y].*iDim;
            % afina geometrijska preslikava
            if strcmp(iType, 'affine')
                % preslikana toèka
                pt = iP*[pt'; 1];
                pt = pt(1:2)';
            % geometrijska preslikava z radialno funkcijo
            elseif strcmp(iType, 'radial')
                % preslikana toèka
                U = getRadialValue(pt, iP{1});
                pt = [U*iP{2}(:,1) U*iP{2}(:,2)];
            end
            % preslikan slikovni element
            pt = pt./iDim;
            %--------------------------------------------------------
            % interpolacija vrednosti
            if iInterp == 0
                % A - interpolacija reda 0
                px = round(pt);
                % preveri veljavnost koordinate slikovnega elementa
                if px(1) < X && px(2) < Y && px(1) > 0 && px(2) > 0
                    % priredi sivinsko vrednost
                    oImage(y,x) = iImage(px(2),px(1));
                end
            %--------------------------------------------------------
            elseif iInterp == 1
                % B - interpolacija reda 1 (VAJA 3: interpolateImage.m)
                px = floor(pt);
                % preveri veljavnost koordinate slikovnega elementa
                if px(1) < X && px(2) < Y && px(1) > 0 && px(2) > 0
                    % izraèunaj uteži
                    a = abs(pt(1)-(px(1)+0))*abs(pt(2)-(px(2)+0));
                    b = abs(pt(1)-(px(1)+1))*abs(pt(2)-(px(2)+0));
                    c = abs(pt(1)-(px(1)+0))*abs(pt(2)-(px(2)+1));
                    d = abs(pt(1)-(px(1)+1))*abs(pt(2)-(px(2)+1));
                    % izraèunaj pripadajoèe sivinske vrednosti
                    sa = iImage(px(2)+1,px(1)+1);
                    sb = iImage(px(2)+1,px(1)+0);
                    sc = iImage(px(2)+0,px(1)+1);
                    sd = iImage(px(2)+0,px(1)+0);
                    % izraèunaj sivinsko vrednost in jo zaokroži
                    oImage(y,x) = floor(a*sa + b*sb + c*sc + d*sd);
                end
            end
            %--------------------------------------------------------
        end
    end