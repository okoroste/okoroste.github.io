/* BAR GRAPH */

/*Percent of diagnosed diabetes by race/ethnicity and gender
among adults aged 18 years or older, United States, 2017–2018.*/
data diabetes1;
input race gender percent @@;
cards;
1 1 14.5 1 0 14.8 2 1 10.0 2 0 8.5  3 1 11.4 3 0 12.0
4 1 13.7 4 0 11.6  5 1 8.6  5 0 6.6
;

proc format;
value racefmt 1='American Indian/AK Native'
               2='Asian, Non-Hispanic'
			   3='Black, Non-Hisipanic'
			   4='Hispanic'
			   5='White, Non-Hispanic'
			   ;
value genderfmt 1='Male' 0='Female';
run;

title 'Grouped Bar Graph for Prevalence of Diagnosed Diabetes 
by Race and Gender';
proc sgplot data=diabetes1; *SG=Statistical Graphics;
 styleattrs datacolors=(purple blue);
  vbar race /response=percent group=gender groupdisplay=cluster;
    format race racefmt. gender genderfmt.;
     xaxis label=' ';
      yaxis label='Percent';
run;

/* HISTOGRAM */

/*Percentage of adults aged 20 and above with diagnosed diabetes in 2017 
by county in California.*/
data diabetes2;
length county $15;
input county $ percent @@;
cards;
Alameda         7   Alpine          7   Amador          17
Butte           10  Calaveras       11  Colusa          16
Contra_Costa    9   Del_Norte       17  El_Dorado       8
Fresno          10  Glenn           11  Humboldt        10
Imperial        9   Inyo            12  Kern            10
Kings           13  Lake            11  Lassen          15
Los_Angeles     9   Madera          12  Marin           8
Mariposa        8   Mendocino       11  Merced          13
Modoc           12  Mono            11  Monterey        9
Napa            10  Nevada          6   Orange          9
Placer          7   Plumas          7   Riverside       10
Sacramento      9   San_Benito      10  San_Bernardino  10
San_Diego       8   San_Francisco   6   San_Joaquin     10
San_Luis_Obispo 9   San_Mateo       8   Santa_Barbara   8
Santa_Clara     9   Santa_Cruz      6   Shasta          12
Sierra          7   Siskiyou        10  Solano          9
Sonoma          8   Stanislaus      10  Sutter          13
Tehama          11  Trinity         10  Tulare          11
Tuolumne        8   Ventura         9   Yolo            8
Yuba            13
;

title 'Histogram of Percent Adults with Diagnosed Diabetes';
proc sgplot data=diabetes2;
 histogram percent/ scale=count binstart=6 binwidth=2
  showbins fillattrs=(color=blue);
   xaxis display=(nolabel);
run;

/* TIME SERIES PLOT WITH YEARS*/

/*Number of diagnosed, undiagnosed, and total cases of diabetes (in millions) 
in U.S. between 1999 and 2018.*/

data diabetes3;
input year diagnosed undiagnosed total @@;
cards;
1999 6.4  3.1 9.5   2001 7.1 3.2 10.3  2003 7.4  2.8 10.2
2005 7.7  2.9 10.6  2007 7.9 3.2 11.1  2009 8.1  3.2 11.3
2011 8.7  2.7 11.5  2013 9.4 2.6 12.0  2015 10.2 2.8 13.0
2018 26.8 7.3 34.1
;

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


/* TIME SERIES PLOT WITH DATES*/

proc import out=pollution datafile="C:/Users/000110888/Desktop/pollution.csv"
dbms=csv replace;

title 'PM10 vs. PM2.5 (in micro grams/cubic meter) in Mexico City ';
proc sgplot data=pollution;
series x=date y=PM10/ legendlabel='PM10' markers 
 markerattrs=(color=red symbol=circle) lineattrs=(color=red pattern=solid);
  series x=date y=PM2_5/ legendlabel='PM2.5' markers 
    markerattrs=(color=black symbol=circle) lineattrs=(color=black pattern=solid);
 xaxis label='Date' values=('1jan20'd to '1jun20'd by month) grid;
   yaxis label='Particulate matter' grid;
run;

