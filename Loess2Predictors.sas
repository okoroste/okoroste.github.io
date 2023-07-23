proc import out=ldldata datafile="./LDLdata.csv"
dbms=csv replace;

/*creating long-form data*/
data longform;
 set ldldata;
   array m[4] (0 6 9 24);
    array s[4] stress0 stress6 stress9 stress24;
  array c[4] LDL0 LDL6 LDL9 LDL24;
       do i=1 to 4;
	  month=m[i];
	   stress=s[i];
        LDL=c[i]; 
     output;
    end;
keep id month stress LDL;
run;

/*fitting loess regression and 
plotting fitted loess surface*/
proc means data=longform min max;
var stress month;
run;

data grid_points;  
    do stress=9 to 36;
       do month=0 to 24;
           output;
       end;
    end;
run;

proc loess data=longform;
 model LDL=stress month;  */degree=2;
  ods output scoreresults=score_results;
    score data=grid_points; 
run;

proc print data=score_results;
run;

proc g3d data=score_results;
plot stress*month=p_LDL;
run;

/*prediction*/
data point4pred;
   input stress month;
cards;
15 3
;

proc loess data=longform;
 model LDL=stress month;
  ods output ScoreResults=predicted;
     score data=point4pred;
run;

proc print data=predicted noobs;
var p_LDL;
run;
