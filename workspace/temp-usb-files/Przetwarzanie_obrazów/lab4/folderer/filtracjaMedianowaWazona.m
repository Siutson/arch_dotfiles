function imFMW = filtracjaMedianowaWazona(im,M)

    ex1choice = 'Wybierz maskę dla filtracji medianowej:\n1)      2)      3)\n0 1 0    1 1 1    3 0 1 0 3\n1 3 1    1 3 1    0 3 0 3 0\n0 1 0    1 1 1    1 0 9 0 1\n                  0 3 0 3 0\n                  3 0 1 0 3\n> ';
    x = input(ex1choice);
    
    [rows, cols] = size(im); %zczytanie wielkości obrazu do dwóch zmiennych
    mask = length(M{x}); %długości maski, dla maski 3x3 przyjmie wartość 3
    im = double(im); %zamiana typu wczytanego obrazu na double

    [k,l] = deal(0,0);
    for i = ceil(mask/2) : rows - floor(mask/2)
        k=k+1;
        for j = ceil(mask/2) : cols - floor(mask/2)
            l=l+1;
            tabWzOM = reshape(im(i-(floor(mask/2)) : i+(floor(mask/2)), j-(floor(mask/2)) : j+(floor(mask/2))),1,[]); %tabela wartości z obszaru maski (1 wiersz)
            reshaped_mask = reshape(M{x},1,[]); %zmiana ksztaltu macierzy maski (1 wiersz)
            mltpl_tabWzOM = repelem(tabWzOM,reshaped_mask); %mnozenie liczb z obszaru maski przez wartości z maski (pozbycie się wartosci z wagą 0)
            mltpl_tabWzOM = sort(mltpl_tabWzOM); %sortowanie
            result = median(mltpl_tabWzOM); %wybranie wartości środkowej
            imFMW(k,l) = result;  %wpisanie wartości środkowej z posortowanego zestawu liczb
        end
        l=0;
    end

    %normalizacja
    
    MIN = min(min(imFMW));
    MAX = max(max(imFMW));
    imFMW = uint8(255 .* ((imFMW-MIN) / (MAX-MIN)));
    
end