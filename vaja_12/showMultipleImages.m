function showMultipleImages(nRows, nCols, imgsFileNames)
figure;
for i = 1:nRows*nCols
    subplot(nRows,nCols,i);
    imshow(imgsFileNames{i});
end
end
