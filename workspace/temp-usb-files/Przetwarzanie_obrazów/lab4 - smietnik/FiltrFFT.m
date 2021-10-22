clear all;

%Wczytanie danych wejœciowych:

obr=double(imread('PictureBW.bmp'));  % Czytanie obrazu

obrF=fft2(obr);     %Trafo FFT dla ca³ego obrazu

obrFshift=fftshift(obrF);   %Przesuniêcie czêstotliwoœci (pulsacji)ZERO 
                            %do œrodka uk³adu wspó³rzêdnych
[wier, kol]=size(obrFshift);
%-------------Definicja filtru np. Dp, Gp itd.----------------------------------
K=2.5;              %"Czêstotliwoœæ" graniczna (K>2)
Hdp(1:wier, 1:kol)=0;
Hdp(ceil(wier/K):wier-ceil(wier/K),ceil(kol/K):kol-ceil(kol/K))=1;  %Charakterystyka
imshow(Hdp);figure;                                                          %amplitudowa filtru DP - "kostka"
Hgp=1-Hdp;  %Charakterystyka amplitudowa filtru GP - "kostka"
%-------------------Filtracja--------------------------------------------
Y=obrFshift.*Hdp;
%-------------------------------------------------------------------------
YFIshift=ifftshift(Y);    %Odtworzenie pierwotnej organizacji FFT

WY=abs(ifft2(YFIshift));   %Modu³ odwrotnej trafo FFT

WY1=255*mat2gray(WY);       %Normalizacja
WY1=uint8(abs(WY1));

imshow(WY1)