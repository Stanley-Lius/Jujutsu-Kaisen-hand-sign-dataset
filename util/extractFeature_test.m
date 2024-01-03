%% 萃取訓練影像的特徵(HoG + GLCM)
function [testFeatures,testLabels]=extractFeature_test(testSet)
    %% 确定特征向量尺寸
    img = read(testSet);
    %转化为灰度图像
    img=rgb2gray(img);
    %转化为2值图像
    lvl = graythresh(img);
    img = im2bw(img, lvl);
    img=imresize(img,[256 256]);
    cellSize = [4 4];
    [hog_feature, vis_hog] = extractHOGFeatures(img,'CellSize',cellSize);
    glcm_feature = getGLCMFeatures(img);
    SizeOfFeature = length(hog_feature)+ length(glcm_feature);

    reset(testSet);

    testFeatures = [];
    testLabels   = [];
    numImages = numel(testSet.UnderlyingDatastore.Files);
    %初始化特征向量
    features  = zeros(numImages, SizeOfFeature, 'single');
    labels = zeros(numImages,1);
   i=1;
   while hasdata(testSet)

        [img, info] = read(testSet);
        %转化为灰度图像
        img=rgb2gray(img);
        glcm_feature = getGLCMFeatures(img);
        %转化为2值图像
        lvl = graythresh(img);
        img = im2bw(img,lvl);
        img=imresize(img,[256 256]);
        [hog_4x4, vis4x4] = extractHOGFeatures(img,'CellSize',cellSize);
        features(i, :) = [hog_4x4 glcm_feature];
        labels(i) = [info.Label];
        i=i+1;
    end

    % 使用图像描述作为训练标签
    %labels = repmat(info.Label, numImages, 1);

    testFeatures = [testFeatures; features];
    testLabels=[testLabels; labels];
end