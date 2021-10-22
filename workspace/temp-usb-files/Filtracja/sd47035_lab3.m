clear all
im1 = imread('PictureBW.bmp');
im2 = imread('sp_img.bmp');

% ---- maski filtrów ----
Mdp3 = double(ones(3)); %maska dp uśredniająca 3x3
Mdp5 = double(ones(5)); %maska dp uśredniająca 5x5
Mdp7 = double(ones(7)); %maska dp uśredniająca 7x7
MGauss = double([1 2 1; 2 4 2; 1 2 1]); %maska dla filtru Gaussa
Mgp3 = double([-1 -1 -1; -1 9 -1; -1 -1 -1]); %maska gp 3x3
Mgp5 = double([0 -1 -1 -1 0; -1 2 -4 2 -1; -1 -4 13 -4 -1; -1 2 -4 2 -1; 0 -1 -1 -1 0]); % maska gp 5x5
MLaplace = double([0 -1 0; -1 4 -1; 0 -1 0]); %maska dla filtru Laplace'a
MPrewitt = double([-1 -1 -1; 0 0 0; 1 1 1]); %maska dla filtru Prewitta
MSobel = double([-1 -2 -1; 0 0 0; 1 2 1]); %maska dla filtru Sobela
MEmboss = double([-1 -1 -1; 0 1 0; 1 1 1]); %maska Emboss
Mdl1 = double([-1 -1 -1; 2 2 2; -1 -1 -1]); %detekcja linii, 1-szy przykład
Mdl2 = double([0 -1 0; 0 1 0; 0 0 0]); %detekcja linii, 2-gi przykład

userInput = {Mdp3, Mdp5, Mdp7, MGauss, Mgp3, Mgp5, MLaplace, MPrewitt, MSobel, MEmboss, Mdl1, Mdl2}; %lista przechowująca wszystkie maski potrzebne dla filtracji splotowej
userInputFM = {Mdp3, Mdp5, Mdp7}; %lista przechowująca wszystkie maski potrzebne dla filtracji medianowej

wybierzFiltracje = 'Wybierz filtrację:\n1) Splotowa,\n2) Medianowa.\n> ';
wfiltr = input(wybierzFiltracje);

% ---- Filtracja Splotowa ----
if wfiltr == 1
    userChoice = '\nWybierz sposób traktowania krawędzi:\n1) Przepisanie wierszy i kolumn do obrazu wynikowego,\n2) Powiększenie obrazu oryginalnego.\n> ';
    choice = input(userChoice); %zmienna determinująca wybór sposobu traktowania krawędzi
    imFS = filtracjaSplotowa(im1,userInput,choice); %przypisanie rezultatu funkcji do zmiennej oraz wywołanie funkcji
    
    imshow(im1);
    title('Obraz bazowy');
    pause(0.5);
    figure;

    imshow(imFS);
    title('Obraz wynikowy');
end

% ---- Filtracja Medianowa ----
if wfiltr == 2
    imFM = filtracjaMedianowa(im2,userInputFM);
    
    imshow(im2);
    title('Obraz bazowy');
    pause(0.5);
    figure;
    
    imshow(imFM);
    title('Obraz wynikowy');
end