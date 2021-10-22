clc, clear
imG = imread('PictureBW.bmp'); % obraz w skali szarości  
level = graythresh(imG); 
BW = imbinarize(imG,level); 
imshowpair(imG,BW,'montage')

L = adapthisteq(imG);
figure;imshow(L);
% code below


imG = imread('PictureBW.bmp'); % obraz w skali szarości
B = histeq(imG);
imhist(B);
figure,imshow(C);title('wyr.histogr.');

J = adapthisteq(imG);
imhist(J);
figure, imshow(D);title('histogr. po clahe');


imshowpair(B,J,'montage');

level = graythresh(B);
BW = imbinarize(B,level);

level = graythresh(J);
BW2 = imbinarize(J,level);
imshowpair(BW,BW2,'montage');
%%
clc, clear
imG = imread('PictureBW.bmp');

imH = histeq(imG);
subplot(1,2,1), imhist(imH),title("Wyrownany histogram");
subplot(1,2,2), imshow(imH),title("Efekt po wyrownaniu histogramu");
figure;

imA = adapthisteq(imG);
subplot(1,2,1), imhist(imA),title("Histogram po clahe"); % na subplocie histogram jest bardzo ściśnięty
subplot(1,2,2), imshow(imA), title("Obraz po clahe");
figure;

subplot(1,2,1), imshow(imH);
subplot(1,2,2), imshow(imA);
sgtitle('Porównanie histogramów');
figure;

level = graythresh(imH); % binaryzacja przed clahe
imB = imbinarize(imH,level);
level = graythresh(imA); % binaryzacja po clahe
imB2 = imbinarize(imA,level);

subplot(1,2,1), imshow(imB);
subplot(1,2,2), imshow(imB2);
sgtitle('Porównanie binaryzacji przed i po clahe');
