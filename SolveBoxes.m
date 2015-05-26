%This function does actual solving of SUDOKU
function[ANSWER,nextcandidate,changecoordinates]=SolveBoxes(minimumarray,ANSWER)
s3=size(minimumarray);
     for i=1:s3(1)   
        min_array=FindMinArray(minimumarray(i,1),minimumarray(i,2));    %Finds which smaller 3x3 array where element (x,y) belongs
        elements=CollectElements(min_array,ANSWER);                     %extract that 3x3array
        possible_elements=PossibleValues(elements,minimumarray(i,1),minimumarray(i,2),ANSWER);%finds XOR of all elements in row,column and 3x3 array with 1-9 characters
        ANSWER(minimumarray(i,1),minimumarray(i,2))=possible_elements(1,1);%replace coordinate on ANSWER with singleton element
        if numel(possible_elements)>1   %if possible elements were more than 1
            nextcandidate=possible_elements(1,2);   %store next element for further swapping if required
            changecoordinates=[minimumarray(i,1) minimumarray(i,2)]; %store coordinates of supposition change
            return
        end
     end   
end
