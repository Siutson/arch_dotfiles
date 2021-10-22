cam = webcam(1);
% im = snapshot(cam);
face = vision.CascadeObjectDetector();
eyes = vision.CascadeObjectDetector('EyePairSmall');

% imshow(im);

while true
    im = snapshot(cam);
    im2 = rgb2gray(im);
    bbox = step(face,im2);
    bbox2 = step(eyes,im2);
    
%     [centers, radius] = imfindcircles(im,[15 30]);
%     twoStrngstCenters = centers(1:2,:);
%     twoStrngstRadius = radius(1:2);
%     viscircles(twoStrngstCenters, twoStrngstRadius,'EdgeColor','b');

%     bboxPoints = bbox2points(bbox2(1, :)); 
%     theta = 10;
%     tform = affine2d([cosd(theta) -sind(theta) 0; sind(theta) cosd(theta) 0; 0 0 1]);
%     points2 = transformPointsForward(tform,bboxPoints);
   
    pic1 = insertObjectAnnotation(im, 'rectangle', bbox, 'Face','Color','magenta');
    pic2 = insertObjectAnnotation(im, 'circle', points2, 'Eyes','Color','blue');
    pic3 = pic1+pic2;
    imshow(uint8(pic3));
end

%%

clear all
web=webcam();
im=snapshot(web);
face=vision.CascadeObjectDetector();
oczy=vision.CascadeObjectDetector('LeftEyeCART');
oczko=vision.CascadeObjectDetector('EyePairBig');
imshow(im);
[x1,x2] = size(im);
Rmin = 3;
Rmax = 8;

while true
    
    im=snapshot(web);
    im2=rgb2gray(im);
    bbox=step(face,im2);
    bbox2=step(oczy,im2);
    bbox3=step(oczko,im2);
    [x,y]=size(bbox);
    
 
[centersBright, radiiBright] = imfindcircles(im2,[Rmin Rmax],'ObjectPolarity','bright');
[centersDark, radiiDark] = imfindcircles(im2,[Rmin Rmax],'ObjectPolarity','dark');
   pic1=insertObjectAnnotation(im,'rectangle',bbox,'Twarz','Color','cyan');
    pic2=insertObjectAnnotation(im,'rectangle',bbox2,'Oczy');
    pic3=insertObjectAnnotation(im,'rectangle',bbox3,'Oczyyy');
    %imshow(uint8((pic1+pic2/2)));
    imshow((pic1));
    viscircles(centersDark, radiiDark,'Color','b');
end

%%