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
keep id gender age month stress LDL;
run;

/*plotting histogram with fitted normal density*/
proc univariate;
 var LDL;
  histogram LDL/normal;
run;

/*fitting random slope and intercept model*/
proc mixed data=longform covtest;
class gender(ref="M");
  model LDL=gender age stress month/solution;
   random intercept month/subject=id type=un;
run;

/*using fitted model for prediction*/
data prediction;
input id gender$ age stress month;
cards;
42 F 60 25 3
;

data longform;
 set longform prediction;
run;

proc mixed;
class gender;
model LDL=gender age stress month/outpm=outdata;
random intercept month/subject=id type=un;
run;

proc print data=outdata (firstobs=165) noobs;
var Pred;
run;

