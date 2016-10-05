/* Hello if you manage to find this repository by yourself congratulations, if Alex did not link you to this repository and you intend to copy Alex will hunt you down and hurt you! */

libname orion 'C:\Users\Alex\Documents\math2871';

proc sql;
    create table work.matches as
    select Employee_Name, City, Order_Date
    from orion.order_fact inner join orion.employee_addresses
    on order_fact.Employee_ID = employee_addresses.Employee_ID
    order by Order_Date;
quit;

proc print data=work.matches split='*';
    title 'Matches from the Order and Address Tables';
    label Order_Date = 'Order_*Date';
run;
