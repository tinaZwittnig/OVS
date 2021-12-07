function histo =  displayHistogram(iHist, iLevels, iTitle)
% displayHistogram prikaže dan histogram
% vhodni podatki:
%   iHist - histogram v matrični matriki
%   iLevels - dinamično območje sivinskih vrednosti 
%   iTitle - naslov histograma
histo = figure('Name', iTitle, 'Color', [1 1 1]);
bar(iLevels.*255,iHist,'BarWidth',1,'EdgeColor', [0.5 0.5 1], 'FaceColor', 'cyan')
set(gca,'XLim',[min(iLevels),max(iLevels)].*255)
set(gca,'YLim',[0,max(iHist).* 1.05])
end
