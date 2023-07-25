proc import ougt=diabetes1 datafile="./diabetes_data1.csv" dbms=csv replace;
run;

title 'Side-by-side Bar Graph for Prevalence of Diagnosed Diabetes 
by Race and Gender';
proc sgplot data=diabetes1; *SG=Statistical Graphics;
 styleattrs datacolors=(purple blue);
  vbar race /response=percent group=gender groupdisplay=cluster;
     xaxis label=' ';
      yaxis label='Percent';
run;

title 'Grouped Bar Graph for Prevalence of Diagnosed Diabetes 
by Gender and Race';
proc sgplot data=diabetes1; 
 styleattrs datacolors=(blue purple lightgreen dodgerblue skyblue);
  vbar gender /response=percent group=race groupdisplay=cluster;
     xaxis label=' ';
      yaxis label='Percent';
run;

title 'Stacked Bar Graph for Prevalence of Diagnosed Diabetes 
by Race and Gender';
proc sgplot data=diabetes1;
 styleattrs datacolors=(purple blue);
  vbar race /response=percent group=gender groupdisplay=stack;
     xaxis label=' ';
      yaxis label='Percent';
run;

title 'Stacked Bar Graph for Prevalence of Diagnosed Diabetes 
by Gender and Race';
proc sgplot data=diabetes1; 
 styleattrs datacolors=(blue purple lightgreen dodgerblue skyblue);
  vbar gender /response=percent group=race groupdisplay=stack;
     xaxis label=' ';
      yaxis label='Percent';
run;
