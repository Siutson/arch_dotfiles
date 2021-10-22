clear all;

%Wczytanie danych wejœciowych:

obr=double(imread('PictureBW.bmp'));  % Czytanie obrazu

obrF=fft2(obr);     %Trafo FFT dla ca³ego obrazu

obrFshift=fftshift(obrF);   %Przesuniêcie czêstotliwoœci (pulsacji)ZERO 
                            %do œrodka uk³adu wspó³rzêdnych

obrFIshift=ifftshift(obrFshift);    %Odtworzenie pierwotnej organizacji FFT

WY=ifft2(obrFIshift);   %Odwrotna trafo FFT

WY=uint8(abs(WY));

imshow(log(abs(obrF)),[]), colormap(jet), colorbar    %Wykres trafo FFT obrazu
figure;
imshow(log(abs(obrFshift)),[]), colormap(jet), colorbar   %Wykres przesuniêtego trafo FFT obrazu
figure
imshow(WY)          %Obraz po FFT i IFFT
