clear
%im = imread('sp_img.bmp');
im = imread('PictureBW.bmp');

M1 = [0 1 0; 1 3 1; 0 1 0];
M2 = [1 1 1; 1 3 1; 1 1 1];
M3 = [3 0 1 0 3; 0 3 0 3 0; 1 0 9 0 1; 0 3 0 3 0; 3 0 1 0 3];
listOfMasks = {M1,M2,M3};

zmienna = 'Wybierz żądaną filtrację:\n1) Medianowa ważona,\n2) DCT lub FFT.\n> ';
x = input(zmienna);

if x == 1
    imFMW = filtracjaMedianowaWazona(im,listOfMasks);

    imshow(im);
    title('Obraz bazowy');
    pause(0.5);
    figure;

    imshow(imFMW);
    title('Obraz wynikowy');
end


if x == 2
    fftORdct = 'Wybierz żądaną filtrację:\n1) FFT,\n2) DCT.\n> ';
    choice = input(fftORdct);
    
    if choice == 1
        % filtracja fft
        im = imread('PictureBW.bmp');

        fFFT = filtracjaFFT(im);
        imshow(fFFT);
        title('obraz wynikowy');
    end
    
    if choice == 2
        % filtracja dct
        im = imread('PictureBW.bmp');

        fDCT = filtracjaDCT(im);
        imshow(fDCT);
        title('obraz wynikowy');
    end
end