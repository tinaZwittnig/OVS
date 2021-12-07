
function [oImage1, oImage2] = getImages(iImage1, iImage2, iStep)
    
    % določi razliko slik
    oImage1 = uint8(abs(double(iImage1) - double(iImage2)+127));
    oImage2 = iImage2;
    [Y,X] = size(iImage2);
    for y = 1: iStep:Y
        for x = 1:iStep:X
            isDiag = rem(rem((y-1)/iStep,2)+ rem((x-1)/iStep,2),2);
            if isDiag
                xLim = x + iStep -1;
                yLim = y + iStep-1;
                if xLim >X
                    xLim = X;
                end
                if yLim >Y
                    yLim = Y;
                end
                oImage2(y:yLim, x:xLim) = iImage1(y:yLim, x:xLim);
            end
        end
    end
    oImage2 = oImage2(1:Y, 1:X);
end