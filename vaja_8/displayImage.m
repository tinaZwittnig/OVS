% prikazi sliko
function hImage = displayImage(iImage, hAxes)
        
    % skaliraj vhodno sliko na celotno ombocje
    minV = min(double(iImage(:)));
    maxV = max(double(iImage(:)));
    if (minV == maxV)
        return;
    end
    iImage = (double(iImage)-minV)./(maxV-minV).*255;  

    % izberi koordinatni sistem in prikazi sliko
    axes(hAxes);  
    hImage = image(uint8(iImage));
    cmap = [0:1/255:1]'; colormap([cmap cmap cmap]);  
    axis image; axis off;
    
    % shrani slikovne elemente
    set(hAxes, 'UserData', iImage);