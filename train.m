clear all;
close all;
[trainingFeatures,trainingLabels] = preData();
svmModel = fitcecoc(trainingFeatures,trainingLabels);
