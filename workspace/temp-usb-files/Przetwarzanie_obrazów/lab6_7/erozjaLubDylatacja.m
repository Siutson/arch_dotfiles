function res = erozjaLubDylatacja(im,fp1,fp2)
    
    [rows,cols] = size(im);
    area = 3;
    counter = 0;
    
    [k,l] = deal(0,0);
    for i = ceil(area/2) : rows - floor(area/2)
        k=k+1;
        for j = ceil(area/2) : cols - floor(area/2)
            l=l+1;
            valsFromArea = reshape(im(i-(floor(area/2)) : i+(floor(area/2)), j-(floor(area/2)) : j+(floor(area/2))),1,[]);
            for x = 1 : length(valsFromArea)
                if valsFromArea(x) == fp1
                    counter = counter + 1;
                end
            end
            if counter == 9
                im(k,l) = fp1;
            else
                im(k,l) = fp2;
            end
            counter = 0;
        end
        l=0;
    end
    
    res = im;
end