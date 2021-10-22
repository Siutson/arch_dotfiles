clear all;

%Wczytanie danych wej�ciowych:

obr=double(imread('PictureBW.bmp'));  % Czytanie obrazu

obrF=fft2(obr);     %Trafo FFT dla ca�ego obrazu

obrFshift=fftshift(obrF);   %Przesuni�cie cz�stotliwo�ci (pulsacji)ZERO 
                            %do �rodka uk�adu wsp�rz�dnych
[wier, kol]=size(obrFshift);
%-------------Definicja filtru np. Dp, Gp itd.----------------------------------
K=2.5;              %"Cz�stotliwo��" graniczna (K>2)
Hdp(1:wier, 1:kol)=0;
Hdp(ceil(wier/K):wier-ceil(wier/K),ceil(kol/K):kol-ceil(kol/K))=1;  %Charakterystyka
imshow(Hdp);figure;                                                          %amplitudowa filtru DP - "kostka"
Hgp=1-Hdp;  %Charakterystyka amplitudowa filtru GP - "kostka"
%-------------------Filtracja--------------------------------------------
Y=obrFshift.*Hdp;
%-------------------------------------------------------------------------
YFIshift=ifftshift(Y);    %Odtworzenie pierwotnej organizacji FFT

WY=abs(ifft2(YFIshift));   %Modu� odwrotnej trafo FFT

WY1=255*mat2gray(WY);       %Normalizacja
WY1=uint8(abs(WY1));

imshow(WY1)