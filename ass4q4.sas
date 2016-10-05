/* Hello if you manage to find this repository by yourself congratulations, 
if Alex did not link you to this repository and you intended to copy this assignment
Alex will hunt you down and hurt you! */

libname orion 'C:\Users\Alex\Documents\math2871';

data fsp;
    set orion.orders_midyear;
    Months_Ordered = 0;
    Total_Order_Amount = 0;
    do monthAmount=Month1, Month2, Month3, Month4, Month5, Month6;
        if monthAmount then do;
            Months_Ordered = Months_Ordered + 1;
            Total_Order_Amount = Total_Order_Amount + monthAmount;
        end;
    end;
    if Months_Ordered >= 3 and Total_Order_Amount > 1000;
    keep Customer_ID Total_Order_Amount Months_Ordered;
run;

proc print data=fsp noobs;
run;
