%% 萃取訓練影像的特徵(HoG + GLCM)
function [trainingFeatures,trainingLabels]=extractFeature(trainingSet)
    %% 确定特征向量尺寸
    img = read(trainingSet);
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

    %% 构建训练样本特征向量和训练样本标签
    trainingFeatures = [];
    trainingLabels   = [];
    numImages = numel(trainingSet.UnderlyingDatastore.Files);
    features  = zeros(numImages, SizeOfFeature, 'single');%初始化特征向量
    labels = zeros(numImages,1);
    % 遍历每张图片
    i=1;
    while hasdata(trainingSet)
        [img,info] = read(trainingSet);% 取出圖片
        img=rgb2gray(img);                % 转化为灰度图像
        glcm_feature = getGLCMFeatures(img);  % 提取GLCM特征

        lvl = graythresh(img);            % 阈值化
        img = im2bw(img,lvl);            % 转化为2值图像
        img=imresize(img,[256 256]);
        % 提取HOG特征
        [hog_feature, vis_hog] = extractHOGFeatures(img,'CellSize',cellSize);
        % 合并两个特征
        features(i, :) = [hog_feature glcm_feature];
        labels(i) = [info.Label];
        i=i+1;
    end
    % 使用图像描述作为训练标签
    %labels = repmat(info.Label, numImages, 1);  
    % 逐个添加每张训练图片的特征和标签
    trainingFeatures = [trainingFeatures; features];
    trainingLabels   = [trainingLabels; labels];
end