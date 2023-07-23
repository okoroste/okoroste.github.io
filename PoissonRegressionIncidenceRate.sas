proc import out=thrombosis_data datafile="./thrombosis_data.csv"
dbms=csv replace;

proc genmod;
class gender(ref="F") NYHA(ref="I");
   model AT/duration=age gender NYHA/dist=poisson link=log;
run;

/*using fitted model for prediction*/
data prediction;
input age gender$ NYHA$;
cards;
65 M II
;

data thrombosis_data;
 set thrombosis_data prediction;
run;

proc genmod;
class gender NYHA;
   model AT/duration=age gender NYHA/dist=poisson link=log;
 output out=outdata p=pred_IR;
run;

data outdata;
 set outdata;
  pred_AT=10000*pred_IR;
run;

proc print data=outdata (firstobs=31) noobs;
var pred_AT;
run;
