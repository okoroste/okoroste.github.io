/*Map of USA: Plotting West Nile Virus Cases in US 
by State, 1999-2020*/
proc import out=cases 
datafile="./WestNileVirusCasesSAS.csv"
dbms=csv replace;
run;

title "West Nile Virus Cases by State, 1999-2020";
title2 "Choropleth Map";
proc gmap data=cases map=maps.us; 
id state;
choro total;
run;
quit;

/*Plotting West Nile Virus Cases in US by State in 2005, 
2010, 2015, and 2020*/
proc gmap data=cases map=maps.us all; 
id state;
choro Y2005 Y2010 Y2015 Y2020/name="graph";
run;
quit;

title "West Nile Virus Cases in US";
proc greplay igout=work.gseg tc=sashelp.templt template=l2r2 nofs;
treplay 1:graph 2:graph2 3:graph1 4:graph3;
run;

/*Map of CA: Plotting Percent of Adult Population 
Diagnosed with Diabetes in California by County*/
proc import out=diabetes 
datafile="./CA_Diabetes_by_CountySAS.csv"
dbms=csv replace;
 
title "Percent Adults with Diabetes"; 
title2 "in California by County";
proc gproject out=CA data=maps.counties;
id county;
where state eq 6;
run;

proc gmap data=diabetes map=CA;
id county;
choro percent;
run;
quit;

/*Map of Africa: Plotting Malaria 
Cases in 2017 by Country in Africa*/
proc import out=malaria 
datafile="./AfricaMalariaCases.csv"
dbms=csv replace;

title "Malaria Cases by Country";
title2 "Africa, 2017" ;
proc gmap data=malaria map=maps.world all;
id id;
choro Ncases;
run;
quit;

/*plotting the map of Africa only*/
proc gmap data=malaria map=maps.world;
id id;
choro Ncases;
run;
quit;


