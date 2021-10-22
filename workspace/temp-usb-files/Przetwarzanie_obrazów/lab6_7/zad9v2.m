im = imread('A04.bmp');
erozja = erozjaLubDylatacja(im,0,1);


result = double(erozja) - double(im);
imshow(result);

%%

im = imread('A04.bmp');
res = detekcjaKrawedzi(im,1,0);
imshow(res);