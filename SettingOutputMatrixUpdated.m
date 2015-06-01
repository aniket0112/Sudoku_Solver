%This script arranges all OCR(Optical Character Recognize) cells into an
%array and outputs as OUT. 
for i=1:81
    a=isempty(ocrtext(i).Words);
    if(a==1)
        word(i)={'0'};
    else
        if ocrtext(i).WordConfidences>0.5
            word(i)=ocrtext(i).Words;
        else
            word(i)={'x'};
        end
    end
end
wordMatrix=cell2mat(word);
o=1;
for i=1:9
    for j=1:9
        OUT(i,j)=wordMatrix(o);
        o=o+1;
    end
end

%corrections
%OUT(8,1)='5';