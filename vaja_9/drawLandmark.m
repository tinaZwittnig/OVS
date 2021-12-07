% izrisi tocko na sliko
function drawLandmark(xCoor, yCoor, hAxes, hPanel)

    % seznam barv
    lColors = [1 0 0;           % rdeca
               0 1 0;           % zelena
               0 0 1;           % modra
               1 1 0;           % rumena
               1 0 1;           % magenta
               0 1 1;           % cian
               1.0 0.5 0.0;     % oranzna
               0.5 0.0 1.0];    % vijolicna
    
    % doloci indeks barve
    cIndex = 1;
    if ishandle(hPanel)
        cIndex = get(hPanel, 'UserData');
        if (isempty(cIndex))
            cIndex = 1;
        end
    end
    
    % izrisi tocko z izbrano barvo
    axes(hAxes);
    line([xCoor-5; xCoor+5],[yCoor; yCoor], 'Color', lColors(cIndex,:), 'LineWidth', 2);
    line([xCoor; xCoor],[yCoor-5; yCoor+5], 'Color', lColors(cIndex,:), 'LineWidth', 2);
    
    % shrani indeks barve
    cIndex = cIndex + 1;
    if (cIndex > size(lColors,1))
        cIndex = 1;
    end
    if ishandle(hPanel)
        set(hPanel, 'UserData', cIndex);
    end

    