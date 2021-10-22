clear all;

%Wczytanie danych wejœciowych:

obr=double(imread('PictureBW.bmp'));  % Czytanie obrazu
imshow(uint8(obr));
pause(0.5);
figure;
obrD=dct2(obr);     %Trafo DCT dla ca³ego obrazu

[wier, kol]=size(obrD);

%-------------Definicja filtru np. Dp, Gp itd.----------------------------------
K=1/2;              %"Czêstotliwoœæ" graniczna
Hdp(1:wier, 1:kol)=0;
Hdp(1:ceil(wier*K),1:ceil(kol*K))=1; %Charakterystyka amplitudowa filtru DP - "kostka"

Hgp=1-Hdp;  %Charakterystyka amplitudowa filtru GP - "kostka"
%-------------------Filtracja--------------------------------------------
Y=obrD.*Hgp;
%-------------------------------------------------------------------------

WY=abs(idct2(Y));   %Modu³ odwrotnej trafo DCT

WY1=255*mat2gray(WY);       %Normalizacja
WY1=uint8(abs(WY1));

imshow(WY1)
figure;
imshow(Hgp);title('Hgp');figure;
imshow(Hdp);title('Hdp');
%%
N = wier;
R = ceil(N/2);
M = zeros(N);
ii = ceil(N/2);
M(ii,ii) = 1;
out = double(bwdist(M) <= R); %
imshow(out);
pause(0.5);
figure;
out2=1-out;
imshow(out2);
pause(0.5);
figure;