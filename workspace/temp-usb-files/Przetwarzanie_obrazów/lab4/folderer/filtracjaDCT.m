function fDCT = filtracjaDCT(im)

    imD=dct2(im);     
    [rows, cols] = size(imD);
    
    usrInput = 'Wybierz filtr:\n1) DP,\n2) GP,\n3) PP.\n> ';
    x = input(usrInput);
    
    [columnsInImage, rowsInImage] = meshgrid(1:rows, 1:cols);
    centerX = 1;
    centerY = 1;
    radius = 100;
    dp = double((rowsInImage - centerY).^2 + (columnsInImage - centerX).^2 <= radius.^2); %macierz pelniaca funkcje filtru dolnoprzepustowego dla filtracji DCT
    radius2 = 60;
    dpDR = double((rowsInImage - centerY).^2 + (columnsInImage - centerX).^2 <= radius2.^2);
    gp = 1 - dp; %macierz pelniaca funkcje filtru gornoprzepustowego dla filtracji DCT
    pp = xor(dp,dpDR); %macierz pelniaca funkcje filtru pasmowoprzepustowego dla filtracji DCT
    
    if x == 1
        Y=imD.*dp;
    end
    
    if x == 2
        Y=imD.*gp;
    end
    
    if x == 3
        Y=imD.*pp;
    end
    
    WY=abs(idct2(Y));

    %normalizacja
    fDCT = 255*mat2gray(WY);
    fDCT = uint8(abs(fDCT));
    
    imshow(log(abs(imD)),[]), colormap(jet), colorbar;
    title('obraz transformaty DCT');
    pause(0.5);
    figure;
end