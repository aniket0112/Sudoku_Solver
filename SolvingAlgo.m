FilterAndOCR;                                           %ImageProcess and fix bugs maunally
SettingOutputMatrix;                                    %Set a Matrix to be fed to SudokuSolver
ANSWER=OUT;                                             %ANSWER is answer matrix while OUT is question matrix
count=CheckForEmptyBox(ANSWER);
while count ~= 0
    count=0;
    i5=1;
    k=1;
    minimumarray=MoreAccurateSpace(ANSWER);             %Function finds all coordinates where least no. of elements can exist
    if minimumarray(1,3)==1                             %minimumarray[row col no.of_possible_elements] 
    ANSWER=SolveBoxes(minimumarray,ANSWER);             %Solves boxes with 1 element possibilty
    else
        %minimumarray=MoreAccurateSpaceIfNot1(ANSWER);  
        %ANSWER=SolveBoxes(minimumarray,ANSWER);
    break;
    end
    count=CheckForEmptyBox(ANSWER);                     %counts number of empty boxes
end