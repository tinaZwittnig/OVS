function oF = framePrediction(iF, iMV)
%krožni premik vrstic in stoplcov
oF = circshift(iF, [iMV(2), iMV(1)]);
if iMV(1)>=0
    oF(:, 1:iMV(1)) = -1;
else
    oF(:, end+iMV(1)+1:end) = -1;
end
if iMV(2)>=0
    oF(1:iMV(2),:) = -1;
else
    oF( end+iMV(2)+1:end,:) = -1;
end

end