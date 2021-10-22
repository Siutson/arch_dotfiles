clc, clear
imG = imread('PictureBW.bmp');
[row,col] = size(imG);
tablica = {128,64,32,16,8};
zerowanko = double(tablica{3}); %rezultat wykonywanych operacji jest ściśle uzależniony od wartości pobieranej z tablicy (1-5)
result = zeros(row,col);

for i = 1:row
   for j = 1:col
        imGtoBIN = imG(i,j);
        result(i,j) = bitand(imGtoBIN, zerowanko);
   end
end

result = uint8(result);
imshow(result);