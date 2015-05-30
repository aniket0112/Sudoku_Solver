function [flag]= CheckForROIconsistency(roi,i,row,column)
if roi(i,1)+roi(i,3)>row
    flag=1;
    return
end
if roi(i,2)+roi(i,4)>column
    flag=1;
    return
end
flag=0;
end
