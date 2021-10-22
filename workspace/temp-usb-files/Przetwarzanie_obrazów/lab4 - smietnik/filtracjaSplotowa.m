function imFS = filtracjaSplotowa(im,dp3)
    
    [rows, cols] = size(im); %zczytanie wielkości obrazu do dwóch zmiennych
    imFS = zeros(rows,cols); %stworzenie macierzy dla obrazu wynikowego wypełnionej zerami
    mask = length(dp3); %długości maski, dla maski 3x3 przyjmie wartość 3
    im = double(im); %zamiana typu wczytanego obrazu na double

    k = floor(length(dp3)/2); %wiersze obrazu wynikowego
    l = floor(length(dp3)/2); %kolumny obrazu wynikowego
    for i = ceil(mask/2) : rows - floor(mask/2) %podwójna pętla for wewnątrz której następuje wpisanie zsumowanych wartości z obszaru maski do obrazu wynikowego
        k=k+1; %inkrementacja wierszy obrazu wynikowego
        for j = ceil(mask/2) : cols - floor(mask/2)
            l=l+1; %inkrementacja kolumn obrazu wynikowego
            imFS(k,l) = sum(sum((im(i-(floor(mask/2)) : i+(floor(mask/2)), j-(floor(mask/2)) : j+(floor(mask/2)))).*dp3));
        end
        l=floor(length(dp3)/2); %ustawienie wartości zmiennej do początkowej w celu późniejszego przepisywania wartości imFS(k,l) w odpowiedniej kolumnie
    end

    %normalizacja
    MIN = min(min(imFS)); %uzyskanie wartości minimalnej z obrazu wynikowego imFS
    MAX = max(max(imFS)); %uzyskanie wartości maksymalnej z obrazu wynikowego imFS
    imFS = uint8(255 .* ((imFS-MIN) / (MAX-MIN))); %proces normalizacji + zamiana typu na uint8
        

end