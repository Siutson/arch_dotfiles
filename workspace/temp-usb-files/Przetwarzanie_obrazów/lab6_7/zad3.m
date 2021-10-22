clc, clear
imC = imread('PictureColor.bmp'); % kolorowy obraz
imG = imread('PictureBW.bmp'); % obraz w skali szarości

imBW = im2bw(imC, 0.2);
imBW2 = im2bw(imC, 0.4);
imBW3 = im2bw(imC, 0.6);
%BW = imbinarize(imG,'adaptive', 'Sensitivity',0.7);

subplot(1,3,1),imshow(imBW);title('prog 0.2');
subplot(1,3,2),imshow(imBW2);title('prog 0.4');
subplot(1,3,3),imshow(imBW3);title('prog 0.6');