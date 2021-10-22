function fFFT = filtracjaFFT(im)
    %im = imread('PictureBW.bmp');
    imF=fft2(im); %transformata fft
    imFshift = fftshift(imF);
    
    [rows, cols] = size(imF);
    usrInput = 'Wybierz filtr:\n1) DP,\n2) GP,\n3) PP.\n> ';
    x = input(usrInput);
    
    N = rows;
    R = ceil(N/10); %mozna zmienic wartosc dzielnika liczby N, np. z 10 na 20
    R2 = ceil(N/5);
    M = zeros(N);
    ii = ceil(N/2);
    M(ii,ii) = 1;
    
    dp = double(bwdist(M) <= R); %filtr dolnoprzepustowy
    gp=1-dp; %filtr górnoprzepustowy
    pp = double(xor(bwdist(M) <= R, bwdist(M) <= R2)); %filtr pasmowoprzepustowy

    % w zaleznosci od wyboru uzytkownika jeden z ponizszych if'ów się wykona
    % (żądany filtr zostanie użyty)
    if x == 1
        Y=imFshift.*dp;
        %imshow(dp);
        %title('dp');
        %figure;
    end
  
    if x == 2
        Y=imFshift.*gp;
        %imshow(gp);
        %title('gp');
        %figure;
    end
    
    if x == 3
        Y=imFshift.*pp;
        %imshow(pp);
        %title('pp');
        %figure;
    end
    
    YFIshift=ifftshift(Y);
    imFFT=abs(ifft2(YFIshift));

    fFFT=255*mat2gray(imFFT); % Normalizacja
    fFFT=uint8(abs(fFFT));
    imshow(fFFT);
    
    imshow(log(abs(imF)),[]), colormap(jet), colorbar; %Wykres transformaty FFT obrazu
    title('obraz transformaty FFT bez przesuniecia widma'); pause(0.5); figure;
    imshow(log(abs(imFshift)),[]), colormap(jet), colorbar;
    title('obraz transformaty FFT z przesunieciem widma'); pause(0.5); figure;
    
end