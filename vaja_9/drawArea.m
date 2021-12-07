% izrisi pravokotnik podrocja
function drawArea(iPosition, hAxes)

    % izberi koordinatni sistem
    axes(hAxes);
    % izrisi pravokotnik z doloceno barvo
    rectangle('Position', iPosition, 'LineWidth', 1, 'EdgeColor', [1 0 0]);
