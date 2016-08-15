libname orion 'H:\math2871';

/* Question 1 */
data work.ASS1Q1;
	set orion.agpop;
	where (acres92 between 32000 and 100000 and region='W') or
		  (acres92 < 50000 and region='S');
	keep region county state acres92 farms92;
	label acres92='Number of Acres'
	      farms92='Number of Farms';
run;

/* Question 2 */
proc contents data=work.ASS1Q1;
run;
