% odstrani tocko iz slike
function removeLandmark(hAxes, hListbox, hPanel)
    
    % vrednosti slikovnih elementov
    iImage = get(hAxes, 'UserData');
    % seznam trenutnih tock
    iLand = get(hListbox, 'String');

    % preveri vsebino spremenljivk
    if (~isempty(iImage) & ~isempty(iLand))

        % pridobi polozaj oznacene tocke v seznamu
        iPos = get(hListbox, 'Value');    
        
        % prikazi sliko brez tock
        set(hListbox, 'String' , '');
        set(hListbox, 'UserData' , []);
        hImage = displayImage(iImage, hAxes, hListbox, hPanel);
        
        % ponastavi indeks barve
        set(hPanel, 'UserData', 1);
        
        % doloci in prikazi nove tocke
        oLand = [];
        for (i = 1:size(iLand,1))
            if (i ~= iPos)
                oCoor = str2num(strrep(strrep(strrep(iLand(i,:), ',', ' '), ')', ''), '(', ''));
                oLand = strvcat(oLand, iLand(i,:));
                drawLandmark(oCoor(1,1), oCoor(1,2), hAxes, hPanel);
            end
        end
        set(hListbox, 'String' , oLand);
        
        % izberi tocko v seznamu
        if (iPos > size(oLand,1))
            set(hListbox, 'Value' , size(oLand,1));
        else
            set(hListbox, 'Value' , iPos)
        end
    else
        set(hPanel, 'UserData', []);
    end