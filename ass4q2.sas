/* Hello if you manage to find this repository by yourself congratulations, 
if Alex did not link you to this repository and you intended to copy this assignment
Alex will hunt you down and hurt you! */

data supplier;
    infile 'supply.dat';
    length Supplier_ID $5 Supplier_Name $30 Country $2;
    input;
    Supplier_ID = scan(_INFILE_, 1, ' ');
    Country = scan(_INFILE_, -1);
    Supplier_Name = substr(_INFILE_, 
                           length(Supplier_ID)+2, 
                           length(_INFILE_)-length(Country)-length(Supplier_ID)
                           -2);
run;

proc print data=supplier split='*' noobs;
    title 'Get lost Leung';
    var Supplier_ID Supplier_Name Country;
    label Supplier_ID = 'Supplier_*ID';
run;
