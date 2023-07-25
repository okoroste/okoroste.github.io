proc import out=diabetes2 datafile="./diabetes_data2.csv" dbms=csv replace;
run;

title 'Histogram for Percent of Adults with Diagnosed Diabetes in California Counties';
proc sgplot data=diabetes2;
 histogram percent/ scale=count binstart=6 binwidth=2
  showbins fillattrs=(color=dodgerblue);
   xaxis display=(nolabel);
run;

