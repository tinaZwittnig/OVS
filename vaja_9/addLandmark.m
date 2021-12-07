% dodaj tocko na sliko
function addLandmark(hImage, eventData, hAxes, hListbox, hPanel)
    
    % koordinate klika na sliko (upostevaj nDec decimalnih mest)
    nDec = 0;
    if (~isempty(hImage))
        mCoor = get(hAxes, 'CurrentPoint');
        pCoor = [floor(mCoor(1,1)*(10^nDec))/(10^nDec), floor(mCoor(1,2)*(10^nDec))/(10^nDec)];
    else
        mCoor = eventData;
        pCoor = eventData;        
    end
    
    % izrisi tocko na sliki
    drawLandmark(mCoor(1,1), mCoor(1,2), hAxes, hPanel);
    
    % dodaj tocko v seznam
    iLand = get(hListbox, 'String');
    iLand = strvcat(iLand, ['(', num2str(pCoor(1,1)), ',', num2str(pCoor(1,2)), ')']);
    set(hListbox, 'Value', size(iLand,1));
    set(hListbox, 'String', num2str(iLand));