function res = detekcjaKrawedzi(im,v1,v2)
    
    [rows,cols] = size(im);
    area = 3;
    counter = 0;
    obrazRoboczy = im;
    
    for i = ceil(area/2) : rows - floor(area/2)
        for j = ceil(area/2) : cols - floor(area/2)        
            valsFromArea = reshape(obrazRoboczy(i-(floor(area/2)) : i+(floor(area/2)), j-(floor(area/2)) : j+(floor(area/2))),1,[]);
            
            for x = 1 : length(valsFromArea)
                if valsFromArea(x) == v1
                    counter = counter + 1;
                elseif valsFromArea((ceil(length(valsFromArea)/2))) == v2
                    counter = counter + 1;
                end
            end
            if counter == 9
                im(i,j) = v2;
            else
                im(i,j) = im(i,j);
            end
            counter = 0;
        end
    end
    
    res = im;
end