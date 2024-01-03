%resize dataset to 224x224
function dataOut = resize(data)
    targetSize = [224,224];
    dataOut = imresize(data,targetSize);
end