function res = zad10funkcja(im)
    
    [rows,cols] = size(im);
    area = 3;
    counter = 0;
    newIm = zeros(rows,cols);
    
    for i = ceil(area/2) : rows - floor(area/2)
        for j = ceil(area/2) : cols - floor(area/2)        
            valsFromArea = reshape(im(i-(floor(area/2)) : i+(floor(area/2)), j-(floor(area/2)) : j+(floor(area/2))),1,[]);
            
            for x = 1 : length(valsFromArea)
                if valsFromArea(x) == 0
                    counter = counter + 1;
                end
            end
            if counter == 8
                if valsFromArea((ceil(length(valsFromArea)/2))) == 1
                    newIm(i,j) = 1;
                end
            else
                newIm(i,j) = newIm(i,j);
            end
            counter = 0;
        end
    end
    
    res = newIm;
end