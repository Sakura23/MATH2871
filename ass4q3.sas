/* Hello if you manage to find this repository by yourself congratulations, if Alex did not link you to this repository and you intend to copy Alex will hunt you down and hurt you! */

libname orion 'C:\Users\Alex\Documents\math2871';

proc sort data=orion.Monthdonation out=sortedMonthdonation;
    by Employee_ID;
run;

data final;
    set sortedMonthdonation;
    by Employee_ID;
    array qtrs{4} Qtr1-Qtr4 (4*.);
    array accts{4} $ Account1-Account4 (4*' ');
    if first.Employee_ID then
        do i = 1 to 4;
            qtrs{i}=.;
            accts{i}=' ';
        end;
    if qtr then do;
        qtrs{qtr}=amount;
        accts{qtr}=acct_code;
    end;
    if last.Employee_ID;
run;

proc print data=final noobs;
    var Employee_ID Qtr1-Qtr4 Account1-Account4;
run;
