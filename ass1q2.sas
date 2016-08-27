libname orion 'H:\math2871';

/* Question 3 */
data work.ASS1Q2;
	set orion.agpop;
	where county like 'BUTT%';
	format farms87 acres87 largef87 smallf87 4.;
run;

/* Question 4 */
proc print data=work.ASS1Q2;
	var county acres87;
run;

/* Question 5 */
proc means data=work.ASS1Q2 min q1 median q3 max;
	var acres92 acres82;
run;

proc sgplot data=work.ASS1Q2;
	vbox acres92;
run; 

proc sgplot data=work.ASS1Q2;
	vbox acres82;
run;
