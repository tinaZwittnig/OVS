function [oMatrix, vargout] = analyzeDFT2(iMatrix, varargin)
%analizira spekter 
% iMatrix - 2D spekter 
% varargin - amplitude, phase, log, center, display & potrebni parametri
%izhodna
% oMatix - spekter nad katerim je uporablj varagin
% vargout - slika analiziranega spektra
oMatrix = iMatrix;
dTitle = '';
for i= 1:length(varargin)
    if strcmp(varargin{i}, 'amplitude')
        oMatrix = abs(oMatrix);
    elseif strcmp(varargin{i}, 'phase')
        oMatrix = unwrap(angle(oMatrix));
    elseif strcmp(varargin{i}, 'ln')
        oMatrix = log(oMatrix+10^(-10));
    elseif strcmp(varargin{i}, 'log')
        oMatrix = log10(oMatrix+10^(-10));
    elseif strcmp(varargin{i}, 'scale')
        lim = [min(oMatrix(:)), max(oMatrix(:))];
        oMatrix = (255/(lim(2)-lim(1)))*(oMatrix-lim(1));
        
    %centriraj oz. decentriraj
    elseif strcmp(varargin{i}, 'center')
        [N, M] = size(oMatrix);
        oMatrix = [oMatrix(N/2+1:end, M/2+1:end), oMatrix(N/2+1:end, 1:M/2);
                   oMatrix(1:N/2, M/2+1:end), oMatrix(1:N/2, 1:M/2)];
    elseif strcmp(varargin{i}, 'display')
        figure('Name', dTitle, 'Color', [1 1 1]);
        cmap= linspace(0,1,255)'
        cmap = [cmap, cmap ,cmap]
        colormap(cmap);
        vargout{1} = image(oMatrix);
        axis image;
    else
        dTitle = varargin{i};
    end
end

end