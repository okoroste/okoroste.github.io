proc import out=pollution datafile="./pollution_data.csv" dbms=csv replace;

title 'PM10 vs. PM2.5 (in micro grams/cubic meter) in Mexico City ';
proc sgplot data=pollution;
series x=date y=PM10/ legendlabel='PM10' markers 
 markerattrs=(color=red symbol=circle) lineattrs=(color=red pattern=solid);
  series x=date y=PM2_5/ legendlabel='PM2.5' markers 
    markerattrs=(color=black symbol=circle) lineattrs=(color=black pattern=solid);
 xaxis label='Date' values=('1jan20'd to '1jun20'd by month) grid;
   yaxis label='Particulate matter' grid;
run;

