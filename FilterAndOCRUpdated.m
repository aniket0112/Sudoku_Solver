%For using this use SettingOutputMatrixwithStraighteningandCustomiztion.m

%Read Image.
image=imread('sudokuexample4.jpg');
grayimage=rgb2gray(image);
contrastgrayimage=imadjust(grayimage);
removeborder=imclearborder(contrastgrayimage);
binary=removeborder>20;
connComp=bwconncomp(binary);                           
stats=regionprops(connComp,'Area');                         
mask=binary;                                           
mask(vertcat(connComp.PixelIdxList{[stats.Area]<1500}))=0;
straighteningobject=imerode(mask,strel('disk',6));

%Find coordinates of Rectangular region
[y,x]=find(mask);
[~,loc]=min(x+y);
C(1,:)=[x(loc),y(loc)];
[~,loc]=min(x-y);
C(2,:)=[x(loc),y(loc)];
[~,loc]=max(x+y);
C(3,:)=[x(loc),y(loc)];
[~,loc]=max(x-y);
C(4,:)=[x(loc),y(loc)];

%Perform Straightening of image.
U=mean(C([1 2],1),'native');
D=mean(C([3 4],1),'native');
L=mean(C([1 4],2),'native');
R=mean(C([2 3],2),'native');
newcorner=[U L;U R;D R;D L];
t=cp2tform(C,newcorner,'projective');
transform=imtransform(mask,t);

%Find new corners of straightened image.
[y,x]=find(transform);
[~,loc]=min(x+y);
C(1,:)=[x(loc),y(loc)];
[~,loc]=min(x-y);
C(2,:)=[x(loc),y(loc)];
[~,loc]=max(x+y);
C(3,:)=[x(loc),y(loc)];
[~,loc]=max(x-y);
C(4,:)=[x(loc),y(loc)];
transform1=imtransform(grayimage,t);

%Crop the image.
crop=imcrop(transform1,[C(1,1),C(1,2),C(2,2)-C(1,2),C(4,1)-C(1,1)]);
binarycrop=~(imsharpen(imadjust(crop))>124);

%Filter all connected components based on properties and their values.
connectedComponents=bwconncomp(binarycrop);
stats=regionprops(connectedComponents,'Eccentricity','Area','MajorAxisLength');
mask=binarycrop;
masker=imdilate(mask,strel('disk',2));
masker(vertcat(connectedComponents.PixelIdxList{[stats.Eccentricity]<0.6 |[stats.Area]<400| [stats.Area]>3000 | [stats.MajorAxisLength]>10000}))=0;
masker=imerode(masker,strel('disk',2));
masker1=imerode(masker,strel('disk',1));
SettingUpAGridUpdated;

%Collect [x y] coordinates of ROI.
xy=roi(:,[1 2]);
flag=0;

%Show Image alongwith all ROI plotted with the ROI number labelled on it.
out=insertShape(crop,'rectangle',roi,'LineWidth',2);
for j=1:81
out = insertText(out,xy(j,:),j,'AnchorPoint','Center');
end
imshow(out);
i=input('Enter roi to be formatted');

%Do adjustment of ROI using switch-case and check if ROI is within
%boundaries.
if i~=0
    while(flag==0)
        flag2=menu('Choose adjustment if wanted and Show to preview else hit GO','Up','Down','Left','Right','Another','Show','GO');
        switch flag2
            case 1
                temp=roi(i,2);
                roi(i,2)=roi(i,2)-5;
                if CheckForROIconsistency(roi,i,row,column)==0
                    continue;
                else
                    roi(i,2)=temp;
                    disp('Exceeds limits.');
                end
            case 2
                temp=roi(i,2);
                roi(i,2)=roi(i,2)+5;
                if CheckForROIconsistency(roi,i,row,column)==0
                    continue;
                else
                    roi(i,2)=temp;
                    disp('Exceeds limits.');
                end
            case 3
                temp=roi(i,1);
                roi(i,1)=roi(i,1)-5;
                if CheckForROIconsistency(roi,i,row,column)==0
                    continue;
                else
                    roi(i,1)=temp;
                    disp('Exceeds limits.');
                end
            case 4
                temp=roi(i,1);
                roi(i,1)=roi(i,1)+5;
                if CheckForROIconsistency(roi,i,row,column)==0
                    continue;
                else
                    roi(i,1)=temp;
                    disp('Exceeds limits.');
                end
            case 5
                i=input('Enter roi to be formatted');
                continue;
            case 6
                out=insertShape(crop,'rectangle',roi,'LineWidth',2);
                for j=1:81
                out = insertText(out,xy(j,:),j,'AnchorPoint','Center');
                end
                imshow(out);
                continue;
            case 7
                flag=1;
        end        
    end
end

%Do OCR when satisfied with grid and store it.
ocrtext=ocr(masker1,roi,'TextLayout','Block','CharacterSet','123456789');
