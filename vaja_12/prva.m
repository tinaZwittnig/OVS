
imds = imageDatastore('/usr/local/MATLAB/R2020b/toolbox/nnet/nndemos/nndatasets/DigitDataset', 'includeSubfolders',true,'LabelSource', 'foldername')
perm = randperm(1000,30);
sezSlik = imds.Files(perm);
showMultipleImages(6,5,sezSlik);
labelCount = countEachLabel(imds);
