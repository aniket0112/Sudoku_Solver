FilterAndOCR;                                           %ImageProcess and fix bugs maunally
SettingOutputMatrix;                                    %Set a Matrix to be fed to SudokuSolver
ANSWER=OUT; %ANSWER is answer matrix while OUT is question matrix
clearvars -except ANSWER;
[minimumarray,all_elements_possible]=MoreAccurateSpace(ANSWER);             %Function finds all coordinates where least no. of elements can exist 
[x,ANSWER]= SolveSudoku(ANSWER,minimumarray,all_elements_possible);
while x~=1
[x,ANSWER]= SolveSudoku(ANSWER,minimumarray,all_elements_possible);
end
ANSWER