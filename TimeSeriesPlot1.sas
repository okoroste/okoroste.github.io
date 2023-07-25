proc import out=diabetes3 datafile="C:/Users/000110888/OneDrive - CSULB/Desktop/diabetes_data3.csv"
dbms=csv replace;

title 'Diabetes Cases (in millions) in U.S. by Year';
proc sgplot data=diabetes3;
series x=year y=diagnosed/ legendlabel='diagnosed' markers 
 markerattrs=(color=blue symbol=circlefilled) lineattrs=(color=blue pattern=solid);
  series x=year y=undiagnosed/ legendlabel='undiagnosed' markers 
    markerattrs=(color=black symbol=circle) lineattrs=(color=black pattern=solid);
     series x=year y=total/ legendlabel='total' markers 
      markerattrs=(color=red symbol=diamond) lineattrs=(color=red pattern=solid);
 xaxis label='Year' type=discrete grid;
   yaxis label='Number of Cases (in millions)' grid values=(0 to 35 by 1);
run;

