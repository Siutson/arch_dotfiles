function imNFS = filtrSpl(imN, M)
    
    for i = 1 : floor(length(M)/2) %pętla for odpowiedzialna za powielanie odpowiednią ilość razy wierszy i kolumn obrazu początkowego
        imN(2:end+1,:) = imN(:,:); %zdublowanie pierwszego wiersza
        imN(end+1,:) = imN(end,:); %zdublowanie ostatniego wiersza
        imN(:,2:end+1) = imN(:,:); %zdublowanie pierwszej kolumny
        imN(:,end+1) = imN(:,end); %zdublowanie ostatniej kolumny
    end

    [rows, cols] = size(imN); %zczytanie wielkości obrazu do dwóch zmiennych
    mask = length(M); %długości maski, dla maski 3x3 przyjmie wartość 3
    imN = double(imN); %zamiana typu wczytanego obrazu na double

    [k,l] = deal(0,0); %ustawienie wartości wierszy i kolumn 
    for i = ceil(mask/2) : rows - floor(mask/2) %podwójna pętla for wewnątrz której następuje wpisanie zsumowanych wartości z obszaru maski do obrazu wynikowego
        k=k+1; %inkrementacja wierszy obrazu wynikowego
        for j = ceil(mask/2) : cols - floor(mask/2)
            l=l+1; %inkrementacja kolumn obrazu wynikowego
            imNFS(k,l) = sum(sum((imN(i-(floor(mask/2)) : i+(floor(mask/2)), j-(floor(mask/2)) : j+(floor(mask/2)))).*M));
        end
        l=0;
    end

    MIN = min(min(imNFS)); %uzyskanie wartości minimNalnej z obrazu wynikowego imNFS
    MAX = max(max(imNFS)); %uzyskanie wartości maksymalnej z obrazu wynikowego imNFS
    imNFS = uint8(255 .* ((imNFS-MIN) / (MAX-MIN))); %proces normalizacji + zamiana typu na uint8
    

end