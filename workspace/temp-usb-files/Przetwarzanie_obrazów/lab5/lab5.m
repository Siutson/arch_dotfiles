im = imread('PictureBW.bmp');
imshow(im);
title('obraz bazowy');
pause(0.5);
figure;

% filtry dp
m3 = ones(3,3);
m5 = ones(5,5);
m7 = ones(7,7);

x = 0.05; %change var value to: 0.1, 0.15, 0.20, 0.25 for diff % of noise
imN = imnoise(im, 'salt & pepper', x);
imFS = filtrSpl(imN,m3); %change m3 var to m5/m7 for diff mask
imFM = filtrMed(imN,m3); %change m3 var to m5/m7 for diff mask
xW = x*100;
subplot(1, 3, 1),imshow(imN);
title("wynik dla " + xW + "% pikseli zaszumionych |"); % ex1
subplot(1, 3, 2),imshow(imFS);
title("| obraz po zastosowaniu filtracji splotowej"); % ex2
subplot(1, 3, 3),imshow(imFM);
title("| obraz po zastosowaniu filtracji medianowej"); % ex2

% doklepać tu póżniej filtracje medianową ważoną, bo nie chce mi się teraz