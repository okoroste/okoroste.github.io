proc import out=resp_data datafile="C:/Users/000110888/Desktop/
respiratory_infection.csv" dbms=csv replace;

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
keep medID gender age BMI xerophthalmia infection visit;
run;

/*fitting random intercept logistic regression model*/
proc glimmix method=Laplace;
 class gender(ref="M") xerophthalmia(ref="0");
  model infection = gender age BMI xerophthalmia visit / 
solution dist=binomial link=logit;
  random intercept/ subject=medID;
  covtest/wald;
run;

/*using fitted model for prediction*/
data predict;
input medID gender$ age BMI xerophthalmia visit;
cards;
999999 M 10 15.6 1 2
;

data longform;
set longform predict;
run;

proc glimmix method=Laplace;
 class gender xerophthalmia;
  model infection = gender age BMI xerophthalmia 
     visit / dist=binomial link=logit;
	     random intercept/ subject=medID;
   output out=outdata pred(ilink)=pred_pinfection;
run;

proc print data=outdata(firstobs=197) noobs;
 var pred_pinfection;
run;
