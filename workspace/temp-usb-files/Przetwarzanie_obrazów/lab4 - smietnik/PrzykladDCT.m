clear all;

%Wczytanie danych wej�ciowych:

obr=double(imread('PictureBW.bmp'));  % Czytanie obrazu

obrD=dct2(obr);     %Trafo DCT dla ca�ego obrazu


WY=idct2(obrD);   %Odwrotna trafo DCT

WY=uint8(abs(WY));

imshow(log(abs(obrD)),[]), colormap(jet), colorbar    %Wykres trafo DCT obrazu

figure
imshow(WY)          %Obraz po DCT i IDCT
