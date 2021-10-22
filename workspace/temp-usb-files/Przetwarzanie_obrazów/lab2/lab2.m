%% [zad 1 ]

clear all

im = imread('PictureBW.bmp');
imshow(im);
pause(0.5);
figure;

l1 = length(im);

black_bg = zeros(3*l1);
black_bg = uint8(black_bg);
l2 = length(black_bg);

%imshow(black_bg);

%iter_end = l2 - l1 - 1;
[x,y] = deal(512,512);

for i = 1 : 512;
    y=512;    
    for j = 1 : 512;
        black_bg(x,y) = im(i,j);
        y = y + 1;
    end
    x = x + 1;    
end

imshow(black_bg);

%% [zad 2] - przesuniecie o wektor [35 -20]

im = imread('PictureBW.bmp');
im2 = imread('PictureBW.bmp');
imshow(im);
pause(0.5);
figure;

l1 = length(im);

black_bg = zeros(3*l1);
black_bg = uint8(black_bg);

black_bg2 = zeros(3*l1);
black_bg2 = uint8(black_bg);
l2 = length(black_bg);

%imshow(black_bg);
[a,b] = deal(512,512);
for i = 1 : 512;
    b=512;    
    for j = 1 : 512;
        black_bg2(a,b) = im2(i,j);
        b = b + 1;
    end
    a = a + 1;    
end
imshow(black_bg2);
title('obraz wynikowy z zadania 1');
pause(0.5);
figure;

%iter_end = l2 - l1 - 1;
[x,y] = deal(547,498);

for i = 1 : 512;
    y=498;    
    for j = 1 : 512;
        black_bg(x,y) = im(i,j);
        y = y + 1;
    end
    x = x + 1;    
end

imshow(black_bg);
title('obraz po przesunieciu o wektor [35 -20]');

%% [zad 3]

clear all

inputI = imread('PictureBW.bmp'); %wczytanie obrazu
l1 = length(inputI);
[r,c] = size(inputI);
scale = [1.28 0.86]; %wspolczynniki skalowania x i y

for i=1:scale(1)*r
    for j=1:scale(2)*c

        ii = round( (i-1)*(r-1)/(scale(1)*r-1)+1 );
        jj = round( (j-1)*(c-1)/(scale(2)*c-1)+1 );

        outputI(i,j) = inputI(ii,jj); %tworzenie przeskalowanego obrazu
    end
end

imshow(inputI);
title('obraz bazowy');
pause(0.5);
figure;

imshow(outputI);
title('obraz przeskalowany');
pause(0.5);
figure;

black_bg = zeros(3*l1);
black_bg = uint8(black_bg);

[x,y] = deal(440,548);

%wklejenie przeskalowanego obrazu do czarnego canvasu 1536x1536
for i = 1 : 655;
    y=548;    
    for j = 1 : 440;
        black_bg(x,y) = outputI(i,j);
        y = y + 1;
    end
    x = x + 1;    
end

imshow(black_bg);
title('obraz wynikowy');

%% [zad 4] - jest źle

im2 = rotateAround(imread('PictureBW.bmp'), 1, 1, -20);

imshow(im2);
title('obraz po obrocie');
pause(0.5);
figure

im = imread('PictureBW.bmp');
l1 = length(im);

black_bg = zeros(3*l1);
black_bg = uint8(black_bg);

[x,y] = deal(512,512);
for i = 1 : 512;
    y=512;
    for j = 1 : 512;
        black_bg(x,y) = im2(i,j);
        y = y + 1;
    end
    x = x + 1;
end

imshow(black_bg);
title('obraz wynikowy');
pause(0.5);

%%
clear all

im = imread('PictureBW.bmp');
imshow(im);
pause(0.5);
figure;

l1 = length(im);

black_bg = zeros(3*l1);
black_bg = uint8(black_bg);
l2 = length(black_bg);
im2 = imrotate(im,340);

imshow(im2);
title('obraz po obrocie');
pause(0.5);
figure;

%imshow(black_bg);

[x,y] = deal(439,439);

for i = 1 : 657;
    y=439;
    for j = 1 : 657;
        black_bg(x,y) = im2(i,j);
        y = y + 1;
    end
    x = x + 1;
end

imshow(black_bg);

%% [zad 5]

clear all

im = imread('PictureBW.bmp');
imshow(im);
title('obraz bazowy');
pause(0.5);
figure;

l1 = length(im);

black_bg = zeros(3*l1);
black_bg = uint8(black_bg);
l2 = length(black_bg);
im2 = imrotate(im,12);

imshow(im2);
title('obraz po obrocie');
pause(0.5);
figure;

%imshow(black_bg);

[x,y] = deal(464,464);

for i = 1 : 608;
    y=464;
    for j = 1 : 608;
        black_bg(x,y) = im2(i,j);
        y = y + 1;
    end
    x = x + 1;
end

imshow(black_bg);
title('obraz wynikowy');


%% [zad 6] 

