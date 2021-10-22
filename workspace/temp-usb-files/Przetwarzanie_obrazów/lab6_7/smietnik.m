arr = zeros(3,3);
len = length(arr);

%% clear all
im=imread('A04.bmp');
imbin = imnoise(double(im),'salt & pepper',0.05);

w1= [0 0 0;0 -1 0;0 0 0];
w2= [0 0 0;-1 -1 -1;0 0 0];
[w k]=size(imbin);
for i=2:1:w-1
 for j=2:1:k-1
 imbin1(i,j)=w1(1)*imbin(i-1,j-1)+w1(2)*imbin(i-1,j)+w1(3)*imbin(i-1,j+1)+w1(4)*imbin(i,j-1)+w1(5)*imbin(i,j)+w1(6)*imbin(i,j+1)+w1(7)*imbin(i+1,j-1)+w1(8)*imbin(i+1,j)+w1(9)*imbin(i+1,j+1);
 imbin2(i,j)=w2(1)*imbin(i-1,j-1)+w2(2)*imbin(i-1,j)+w2(3)*imbin(i-1,j+1)+w2(4)*imbin(i,j-1)+w2(5)*imbin(i,j)+w2(6)*imbin(i,j+1)+w2(7)*imbin(i+1,j-1)+w2(8)*imbin(i+1,j)+w2(9)*imbin(i+1,j+1);
 end
end
edge=imbin1+imbin2;
figure('Name','Oryginał','NumberTitle','off');
imshow(imbin);
figure('Name','x','NumberTitle','off');
imshow(imbin1);
figure('Name','Detekcja Krawedzi','NumberTitle','off');
imshow(edge);

%%
% niby 9 a jednak nie

clc,clear all,close all

a=imread('A20.bmp');
subplot(1,2,1);imshow(a);
title('Obraz wejściowy');

w1= [-1 -1 -1;0 0 0;1 1 1];
w2= [-1 0 1;-1 0 1;-1 0 1];
[row col]=size(a);
for x=2:1:row-1
     for y=2:1:col-1
         a1(x,y)=w1(1)*a(x-1,y-1)+w1(2)*a(x-1,y)+w1(3)*...
         a(x-1,y+1)+w1(4)*a(x,y-1)+w1(5)*a(x,y)+w1(6)*...
         a(x,y+1)+w1(7)*a(x+1,y-1)+w1(8)*a(x+1,y)+w1(9)*...
         a(x+1,y+1);
         a2(x,y)=w2(1)*a(x-1,y-1)+w2(2)*a(x-1,y)+w2(3)*...
         a(x-1,y+1)+w2(4)*a(x,y-1)+w2(5)*a(x,y)+w2(6)*...
         a(x,y+1)+w2(7)*a(x+1,y-1)+w2(8)*a(x+1,y)+w2(9)*...
         a(x+1,y+1);
     end
end
% subplot(2,2,2);
% imshow(a1);
% title('Edge Detection in y direction');
% subplot(2,2,3);
% imshow(a2);
% title('Edge Detection in x direction'); 
output=a1+a2;
% subplot(2,2,4);
subplot(1,2,2);imshow(output);
title('Detekcja Krawędzi');