data work.HiMarLoPer work.LoMarShPer;
   infile 'prices.dat' dlm='*' missover;
   input ProductID StartDate :date9. EndDate :date9. CostPrice :dollar7.2 SalesPrice :dollar7.2;
   if SalesPrice=. then SalesPrice = 2 * CostPrice;
   margin = (SalesPrice - CostPrice)/ SalesPrice;
   period = year(EndDate) - year(StartDate) + 1;
   MinNet = (SalesPrice - CostPrice) * 50 * period;
   if margin > 0.55 and period >= 15 then output work.HiMarLoPer;
   else if margin <= 0.55 and period < 15 then output work.LoMarShPer;
	label StartDate='Start of Date Range'
         ProductID='Product ID'
         MinNet='Minimum Net Income';
   format StartDate DDMMYY10.;
run;

proc sort data=work.HiMarLoPer;
   by StartDate;
run;

proc sort data=work.LoMarShPer;
   by StartDate;
run;

proc print data=work.HiMarLoPer label noobs;
   title 'Sales Report';
   title2 'Product with a high margin in a long sale period';
   var StartDate ProductID MinNet;
run;

proc print data=work.LoMarShPer label noobs;
   title2 'Product with a low margin in a short sale period';
   var StartDate ProductID MinNet;
run;


