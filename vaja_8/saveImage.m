% shrani sliko
function saveImage(iImage, iFilename, iFormat)

    % preveri, ali slika obstaja
    if (~isempty(iImage))
        % doloci barvno lestvico
        cmap = [0:1/255:1]'; cmap = [cmap cmap cmap];    
        % preveri format zapisa
        switch lower(iFormat)
            % bitna slika
            case 'bmp'
                imwrite(uint8(iImage), cat(2, iFilename, '.', iFormat), iFormat);
            % jpeg slika
            case 'jpg'
                imwrite(uint8(iImage), cat(2, iFilename, '.', iFormat), iFormat);
        end
    end