clc;
close all;

%提取測試集的特徵
[testFeatures,testLabels] = preTestData();

%% 用測試集特徵進行預測
predictLabels = predict(svmModel, testFeatures);

%% 計算混淆矩陣
confMat = confusionmat(testLabels, predictLabels)
% 計算準確度
accuracy = (confMat(1,1)/sum(confMat(1,:))+confMat(2,2)/sum(confMat(2,:))+...
    confMat(3,3)/sum(confMat(3,:))+confMat(4,4)/sum(confMat(4,:))+...
    confMat(5,5)/sum(confMat(5,:))+confMat(6,6)/sum(confMat(6,:))+...
    confMat(7,7)/sum(confMat(7,:))+confMat(8,8)/sum(confMat(8,:))+ ...
    confMat(9,9)/sum(confMat(9,:)))/9