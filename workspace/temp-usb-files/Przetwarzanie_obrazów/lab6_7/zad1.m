imC = imread('PictureColor.bmp'); % kolorowy obraz
imG = imread('PictureBW.bmp'); % obraz w skali szarości

Red = imC(:,:,1);
Green = imC(:,:,2);
Blue = imC(:,:,3);

[yRed, x] = imhist(Red);
[yGreen, x] = imhist(Green);
[yBlue, x] = imhist(Blue);
[yGray, xGray] = imhist(imG);

subplot(1,2,1),imshow(imC);title('Wczytany obraz w kolorze');
subplot(1,2,2),imshow(imG);title('Wczytany obraz w odcieniach szarości');
figure;

subplot(2,2,1), plot(x, yRed, 'Red')
title('kanał czerwony')

subplot(2,2,2), plot(x, yGreen, 'Green')
title('kanał zielony')

subplot(2,2,3), plot(x, yBlue, 'Blue')
title('kanał niebieski')

subplot(2,2,4), plot(xGray, yGray, 'Black')
title('skala szarości')