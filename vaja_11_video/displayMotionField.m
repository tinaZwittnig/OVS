function displayMotionField(iMF, iCP, iTitle, varargin)
    %ustvari prikazno okno
    if isempty(varargin)
        figure('Name', iTitle, 'Color', [1, 1, 1]);
    else
        displayImage(varargin{1}, iTitle);
        hold on;
    end
    
    
    %izriši polje vektorjev
    quiver(iCP(:,:,1), iCP(:,:,2), iMF(:,:,1), iMF(:,:,2), 'r-')
    set(gca, 'Ydir', 'reverse');
    axis image