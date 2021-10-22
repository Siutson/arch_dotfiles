array = [0 1 2 3];

wyn = repelem(array, array)

%%

% Create a logical image of a circle with specified
% diameter, center, and image size.
% First create the image.
imageSizeX = 201;
imageSizeY = 201;
[columnsInImage, rowsInImage] = meshgrid(1:imageSizeX, 1:imageSizeY);
% Next create the circle in the image.
centerX = 1; % Wherever you want.
centerY = 1;
radius = 100;
circlePixels = (rowsInImage - centerY).^2 ...
    + (columnsInImage - centerX).^2 <= radius.^2;
% circlePixels is a 2D "logical" array.
imshow(circlePixels);
%%
im = imread('kwiatek.bmp');
R = im(:,:,1); 
G = im(:,:,2); 
B = im(:,:,3);

histR = imhist(R);
histG = imhist(G);
histB = imhist(B);

f = @(x) sum(~x(:));
zR = f(histR)
zG = f(histG)
zB = f(histB)
%%
histogram(R);
title('Red');
figure;

histogram(G);
title('Green');
figure;

histogram(B);
title('Blue');

%%


im = imread('BIGBIRD.bmp');
[row,col] = size(im);
dp3 = ones(3,3);
imFS = filtracjaSplotowa(im,dp3);

newIM = zeros(row-2,col-2);
newIMFS = zeros(row-2,col-2);

imshow(im);
title('Obraz bazowy');
pause(0.5);figure;
imshow(imFS);
title('Obraz wynikowy');

[k,l] = deal(0,0);
for i = 2:row-1
    k=k+1;
    for j = 2:col-1
        l=l+1;
        newIM(k,l) = im(i,j);
    end
    l=0;
end

[x,y] = deal(0,0);
for i = 2:row-1
    x=x+1;
    for j = 2:col-1
        y=y+1;
        newIMFS(x,y) = imFS(i,j);
    end
    y=0;
end

figure;
imshow(newIM);
title('Obraz bazowy');
pause(0.5);figure;
imshow(newIMFS);
title('Obraz wynikowy');

MIN = min(min(newIMFS));
MAX = max(max(newIMFS));
imFM = uint8(255 .* ((newIMFS-MIN) / (MAX-MIN)));

MIN = min(min(newIM));
MAX = max(max(newIM));
imFM = uint8(255 .* ((newIM-MIN) / (MAX-MIN)));

wyn = immse(newIM,newIMFS);

%%
im = imread('PictureBW.bmp');

[x,y] = size(im); 
[a,b] = deal(x/2,y/2); %współrzędne środka okręgu
imWyn = zeros(x,y);
for i = 1:x
    for j = 1:y
        R = sqrt(pow());
    end
end
