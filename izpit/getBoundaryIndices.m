function [oIdx1, oIdx2] = getBoundaryIndices(iImage, iAxis)
%iImage - vhodna slika 
%iAxis - x ali y - smer v kateri nas zanima obrezovanje
[Y ,X] = size(iImage);

if iAxis == 'x'
  M1 = sum(iImage);
    for x = 1: X 
        if M1(x) ~= Y*255
            oIdx1 = x;
            break
        end
    end
    for x = 1:X
        if(M1(X-x) ~=Y*255)
            oIdx2 = X-x;
            break
        end
    end
elseif iAxis == 'y'
    M2 = sum(iImage,2);
    for y = 1: Y
        if M2(y) ~= X*255
            oIdx1 = y;
            break
        end
    end
    
    for y = 1:Y
        if(M2(Y-y) ~=X*255)
            oIdx2 = Y-y;
            break
        end
    end
end
end

       