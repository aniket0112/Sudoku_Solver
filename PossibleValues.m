function[possvalues]=PossibleValues(array,x,y,OUT)
j=1;
for i=1:9
    if(array(i)~='0')
    values(j)=array(i);
    j=j+1;
    end
end
j=j-1;
k=1;
for i=1:9
    if(OUT(x,i)~='0')
    values(j+k)=OUT(x,i);
    k=k+1;
    end
end
k=k-1;
l1=1;
for i=1:9
    if(OUT(i,y)~='0')
    values(j+k+l1)=OUT(i,y);
    j=j+1;
    end
end
valuessorted=unique(sort(values));
set=['1','2','3','4','5','6','7','8','9'];
possvalues=setxor(valuessorted,set);
end
