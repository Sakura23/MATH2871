data marks1a;
   input name $ ID;
   input a1 $ a1m1 a1m2 a1m3 a1m4;
   input a2 $ a2m1 a2m2 a2m3 a2m4;
   a1mark=sum(a1m1, a1m2, a1m3, a1m4);
   a2mark=sum(a2m1, a2m2, a2m3, a2m4);
   keep name ID a1mark a2mark;
	datalines;
Mary 215
a1 7 10 5 9
a2 5 4 2 3
peter 242
a1 6 2 10 7
a2 5 4 8 3
diego 555
a1 10 9 9 9
a2 7 8 7 8
ricky 365
a1 7 9 4 5
a2 3 9 8 4
;
run;

proc print data=marks1a;
run;

proc sgplot data=marks1a;
   histogram a1mark;
run;

proc sgplot data=marks1a;
   histogram a2mark;
run;

