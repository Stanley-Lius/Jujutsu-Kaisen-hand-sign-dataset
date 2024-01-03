%% 提取灰度共生矩陣特徵值
function [features] = getGLCMFeatures(image)
    features_all  = [];
    for i = 1:10 %計算的像素長度
        %0度
        glcm = graycomatrix(image, 'Offset', [0,i]);
        stats = graycoprops(glcm);
        
        %45度
        glcm45 = graycomatrix(image, 'Offset', [-i,i]);
        stats45 = graycoprops(glcm45);

        %90度
        glcm90 = graycomatrix(image, 'Offset', [-i,0]);
        stats90 = graycoprops(glcm90);


        %135度
        glcm135 = graycomatrix(image, 'Offset', [-i,-i]);
        stats135 = graycoprops(glcm135);
        
        %% 將對比度、關聯性、熵值和紋理的變化程度分開，並計算平均值以及標準差
        stats7x4 = [stats.Contrast stats.Correlation stats.Energy stats.Homogeneity;
            stats45.Contrast stats45.Correlation stats45.Energy stats45.Homogeneity;
            stats90.Contrast stats90.Correlation stats90.Energy stats90.Homogeneity;
            stats135.Contrast stats135.Correlation stats135.Energy stats135.Homogeneity];
        features_all = [features_all mean(stats7x4,1) std(stats7x4,0,1)];
    end
    features = features_all;
end