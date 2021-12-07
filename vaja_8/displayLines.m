% prikazi premice
function displayLines(valR, valF, hAxes)
        
    % pretvori stopinje v radiane
    valF = valF.*(pi/180);
    
    % izberi kordinatni sistem in prikazi premice
    axes(hAxes);
    xLim = get(hAxes, 'XLim'); yLim = get(hAxes, 'YLim');
    hold on;
    for i = 1:length(valF)
        if (sin(valF(i)) ~= 0)
            x = get(hAxes, 'XLim');
            y = (valR(i) - x.*cos(valF(i)))/sin(valF(i));
            line(x, y, 'Color', 'r', 'LineWidth', 2);
        end
    end
    hold off;
    set(hAxes, 'XLim', xLim); set(hAxes, 'YLim', yLim);