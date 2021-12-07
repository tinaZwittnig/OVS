% prikazi tocke
function displayPoints(valR, valF, stepR, stepF, hAxes)
    
    % doloci koordinate tock
    valR = floor(valR./stepR) + 1;
    valF = floor((valF+90)./stepF) + 1;
    
    % izberi kordinatni sistem in prikazi tocke
    axes(hAxes);
    xLim = get(hAxes, 'XLim'); yLim = get(hAxes, 'YLim');
    hold on;    
    for i = 1:length(valF)
        plot(valF(i), valR(i), 'ro', 'MarkerSize', 10, 'LineWidth', 2);
    end    
    hold off;
    set(hAxes, 'XLim', xLim); set(hAxes, 'YLim', yLim);