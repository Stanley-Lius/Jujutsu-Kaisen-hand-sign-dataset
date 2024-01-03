%show batch images,r is row,c is colume
function preview_batch(data,r,c)
    k=1;
    for j=1:r
        for i=1:c
            reset(data);
            [img,info] = read(data);
            subplot(r,c,k);
            imshow(img);
            title(info.Label);
            k=k+1;
        end
    end
end