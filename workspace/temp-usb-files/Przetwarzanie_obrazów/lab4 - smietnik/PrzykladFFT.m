clear all;

%Wczytanie danych wej�ciowych:

obr=double(imread('PictureBW.bmp'));  % Czytanie obrazu

obrF=fft2(obr);     %Trafo FFT dla ca�ego obrazu

obrFshift=fftshift(obrF);   %Przesuni�cie cz�stotliwo�ci (pulsacji)ZERO 
                            %do �rodka uk�adu wsp�rz�dnych

obrFIshift=ifftshift(obrFshift);    %Odtworzenie pierwotnej organizacji FFT

WY=ifft2(obrFIshift);   %Odwrotna trafo FFT

WY=uint8(abs(WY));

imshow(log(abs(obrF)),[]), colormap(jet), colorbar    %Wykres trafo FFT obrazu
figure;
imshow(log(abs(obrFshift)),[]), colormap(jet), colorbar   %Wykres przesuni�tego trafo FFT obrazu
figure
imshow(WY)          %Obraz po FFT i IFFT
