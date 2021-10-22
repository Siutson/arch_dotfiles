im = imread('A04.bmp');
im_sp = imnoise(double(im), 'salt & pepper', 0.005);

subplot(1,2,1);imshow(im_sp);title('Obraz bazowy');
res = zad10funkcja(im_sp);

subplot(1,2,2);imshow(res);title('Obraz wynikowy');