data marks1b;
   infile datalines dlm=',:' dsd;
   input name $ ID;
   input a1 $ a1m1 a1m2 a1m3 a1m4;
   input a2 $ a2m1 a2m2 a2m3 a2m4;
   a1mark = sum(a1m1,a1m2, a1m3, a1m4);
   a2mark = sum(a2m1, a2m2, a2m3, a2m4);
   keep name ID a1mark a2mark;
   datalines;
Mary,215
a1 :7 ,8 ,9 ,10
a2: 6 ,3 ,4 ,2
peter,242
a1: 7 ,3, 10 ,5
a2: 6, 3 ,7, 4
diego,555
a1: 8 ,9,9 ,9
a2: 7, ,6 ,7
ricky,365
a1 :7, 9 ,4,
a2 :3 ,9 ,8 ,4
;
run;

proc print data=marks1b;
run;
