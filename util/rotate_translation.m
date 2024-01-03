%rotate images
function dataOut = rotate_translation(data)
    rt_pb = 0.2;
    ts_pb = 0.2;
    r = rand();
    if r <= rt_pb
        angle = (rand() * 120) - 60;
        dataOut = imrotate(data, angle, 'bilinear', 'crop');
    elseif r > rt_pb && r <= ts_pb
        dx = randi([-30,30],1,1);
        dy = randi([-30,30],1,1);
        
        dataOut = imtranslate(data, [dx,dy],'nearest');
    else 
        dataOut = data;
    end   
end