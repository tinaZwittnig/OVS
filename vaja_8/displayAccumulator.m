% display accumulator image
function hImage = displayAccumulator(iAcc, iR, iF, hAxes)

    % skaliraj akumulator na celotno ombocje
    minV = min(iAcc(:));
    maxV = max(iAcc(:));
    if (minV == maxV)
        return;
    end
    iAcc = (double(iAcc)-minV)./(maxV-minV).*255;    
    
    % izberi kordinatni sistem in prikazi akumulator
    axes(hAxes);
    hImage = image(uint8(iAcc));
    cmap = [0:1/255:1]'; colormap([cmap cmap cmap]);
    axis tight;
    
    % nastavi domet in oznake parametra "fi" (x os)
    vecF = 1:floor(length(iF)/18):length(iF);
    set(hAxes, 'XTick', vecF);
    set(hAxes, 'XTickLabel', iF(vecF));
    xlabel('"fi"   [kotne stopinje]');
    % nastavi domet in oznake parametra "r" (y os)
    vecR = 1:floor(length(iR)/10):length(iR);
    ylabel('"r"   [slikovni elementi]');
    set(hAxes, 'YTick', vecR);
    set(hAxes, 'YTickLabel', iR(vecR));
    