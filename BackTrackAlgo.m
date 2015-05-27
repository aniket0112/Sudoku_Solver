FilterAndOCR;                                           %ImageProcess and fix bugs maunally
global ANSWEROUT;
SettingOutputMatrix;                                    %Set a Matrix to be fed to SudokuSolver
ANSWER=OUT; %ANSWER is answer matrix while OUT is question matrix
clearvars -except ANSWER ANSWEROUT;
%set(0,'RecursionLimit',N)
[minimumarray,all_elements_possible]=MoreAccurateSpace(ANSWER);             %Function finds all coordinates where least no. of elements can exist 
if(SolveSudoku(ANSWER,minimumarray,all_elements_possible)==1)
ANSWEROUT
end