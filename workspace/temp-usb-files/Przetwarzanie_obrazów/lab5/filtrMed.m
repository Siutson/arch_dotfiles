function imFM = filtrMed(im,M)

    [rows, cols] = size(im); %zczytanie wielkości obrazu do dwóch zmiennych
    mask = length(M); %długości maski, dla maski 3x3 przyjmie wartość 3
    im = double(im); %zamiana typu wczytanego obrazu na double
    
    [k,l] = deal(0,0);
    for i = ceil(mask/2) : rows - floor(mask/2)
        k=k+1;
        for j = ceil(mask/2) : cols - floor(mask/2)
            l=l+1;
            tabWzOM = reshape(im(i-(floor(mask/2)) : i+(floor(mask/2)), j-(floor(mask/2)) : j+(floor(mask/2))),1,[]); %tabela wartości z obszaru maski
            tabWzOM = sort(tabWzOM); %sortowanie
            result = median(tabWzOM); %wybranie wartości środkowej
            imFM(k,l) = result;  %wpisanie wartości środkowej z posortowanego zestawu liczb
        end
        l=0;
    end
    
    %normalizacja
    MIN = min(min(imFM));
    MAX = max(max(imFM));
    imFM = uint8(255 .* ((imFM-MIN) / (MAX-MIN)));
    
    %przepisywanie wierszy i kolumn z obrazu bazowego
    for i = 1 : floor(mask/2) %pętla for odpowiedzielana za przepisanie pierwszych wierszy
        for j = 1 : cols
            imFM(i,j) = im(i,j);
        end
    end
        
    for i = rows - floor(mask/2) : rows %pętla for odpowiedzielana za przepisanie ostatnich wierszy
        for j = 1 : cols
            imFM(i,j) = im(i,j);
        end
    end

    for i = 1 : rows
        for j = 1 : floor(mask/2) %pętla for odpowiedzielana za przepisanie pierwszych kolumn
            imFM(i,j) = im(i,j);
        end
    end

    for i = 1 : rows
        for j = cols - floor(mask/2) : cols %przepisanie ostatnich kolumn
            imFM(i,j) = im(i,j);
        end
    end
end