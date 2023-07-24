proc import out=cancer_data 
datafile="./skin_cancer_data.csv" dbms=csv replace;

/*specifying data for prediction*/
data point4pred;
input group$ gender$ age nprevcancers year;
cards;
Tx F 57 8 3
;

/*fitting nonparametric Poisson model*/
proc gam data=cancer_data;
class group(ref="Tx") gender(ref="F");
model nnewcancers = param(group gender) loess(age)
loess(nprevcancers) loess(year) /link=log dist=poisson;
ods output OutputStatistics=results;
 score data=point4pred out=predicted;
run;

proc print data=predicted noobs;
run;



