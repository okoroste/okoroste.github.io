proc import out=hypertension datafile="./hypertension_data.csv"
dbms=csv replace;
run;

/*PROC CALIS=Covariance Analysis and Linear Structural Equations*/
proc calis plots=pathdiagram;
lineqs
anxiety = b1 income + e1,
stress = b2 income + e2,
sleep = b3 anxiety + b4 stress + e3,
BMI = b5 anxiety + b6 stress + b7 sleep + e4,
SBP = b8 sleep + b9 BMI + e5;
run;
