%Input of image and Image Processing for efficient character extraction.
FilterAndOCRUpdated;
global ANSWEROUT;

%Arranging answer of OCR in a matrix
SettingOutputMatrixUpdated;                                    
ANSWER=OUT;
clearvars -except ANSWER ANSWEROUT;

%Find Solution for SUDOKU
[minimumarray,all_elements_possible]=MoreAccurateSpace(ANSWER);
if(SolveSudoku(ANSWER,minimumarray,all_elements_possible)==1)
ANSWEROUT
end