function imFS = filtracjaSplotowa(im,userInput,choice)
    
    % -- przepisywanie wierszy i kolumn do obrazu wynikowego --
    if choice == 1
        prompt1 = '\nPodaj żądaną maskę:\n1) DP 3x3,\n2) DP 5x5,\n3) DP 7x7,\n4) Gauss 3x3,\n5) GP 3x3,\n6) GP 5x5,\n7) Lapace,\n8) Prewitt,\n9) Sobel,\n10) Emboss,\n11) Detekcja linii: 1-szy filtr,\n12) Detekcja linii: 2-gi filtr.\n> ';
        x = input(prompt1); %zczytanie wyboru użytkownika
        [rows, cols] = size(im); %zczytanie wielkości obrazu do dwóch zmiennych
        imFS = zeros(rows,cols); %stworzenie macierzy dla obrazu wynikowego wypełnionej zerami
        mask = length(userInput{x}); %długości maski, dla maski 3x3 przyjmie wartość 3
        im = double(im); %zamiana typu wczytanego obrazu na double

        k = floor(length(userInput{x})/2); %wiersze obrazu wynikowego
        l = floor(length(userInput{x})/2); %kolumny obrazu wynikowego
        for i = ceil(mask/2) : rows - floor(mask/2) %podwójna pętla for wewnątrz której następuje wpisanie zsumowanych wartości z obszaru maski do obrazu wynikowego
            k=k+1; %inkrementacja wierszy obrazu wynikowego
            for j = ceil(mask/2) : cols - floor(mask/2)
                l=l+1; %inkrementacja kolumn obrazu wynikowego
                imFS(k,l) = sum(sum((im(i-(floor(mask/2)) : i+(floor(mask/2)), j-(floor(mask/2)) : j+(floor(mask/2)))).*userInput{x}));
            end
            l=floor(length(userInput{x})/2); %ustawienie wartości zmiennej do początkowej w celu późniejszego przepisywania wartości imFS(k,l) w odpowiedniej kolumnie
        end
        
        %normalizacja
        MIN = min(min(imFS)); %uzyskanie wartości minimalnej z obrazu wynikowego imFS
        MAX = max(max(imFS)); %uzyskanie wartości maksymalnej z obrazu wynikowego imFS
        imFS = uint8(255 .* ((imFS-MIN) / (MAX-MIN))); %proces normalizacji + zamiana typu na uint8
        
        for i = 1 : floor(mask/2) %pętla for odpowiedzielana za przepisanie pierwszych wierszy
            for j = 1 : cols
                imFS(i,j) = im(i,j);
            end
        end
        
        for i = rows - floor(mask/2) : rows %pętla for odpowiedzielana za przepisanie ostatnich wierszy
            for j = 1 : cols
                imFS(i,j) = im(i,j);
            end
        end
        
        for i = 1 : rows
            for j = 1 : floor(mask/2) %pętla for odpowiedzielana za przepisanie pierwszych kolumn
                imFS(i,j) = im(i,j);
            end
        end
        
        for i = 1 : rows
            for j = cols - floor(mask/2) : cols %pętla for odpowiedzielana za przepisanie ostatnich kolumn
                imFS(i,j) = im(i,j);
            end
        end
    end
    
    % -- powiększenie obrazu początkowego -- 
    if choice == 2
        prompt2 = '\nPodaj żądaną maskę:\n1) DP 3x3,\n2) DP 5x5,\n3) DP 7x7,\n4) Gauss 3x3,\n5) GP 3x3,\n6) GP 5x5,\n7) Lapace,\n8) Prewitt,\n9) Sobel,\n10) Emboss,\n11) Detekcja linii: 1-szy filtr,\n12) Detekcja linii: 2-gi filtr.\n> ';
        x = input(prompt2); %zczytanie wyboru użytkownika
        for i = 1 : floor(length(userInput{x})/2) %pętla for odpowiedzialna za powielanie odpowiednią ilość razy wierszy i kolumn obrazu początkowego
            im(2:end+1,:) = im(:,:); %zdublowanie pierwszego wiersza
            im(end+1,:) = im(end,:); %zdublowanie ostatniego wiersza
            im(:,2:end+1) = im(:,:); %zdublowanie pierwszej kolumny
            im(:,end+1) = im(:,end); %zdublowanie ostatniej kolumny
        end

        [rows, cols] = size(im); %zczytanie wielkości obrazu do dwóch zmiennych
        mask = length(userInput{x}); %długości maski, dla maski 3x3 przyjmie wartość 3
        im = double(im); %zamiana typu wczytanego obrazu na double

        [k,l] = deal(0,0); %ustawienie wartości wierszy i kolumn 
        for i = ceil(mask/2) : rows - floor(mask/2) %podwójna pętla for wewnątrz której następuje wpisanie zsumowanych wartości z obszaru maski do obrazu wynikowego
            k=k+1; %inkrementacja wierszy obrazu wynikowego
            for j = ceil(mask/2) : cols - floor(mask/2)
                l=l+1; %inkrementacja kolumn obrazu wynikowego
                imFS(k,l) = sum(sum((im(i-(floor(mask/2)) : i+(floor(mask/2)), j-(floor(mask/2)) : j+(floor(mask/2)))).*userInput{x}));
            end
            l=0;
        end

        MIN = min(min(imFS)); %uzyskanie wartości minimalnej z obrazu wynikowego imFS
        MAX = max(max(imFS)); %uzyskanie wartości maksymalnej z obrazu wynikowego imFS
        imFS = uint8(255 .* ((imFS-MIN) / (MAX-MIN))); %proces normalizacji + zamiana typu na uint8
    end

end