function[minimumarray,possible_element_array]=MoreAccurateSpace(ANSWER)
i5=1;
count=0;
for x3=1:9                                                          %this loop finds an array of all
    for y3=1:9                                                      %coordinates of empty box and size of possible elements in them
        if(ANSWER(x3,y3)=='0')
        count=count+1;
        end
    end
end
possible_element_array=zeros(count-1,3);
for x3=1:9
    for y3=1:9
        if(ANSWER(x3,y3)=='0')
        min_array=FindMinArray(x3,y3);
        elements=CollectElements(min_array,ANSWER);
        possible_elements=PossibleValues(elements,x3,y3,ANSWER);
        s=size(possible_elements);
        possible_element_array(i5,1)=x3;
        possible_element_array(i5,2)=y3;
        possible_element_array(i5,3)=s(2);
        i5=i5+1;
        end
    end
end
s2=size(possible_element_array);                                    %find minimum size of possible elements
minimum=min(possible_element_array(:,3));
j=1;
clear minimumarray;
count=1;
for i=1:s2(1)
    if (minimum==possible_element_array(i,3))                        %return only minimum size of possible elements with coordinates
    count=count+1;
    end
end
minimumarray=zeros(count-1,3);
for i=1:s2(1)
 if (minimum==possible_element_array(i,3))                        %return only minimum size of possible elements with coordinates
    minimumarray(j,1)=possible_element_array(i,1);
    minimumarray(j,2)=possible_element_array(i,2);
    minimumarray(j,3)=possible_element_array(i,3);
    j=j+1;
 end
end
clearvars -except possible_element_array minimumarray
end