%Input of image and Image Processing for efficient character extraction.
FilterAndOCR;
global ANSWEROUT;

%Arranging answer of OCR in a matrix
SettingOutputMatrix;                                    
ANSWER=OUT;
clearvars -except ANSWER ANSWEROUT;

%Find Solution for SUDOKU
[minimumarray,all_elements_possible]=MoreAccurateSpace(ANSWER);
if(SolveSudoku(ANSWER,minimumarray,all_elements_possible)==1)
ANSWEROUT
end