proc import out=cancer_data 
datafile="C:/Users/000110888/Desktop/skin_cancer_data.csv"
dbms=csv replace;

/*fitting Poisson model with random slope and intercept*/
 proc glimmix method=Laplace;
 class group(ref="Tx") gender(ref="F");
  model nnewcancers = group age gender nprevcancers 
           year / solution dist=poisson link=log;
   random intercept / subject=ptID type=un;
    covtest/wald;
run;

/*using the fitted model for prediction*/
data predict;
input ptID group$ age gender$ nprevcancers year;
cards;
111111 Tx 57 F 8 3
;

data cancer_data;
set cancer_data predict;
run;

proc glimmix method=Laplace;
 class group gender;
  model nnewcancers = group age gender nprevcancers 
           year / dist=poisson link=log;
   random intercept / subject=ptID type=un;
     output out=outdata pred(ilink)=pred_nnewcancers;
run;

proc print data=outdata (firstobs=325) noobs;
var pred_nnewcancers;
run;
