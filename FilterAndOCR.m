%first finding sudoku grid and cropping it. but need to filter image to show clear grid

image = imread('sudokuexample.jpg');                                %read imagefile
adjustedimage=imadjust(image,[0.4 0.7],[0.0 1.0]);          %adjusting contrast as per histogram analysis
grayimage=rgb2gray(adjustedimage);                          %convert to gray image
removeborder=imclearborder(grayimage);                      %remove elements beyond border
binarymask=removeborder>50;                                 %convert gray image to a binary mask
binarymask2=imopen(binarymask,strel('disk',5));             %remove noises using morpholgical functions
connComp=bwconncomp(binarymask2);                           %find connected components in image
stats=regionprops(connComp,'Area');                         %store property 'Area' of connect components in stats variable
mask=binarymask2;                                           %make a mask of binarymask2
mask(vertcat(connComp.PixelIdxList{[stats.Area]<3000}))=0;  %remove all connected components pixels whose area < 3000 pixels in stats
[x y]=find(mask);                                           %find all pixels x and y coordinate whose pixel value is 1

%find rectangle of sudoku box to be cropped. so we find (xmin,ymin)

xmin=min(x);                                                %find least x coordinate
xmax=max(x);                                                %find max x coordinate
ymin=min(y);                                                %find least y coordinate
ymax=max(y);                                                %find max y coordinate
crop=imcrop(grayimage,[ymin xmin ymax-ymin xmax-xmin]);     %crop using xmin ymin and length and width of crop area
finalbinary=crop>90;                                        %convert cropped image to binary with required threshold
finalbinary=~finalbinary;                                   %negate the image
finalbinary=imopen(finalbinary,strel('square',3));   %disintegrates grid lines of image captured so area becomes either less or very high.

%final process on finalbinary before applyin ocr
connComp2=bwconncomp(finalbinary);                          %find connected objects and filter out which are not in area range    
stats2=regionprops(connComp2,'Area');
finalbinarymask=finalbinary;
finalbinarymask(vertcat(connComp2.PixelIdxList{[stats2.Area]<825 | [stats2.Area]>2500}))=0;
out=imerode(finalbinarymask,strel('disk',3));               %filter out remaining bug pixels
figure, imshow(out); %final output image

SettingUpAGrid;
ocrtext=ocr(out,roi,'TextLayout','Block','CharacterSet','123456789');  %perform ocr and consider onlu 0-9 for recognition
ocrtext.Text;                                               %display text recognised

