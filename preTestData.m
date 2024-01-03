%資料預處理
function [testFeatures,testLabels] = preTestData()
    addpath('util');
    addpath('show');

    imagePath = fullfile('C:\','Users','微積分炸裂','Pictures',...
        'Jujutsu-Kaisen-hand-sign-dataset','dataset','test');
    imdsTest = imageDatastore(imagePath, "IncludeSubfolders",...
        true,"FileExtensions",".jpg","LabelSource","foldernames")
    imdsTest = shuffle(imdsTest);

    %[imdsTrain, imdsTest] = splitEachLabel(imds,0.95,0.05);


%     imdsTrain = transform(imdsTrain,@Normalization);
%     imdsVal = transform(imdsVal,@Normalization);
%     imdsTest = transform(imdsTest,@Normalization);

    %imdsTrain = transform(imdsTrain,@rotate_translation);
    imdsTest = transform(imdsTest,@rotate_translation);

%     imdsTrain = transform(imdsTrain,@resize);
%     imdsVal = transform(imdsVal,@resize);
%     imdsTest = transform(imdsTest,@resize);

    [testFeatures,testLabels]=extractFeature_test(imdsTest);

    %preview_batch(imdsTest,5,5);
end