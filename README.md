Sudoku Solver
-------------
A  Sudoku solving program that uses MATLAB to take input of Sudoku maze from an image file.
The repository has all user-defined functions used by author for the process. 

Why was this made?
------------------
This project was made with the aims of learning some basics of image processing and harness the environment of MATLAB. In present times, Image Processing and Character/Object recognition is going to be a necessity sooner or later. Incorporating Image Processing to various daily appliance might make world a smarter and better place.

How can this be used? 
---------------------
•The project can solve a 9x9 Sudoku in 3 seconds including the image-processing time. Backtracking proves to be a great algorithm which is used in the Sudoku solving section of program.
•Instead of Sudoku solving, the project might be used to carry out several calculations on paper with some minor changes; saving the time of daily work of feeding it to the computer.
•A small step towards taking inputting device to next generation.

How to use?
-----------------
Software needed :
MATLAB (any version, no use of “helper functions”  hence compatible with previous versions than 2014 also). 

Steps :
1.	Clone the repository to your local.
2.	Put an image of a Sudoku puzzle in the folder where you clone it. Remember the name of image. Try to take a picture which is clearer and contains as minimum other objects other than the Sudoku puzzle as possible. For examples I have put a few sample images in the repository.
3.	Open MATLAB and type cd and path to your directory of repository or else you can browse from the Current Folder pane on the left (by default).
4.	Open BackTrackAlgo.m.
5.	A script file will be opened. In that file, put cursor on FilterAndOCRUpdated and right-click and select “Open”.
6.	Another script file wil be opened. At the very top of the script file, check for “Read Image” comment. Type your image file name in the line >
image=imread(‘filename.extension’);
7.	Save this. Go back to BackTrackAlgo.m and hit Run.
8.	Wait for a few seconds and you will be prompted with an image having boxes of ROI for OCR(Character Recognition of characters within the box). Make sure no box has intersection with a part of digit of other box or else the resulting matrix will be faulty. To customise a misplaced box, type in the number of box in the command window and you will be prompted with a menu to move it. When satisfied, click GO.
9.	Your ANSWER will be displayed in less than 5 seconds in the command window.

P.S. Work is in progress; will keep incorporating updates to the repository.


