im = imread('A04.bmp');

%erozja
erozja = erozjaLubDylatacja(im,1,0);

%dylatacja
dylatacja = erozjaLubDylatacja(im,0,1);

%otwarcie: erozja + dylatacja
otwarcie = erozjaLubDylatacja(erozja,0,1);

%zamknięcie: dylatacja + erozja
zamkniecie = erozjaLubDylatacja(dylatacja,1,0);

%Funkcje wbudowane
dylatacjaFunWbud = bwmorph(im, 'dilate');
erozjaFunWbud = bwmorph(im, 'erode');
otwarcieFunWbud = bwmorph(im, 'open');
zamkniecieFunWbud = bwmorph(im, 'close');

%Porownanie funkcji

subplot(2,4,1), imshow(erozja)
title('erozja f wlasna')

subplot(2,4,2), imshow(erozjaFunWbud)
title('erozja f wbudowana')

subplot(2,4,3), imshow(dylatacja)
title('dylatacja f wlasna')

subplot(2,4,4), imshow(dylatacjaFunWbud)
title('dylatacja f wbudowana')

subplot(2,4,5), imshow(otwarcie)
title('otwarcie f wlasna')

subplot(2,4,6), imshow(otwarcieFunWbud)
title('otwarcie f wbudowana')

subplot(2,4,7), imshow(zamkniecie)
title('zamkniecie f wlasna')

subplot(2,4,8), imshow(zamkniecieFunWbud)
title('zamkniecie f wbudowana')