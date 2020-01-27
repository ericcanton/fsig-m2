# F-signature of hypersurface pairs, computed using Macaulay 2 and graphed using gnuplot. 
The F-signature of a pair was introduced by Blickle, Schwede, and Tucker [2012], as part 
of the larger program of studying Frobenius splittings for pairs introduced by 
Hara-Yoshida [2003] and Hara-Takagi [2004]. F-signature of a pair is a continuous function 
from [0, 1] to [0, 1], and provides a numerical measure of the F-regularity of that pair. 
This software allows one to calculate, and then graph, the F-signature of a pair whose ideal
component is principal (i.e. for divisor pairs). 

To run this software, you must have Macaulay2 installed (it should work on any version 
published after 2011) and should have gnuplot installed if you want the GenPlot function 
to generate a picture. If you do not have or want to use gnuplot, the calculated data is
stored in a plain text file with two columns (x y pairs) and so can be graphed easily
by other software. 
