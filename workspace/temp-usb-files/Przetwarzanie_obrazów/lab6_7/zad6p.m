clear all, close all;
zdjonkto = imread('PictureBW.bmp');
[rows, cols] = size(zdjonkto);
redukcja = 8;
% 256 2^8  8bit
% 128 2^7  7bit
%  64 2^6  6bit
%  32 2^5  5bit
%  16 2^4  4bit
%   8 2^3  3bit
%   4 2^2  2bit
%   2 2^1  1bit
odjonkto = ceil(256/(redukcja));
new_img = ceil(zdjonkto./odjonkto)*odjonkto;
imwrite(new_img,'obrazek.png');
imfinfo('obrazek.png')