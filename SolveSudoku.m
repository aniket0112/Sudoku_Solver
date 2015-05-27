function [flag,ANSWER]=SolveSudoku(ANSWER,minimumarray,all_possible_elements)%minimumarray contains coordinates with lease possible candidates 
                                                    %all_possible_elements has all empty coordinates and possible candidates size
flag2=0;                                            %Flag2 to notify that a swap has been done in this function earlier
if CheckForEmptyBox(ANSWER)==0                      %if flag is 1 loop ends and answer is displayed
    flag=1;
    ANSWER=ANSWER;
    return
end
s3=size(minimumarray);
        for i=1:s3(1)
            if CheckForSUDOKUconsistency(ANSWER,all_possible_elements)==0  %true
            if flag2==1
                [minimumarray1,all_possible_elements1]=MoreAccurateSpace(ANSWER);%If it was already swapped from previous assigned value then no need to check for next coordinate
            else            
            min_array=FindMinArray(minimumarray(i,1),minimumarray(i,2));    %Finds which smaller 3x3 array where element (x,y) belongs
            elements=CollectElements(min_array,ANSWER);                     %extract that 3x3array
            possible_elements=PossibleValues(elements,minimumarray(i,1),minimumarray(i,2),ANSWER);%finds XOR of all elements in row,column and 3x3 array with 1-9 characters
            ANSWER(minimumarray(i,1),minimumarray(i,2))=possible_elements(1,1);%amend ANSWER array with possible element or supposed possible element
            swappingtemp=possible_elements(1,1);                            %temporary variable
            [minimumarray1,all_possible_elements1]=MoreAccurateSpace(ANSWER);%calculate all parameters calculated above for recursion
            end
            if(SolveSudoku(ANSWER,minimumarray1,all_possible_elements1)==1)
                [flag,ANSWER]=SolveSudoku(ANSWER,minimumarray1,all_possible_elements1);              %if recursion ends in flag=1 then return 1
                return
            end
            s2=size(possible_elements);                                     %if recursion does not give 1 return then check if stepped out function had two elements or one
                if s2(2)==1
                flag=2;                                                     %if one then no swapping possible, simply back trace further till a two possible element arrives
                return
            else
            possible_elements=setxor(swappingtemp,possible_elements);       %xor of swapppingtemp with possible_elements gives element not put in that box
            if numel(possible_elements)==0                                  %in case a swap was performed earlier xor output will have no elements
                flag=2;                                                     %back trace further
                return
            end
            ANSWER(minimumarray(i,1),minimumarray(i,2))=possible_elements;  %change or swap element
            flag2=1;                                                        %flag a change
            end
         end
        end
    flag=0;
    return
end