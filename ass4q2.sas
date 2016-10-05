/* Hello if you manage to find this repository by yourself congratulations, if Alex did not link you to this repository and you intend to copy Alex will hunt you down and hurt you! */

libname orion 'C:\Users\Alex\Documents\math2871';

data supplier;
    infile 'supply.dat';
    input;
    Supplier_ID = scan(_INFILE_, 1, ' ');
    Country = scan(_INFILE_, -1);
    Supplier_Name = substr(_INFILE_, length(Supplier_ID)+2, length(_INFILE_)-length(Country)-1);
run;

proc print data=supplier split='*' noobs;
    var Supplier_ID Supplier_Name Country;
    label Supplier_ID = 'Supplier_*ID';
run;

