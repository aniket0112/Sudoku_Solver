function[count]=CheckForEmptyBox(ANSWER)
count=0;
for x3=1:9
    for y3=1:9
        if(ANSWER(x3,y3)=='0')
            count=count+1;
        end
    end
end
end