--- For an ideal I of some polynomial ring R = k[x1..xd] where k has PRIME characteristic p. 
--- Computes the e-th Frobenius power of I, which by definition is the ideal generated
--- by all p^e-th powers of elements of I. This is the same as the ideal generated by
--- the p^e-th powers of generators of I.
--- Input:
---    e - some positive integer
---    I - an ideal of R
---
--- Output:
---    J = I^[p^e] the ideal generated by p^e-th powers of generators of I

fpow = (I, e) -> (
  L:= first entries gens I;
  p = char ring I;

  J:= ideal(L#0^(p^e));
  for i from 1 to (length L)-1 do
  J = J + ideal(L#i^(p^e));
  J
)

------------------------------------------------------------------------------------------------------------------------

--- For a polynomial ring R=k[x1..xd] where k has PRIME characteristic p, and a given polynomial f.
--- Computes the F-signature for a specific value a/p^e
--- Input:
---	e - some positive integer
---	a - some positive integer between 0 and p^e
---	f - some polynomial in a ring of PRIME characteristic
---
--- Output:
---	returns value of the F-signature of the pair (R, f^{a/p^e})

Fsig = (e, a, f) -> (
 R1:=ring f;
 p:= char ring f;   
 I = fpow(ideal(first entries vars R1), e);
     1-(1/p^(dim(R1)*e))*degree(I+ideal(f^a)) 
)

------------------------------------------------------------------------------------------------------------------------

--- For a polynomial ring R = k[x1..xd] where k has PRIME characteristic p, and a  polynomial f in R.
--- Computes the F-signature using the Fsig function for the pair (R, f^{a/p^e}) for all a/p^e between 0 and the F-pure threshold of f, 
--- meaning the function GenPlot stops once Fsig(e, a, f) = 0
--- Writes data in real-number form to a file named "data" and then automatically generates a gnuplot window displaing the data
--- The save file is formatted for display using gnuplot.
--- Input:
---	e    - a positive integer
---	f    - some polynomial from a polynomial ring in PRIME characteristic
---	data - a string; the values of the F-signature are written (in real number form) to a file with this name
--- Output:
---	cL - a list of the values produced by Fsig, stored in rational (Macaulay2) form
---	Fsig(e, a, f) is computed for each a, the value returned printed to the screen
---	The values produced by Fsig are written to a file formatted for display in gnuplot

GenPlot = (e, f, data)->
(
cL = for i from 0 to (char (ring f))^e list
q:= Fsig(e, i, f) do (stdio<<i<<",   "<<q<<endl<<"============="<<endl; if q==0 then break);

fp=toString(data)<<"";
for i from 0 to (length cL)-1 do
fp<<toRR(i/(char (ring f))^e)<<" "<<toRR(cL#i)<<endl;
fp<<close;

fp="plotComm"<<"plot '"<<toString(data)<<"' with lines";
fp<<close;

run "gnuplot -p plotComm";
run "rm plotComm";
)
