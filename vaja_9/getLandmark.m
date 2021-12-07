% pridobi tocke iz seznama
function oLand = getLandmark(hListbox)

    % seznam tock
    iLand = get(hListbox, 'String');
    
    % pridobi tocke iz danega seznama
    oLand = [];
    for (i = 1:size(iLand,1))
        oLand = [oLand; str2num(strrep(strrep(strrep(iLand(i,:), ',', ' '), ')', ''), '(', ''));];
    end

    
   