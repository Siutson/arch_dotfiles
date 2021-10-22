imC = imread('PictureColor.bmp'); % kolorowy obraz
imG = imread('PictureBW.bmp'); % obraz w skali szarości

histogram(imC,'Normalization','cdf'),title('histogram kumulacyjny obrazu w kolorze');figure;
histogram(imG,'Normalization','cdf'),title('histogram kumulacyjny obrazu w odcieniach szarosci');