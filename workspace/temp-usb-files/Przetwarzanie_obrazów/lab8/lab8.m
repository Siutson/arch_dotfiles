clc, clear all

cam = webcam; % wlaczenie kamerki, przypisanie jej do obiektu

faceDetector = vision.CascadeObjectDetector('FrontalFaceCART');
eyeL = vision.CascadeObjectDetector('LeftEye','MergeThreshold',8,'MinSize',[12 18]);
eyeR = vision.CascadeObjectDetector('RightEye','MergeThreshold',8,'MinSize',[12 18]);

cam.Resolution = '320x240'; % zmiana rozdzielczości
cam.Gamma = 0;
cam.Brightness = 25;

videoFrameFace = snapshot(cam); % tworzenie snapshotow i zapisywanie do zmiennej
frameSize = size(videoFrameFace);
videoPlayer = vision.VideoPlayer('Position',[100 100 fliplr(frameSize(1:2)+30)]);

g = 0;
v = VideoWriter('video.avi'); % stworzenie zmiennej do zapisywania video
v.FrameRate = 15; % ustawienie frame rate'u na 15, defaultowa wartosc to 30
open(v); % otwarcie pliku video

while true
     videoFrameFace = snapshot(cam);
     videoFrameEye = rgb2gray(videoFrameFace); % konwersja na skale szarosci w celu lepszego wykrywania oczu oraz twarzy
     
     % wykrycie twarzy oraz oczu
     bbox = step(faceDetector,videoFrameFace);
     bboxL = step(eyeL,videoFrameEye);
     bboxR = step(eyeR,videoFrameEye);
     
     % oko prawe
     xR = bboxR(1,1)+10;
     yR = bboxR(1,2)+10;
     
     % oko lewe
     xL = bboxL(1,1)+10;
     yL = bboxL(1,2)+10;
     

     if ~isempty(bbox) && ~isempty(bboxL)
         g = g + 1;
         videoFrameFace = insertObjectAnnotation(videoFrameFace,'rectangle',bbox,'FACE');
         videoFrameR = insertObjectAnnotation(videoFrameEye,'circle',[xR yR 11],'eyeL','LineWidth',5,'Color', 'blue');
         videoFrameL = insertObjectAnnotation(videoFrameEye,'circle',[xL yL 11],'eyeR','LineWidth',5,'Color', 'blue');
     end
     
     videoPlayer.step(uint8(videoFrameFace+videoFrameR+videoFrameL)); % wyswietlenie obrazu przechwyconego z kamerki
     currFrame = uint8(videoFrameFace+videoFrameR+videoFrameL);
     writeVideo(v,currFrame); % zapisanie frame'u do video
     
     if g == 60
         close(v); % zamkniecie pliku video
         clear all % wyczyszczenie wszystkie + wylaczenie kamerki
         break
     end
end