%資料預處理
function [trainingFeatures,trainingLabels,testFeatures,testLabels] = preData()
    addpath('util');
    addpath('show');

    imagePath = fullfile('C:\','Users','微積分炸裂','Pictures',...
        'Jujutsu-Kaisen-hand-sign-dataset','dataset','train');
    imdsTrain = imageDatastore(imagePath, "IncludeSubfolders",...
        true,"FileExtensions",".jpg","LabelSource","foldernames")
    imdsTrain = shuffle(imdsTrain);

    %[imdsTrain, imdsTest] = splitEachLabel(imds,0.95,0.05);


%     imdsTrain = transform(imdsTrain,@Normalization);
%     imdsVal = transform(imdsVal,@Normalization);
%     imdsTest = transform(imdsTest,@Normalization);

    imdsTrain = transform(imdsTrain,@rotate_translation);
    %imdsTest = transform(imdsTest,@rotate_translation);

%     imdsTrain = transform(imdsTrain,@resize);
%     imdsVal = transform(imdsVal,@resize);
%     imdsTest = transform(imdsTest,@resize);

    [trainingFeatures,trainingLabels]=extractFeature(imdsTrain);

    preview_batch(imdsTrain,5,5);
end




