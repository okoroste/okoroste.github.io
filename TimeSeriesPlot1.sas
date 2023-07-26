proc import out=diabetes3 datafile="./diabetes_data3.csv" dbms=csv replace;

title 'Diabetes Cases (in millions) in U.S. by Year';
proc sgplot data=diabetes3;
series x=year y=diabetes/ legendlabel='diagnosed' markers 
 markerattrs=(color=blue symbol=circlefilled) lineattrs=(color=blue pattern=solid);
 xaxis label='Year' type=discrete grid;
   yaxis label='Number of Cases (in millions)' grid values=(0 to 30 by 1);
run;

