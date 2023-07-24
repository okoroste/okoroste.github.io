proc import out=resp_data datafile="./respiratory_infection.csv" 
dbms=csv replace;

/*creating longform dataset*/
data longform;
set resp_data;
 array x[4] xerophthalmia1-xerophthalmia4;
 array i[4] infection1-infection4;
  do visit=1 to 4;
   xerophthalmia=x[visit];
     infection=i[visit];
   output;
   end;
keep gender age BMI xerophthalmia visit infection;
run;

/*specifying data for prediction*/
data point4pred;
input gender$ visit age BMI ;
cards;
M 2 10 15.6
;

/*fitting nonparametric logistic model*/
proc gam data=longform; *gam=generalized additive model;
class gender(ref="M");
 model infection(event='1')= param(gender visit)
loess(age) loess(BMI)/link=logist dist=binomial;
	  score data=point4pred out=predicted;
	 run;

proc print data=predicted noobs;
run;



