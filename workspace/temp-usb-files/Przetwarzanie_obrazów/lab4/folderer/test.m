im = double([5 8 6 9; 6 4 7 7; 1 0 3 2; 6 7 5 1; 8 9 3 5]);
M = double([1 2 1; 2 3 2; 1 2 1]);

[rows, cols] = size(im); %zczytanie wielkości obrazu do dwóch zmiennych
mask = length(M); %długości maski, dla maski 3x3 przyjmie wartość 3
im = double(im); %zamiana typu wczytanego obrazu na double

[k,l] = deal(1,1);
for i = ceil(mask/2) : rows - floor(mask/2)
    k=k+1;
    for j = ceil(mask/2) : cols - floor(mask/2)
        l=l+1;
        tabWzOM = reshape(im(i-(floor(mask/2)) : i+(floor(mask/2)), j-(floor(mask/2)) : j+(floor(mask/2))),1,[]); %tabela wartości z obszaru maski (1 wiersz)
        reshaped_mask = reshape(M,1,[]); %zmiana ksztaltu macierzy maski (1 wiersz)
        mltpl_tabWzOM = repelem(tabWzOM,reshaped_mask); %mnozenie liczb z obszaru maski przez wartości z maski (pozbycie się wartosci z wagą 0)
        mltpl_tabWzOM = sort(mltpl_tabWzOM); %sortowanie
        result = median(mltpl_tabWzOM); %wybranie wartości środkowej
        imFMW(k,l) = result;  %wpisanie wartości środkowej z posortowanego zestawu liczb
    end
    l=1;
end

%normalizacja

% MIN = min(min(imFMW));
% MAX = max(max(imFMW));
% imFMW = uint8(255 .* ((imFMW-MIN) / (MAX-MIN)));
imFMW