function oImage = sivinske(iImage)
%preslika v sivinjske vrednosti med 0 in 255
%vhodni argument iImage - vhodna slika

minimal = min(iImage(:));
if minimal <0
    iImage = iImage + minimal;
else
    iImage = iImage - minimal;
end
maksimal = max(iImage(:));
oImage = iImage./maksimal * 255;
end