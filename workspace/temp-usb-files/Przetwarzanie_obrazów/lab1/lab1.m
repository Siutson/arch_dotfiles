%% [zad1 - wczytanie obrazów]

clear all
image1 = 'PictureColor.bmp';
image2 = 'PictureBW.bmp';
A = imread(image1);
B = imread(image2);

imshow(A);
title('kolor');
pause(0.5);
figure;

imshow(B);
title('odcienie szarości');

%% [zad 2 - rotacja obrazu]

clear all
image1 = 'PictureColor.bmp';
%image2 = 'PictureBW.bmp';
A = imread(image1);
%B = imread(image2);

Z = imrotate(A, 90);
X = imrotate(A, 180);
C = imrotate(A, 270);

imshow(Z);
title('rotacja o 90 stopni');
pause(0.5);
figure;

imshow(X);
title('rotacja o 180 stopni');
pause(0.5);
figure;

imshow(C);
title('rotacja o 270 stopni');

%% [zad 3 - odbicia lustrzane]

clear all
image1 = 'PictureColor.bmp';
%image2 = 'PictureBW.bmp';
A = imread(image1);
%B = imread(image2);

flipVertically = flip(A,1);
flipHorizontally = flip(A, 2);

imshow(A);
title('obraz podstawowy');
pause(0.5);
figure;

imshow(flipVertically);
title('obrot w pionie');
pause(0.5);
figure;

imshow(flipHorizontally);
title('obrot w poziomie');

%% [zad 4 - negatywy obrazów]

clear all
image1 = 'PictureColor.bmp';
image2 = 'PictureBW.bmp';
A = imread(image1);
B = imread(image2);

X1 = 255 - A;
X2 = 255 - B;

imshow(X1);
title('negatyw obrazu kolorowego');
pause(0.5);
figure;

imshow(X2);
title('negatyw obrazu w skali szarości');

%% [zad 5 - operacje logiczne: OR, XOR, AND]

clear all
x_keep = 191;
y_keep = 200;
image1 = 'DuckBIN.bmp';
image2 = 'bbbBIN.bmp';

X = imread(image1);
X = double(X);
X = X(1:x_keep, 1:y_keep);

%imshow(X);
%figure

B = imread(image2);
B = double(B);
B = B(1:x_keep, 1:y_keep);

%imshow(B);

% ----- AND ----- %
bitand_result = bitand(X, B);
imshow(bitand_result);
title('AND');
pause(0.5);
figure;

% ----- OR ----- %
bitor_result = bitor(B, X);
imshow(bitor_result);
title('OR');
pause(0.5);
figure;

% ----- XOR ----- %
bitxor_result = bitxor(X, B);
imshow(bitxor_result);
title('XOR');

%% [zad 6 - odcienie szarości, operacje: dodawania, odejmowania, mnożenia]

clear all
im1 = imread('PictureBW.bmp');
im2 = imread('PictureBW01.bmp');

% ----- Dodawanie ----- %
matrix_sum = imadd(im1, im2);
imshow(matrix_sum);
title('suma');
pause(0.5);
figure;

% ----- Odejmowanie ----- %
matrix_sub = imsubtract(im1, im2);
imshow(matrix_sub);
title('odejmowanie');
pause(0.5);
figure;

% ----- Mnożenie ----- %
matrix_mltplcn = immultiply(im1, im2);
imshow(matrix_mltplcn);
title('mnożenie');
pause(0.5);
figure;

% ----- NORMALIZACJE: ----- %

% ----- 1) Dodawania ----- %
sum_max = max(max(matrix_sum));
sum_min = min(min(matrix_sum));

n_sum = 255 * ((matrix_sum - sum_min) / (sum_max - sum_min));

%imshow(n_sum);
%title('normalizacja sumy');
%pause(0.5);
%figure;
nsum = imadjust(matrix_sum, stretchlim(matrix_sum));
imshow(nsum);
title('normalizacja sumy');
pause(0.5);
figure;

% ----- 2) Odejmowania: ----- %
sub_max = max(max(matrix_sub));
sub_min = min(min(matrix_sub));

n_sub = 255 * ((matrix_sub - sub_min) / (sub_max - sub_min));

imshow(n_sub);
title('normalizacja odejmowania');
pause(0.5);


%% [zad 7 - efekt mnożenia obrazu przez samego siebie]

im = imread('PictureColor.bmp');
im_mltplcn = immultiply(im, im);

imshow(im_mltplcn);
title('wynik mnozenia obrazu przez samego siebie');
pause(0.5);
figure;

%nmltpl = imadjust(im_mltplcn, stretchlim(im_mltplcn));
n_mltpl = 255 * ((im_mltplcn - min(min(im_mltplcn))) ./ (max(max(im_mltplcn)) - min(min(im_mltplcn))));
imshow(n_mltpl);
title('normalizacja');

%% [zad 8 - zad 6 dla obrazów kolorowych]

clear all
im1 = imread('PictureColor.bmp');
im2 = imread('PictureColor01.bmp');

% ----- Dodawanie ----- %
matrix_sum = imadd(im1, im2);
imshow(matrix_sum);
title('suma');
pause(0.5);
figure;

% ----- Odejmowanie ----- %
matrix_sub = imsubtract(im1, im2);
imshow(matrix_sub);
title('odejmowanie');
pause(0.5);
figure;

% ----- Mnożenie ----- %
matrix_mltplcn = immultiply(im1, im2);
imshow(matrix_mltplcn);
title('mnożenie');