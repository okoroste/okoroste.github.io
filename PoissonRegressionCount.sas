proc import out=hospital_stay datafile="./hospital_stay.csv"
dbms=csv replace;

proc genmod;
class gender(ref="F") illness(ref="no");
   model days=gender age illness/dist=poisson link=log;
run;

/*using fitted model for prediction*/
data prediction;
input gender$ age illness$;
cards;
M 55 no
;

data hospital_stay;
 set hospital_stay prediction;
run;

proc genmod;
class gender illness;
model days=gender age illness/dist=poisson link=log;
 output out=outdata p=pred_days;
run;

proc print data=outdata(firstobs=46) noobs;
var pred_days;
run;
