%This Function follows Backtracking algorithm to solve the SUDOKU. The
%function is recurred till it gives flag 1 i.e. SUDOKU is solved.
function [flag]=SolveSudoku(ANSWER,minimumarray,all_possible_elements)

%For storing the solved ANSWER matrix a global variable is defined.
global ANSWEROUT;                                                 
flag2=0;                                            

%This function gives a flag 1 in case there are empty boxes in the SUDOKU.
if CheckForEmptyBox(ANSWER)==0                      
    flag=1;
    ANSWEROUT=ANSWER;
    return
end

s3=size(minimumarray);
        for i=1:s3(1)
            
            %This function checks for SUDOKU's consistency and returns 1 if
            %found inconsistent or any empty box has zero possible element.
            if CheckForSUDOKUconsistency(ANSWER,all_possible_elements)==0 
                
                %If this flag is 1 then it means we have looped back from a
                %backtrack correction and hence we should avoid the steps
                %of finding elements for new box (because i increases) and 
                %find new elements for the same box.
                if flag2==1
                    [minimumarray1,all_possible_elements1]=MoreAccurateSpace(ANSWER);
                else
                    
                    %To find the elements possible in a particular empty box.
                    min_array=FindMinArray(minimumarray(i,1),minimumarray(i,2));    
                    elements=CollectElements(min_array,ANSWER);                     
                    possible_elements=PossibleValues(elements,minimumarray(i,1),minimumarray(i,2),ANSWER);
                    
                    %Amendment in ANSWER as per the possible elements. If
                    %possible_element contains 2 candidates, first is used
                    %and stored to swappingtemp variable for future use to
                    %backtrack and correct.
                    ANSWER(minimumarray(i,1),minimumarray(i,2))=possible_elements(1,1);
                    swappingtemp=possible_elements(1,1);                            
                    
                    %Find new values of minimumarray and
                    %all_possible_elements after amending ANSWER matrix.
                    [minimumarray1,all_possible_elements1]=MoreAccurateSpace(ANSWER);
                end
                
                %Recursion of SolveSudoku.
                if(SolveSudoku(ANSWER,minimumarray1,all_possible_elements1)==1)
                    flag=1;              
                    return
                end
                
                %When flag returned is not 1, a supposition from 2
                %candidates was wrong previously. Backtracking starts.
                
                %To ignore steps where possible_elements had single
                %possible element and jump to previous step.
                s2=size(possible_elements); 
                if s2(2)==1
                    flag=2;                 
                    return
                else
                    
                    %When a step is reached having two possible_element,
                    %the new possible_elements is found by "XOR" of
                    %swappingtemp with possible_elements.
                    possible_elements=setxor(swappingtemp,possible_elements);
                    
                    %When number of elements in possible_elements after XOR
                    %is 0, it means we have already backtracked here
                    %earlier and thus, supposition is wrong at a higher
                    %hierarchy of recursion. Skip this step and backtrack
                    %further
                    if numel(possible_elements)==0
                        flag=2;                                                
                        return
                    end
                    
                    %If number of elements is not 0, we amend the position
                    %of first amendment with next possible element and
                    %raise flag2 to 1, showing we have done a backtrack
                    %change.
                    ANSWER(minimumarray(i,1),minimumarray(i,2))=possible_elements;
                    flag2=1;                                                      
                end
                
            end
        
        %Loops back.    
        end
    flag=0;
    return
end