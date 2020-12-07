function frame = Shader(resX, resY)
    tic
    frameR = zeros(resX, resY);
    frameG = frameR;
    frameB = frameR;

    parfor v = 1:resY
        for u = 1:resX
            pixel = MainImage([u,v],[resX,resY]);
            frameR(u,v) = pixel(1);
            frameG(u,v) = pixel(2);
            frameB(u,v) = pixel(3);
        end
    end

    frame = imrotate(cat(3, frameR, frameG, frameB), 90);
    toc
end