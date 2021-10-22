Folder = 'C:\Users\siutson\Desktop\ㅤ\Studia\Przetwarzanie_obrazów\lab3';
File = 'sp_img.bmp';
im = imread('PictureBW.bmp');
Img = imnoise(im, 'salt & pepper', 0.1);

imshow(Img);
imwrite(Img, fullfile(Folder, File));