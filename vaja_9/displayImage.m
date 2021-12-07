% prikazi sliko
function hImage = displayImage(iImage, hAxes, hListbox, hPanel)
        
    % izberi kordinatni sistem in prikazi sliko
    axes(hAxes);  
    hImage = image(uint8(iImage));
    cmap = [0:1/255:1]'; colormap([cmap cmap cmap]);  
    axis image; axis off;
    
    % shrani slikovne elemente
    set(hAxes, 'UserData', iImage);
    
    % doloci 'callback' za klik na sliko
    if ishandle(hListbox)
        set(hImage, 'ButtonDownFcn', {@addLandmark, hAxes, hListbox, hPanel});
    end