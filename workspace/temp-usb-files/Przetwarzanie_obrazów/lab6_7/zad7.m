clear,clc

im = imread('lew.jpeg');

Red = im(:,:,1); %5 bitow
Green = im(:,:,2); %7 bitow
Blue = im(:,:,3); %4 bity

[row,col] = size(Red);
tablica = {248,254,240};

resRed = zeros(row,col);
resGreen = zeros(row,col);
resBlue = zeros(row,col);

for i = 1:row
   for j = 1:col
        andForRed = Red(i,j);
        andForGreen = Green(i,j);
        andForBlue = Blue(i,j);

        resRed(i,j) = bitand(andForRed, tablica{1});
        resGreen(i,j) = bitand(andForGreen, tablica{2});
        resBlue(i,j) = bitand(andForBlue, tablica{3});
   end
end

allTogether = cat(3, resRed, resGreen, resBlue);
allTogether = uint8(allTogether);

subplot(1,2,1),imshow(im),title('Obraz bazowy');
subplot(1,2,2),imshow(allTogether),title('Obraz wynikowy');