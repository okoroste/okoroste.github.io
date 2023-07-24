proc import out=cancer_data
datafile="./nasopharyngeal_cancer_data.csv" dbms=csv replace;
run;

/*fitting overall KM survival curve*/
proc lifetest data=cancer_data plots=(survival);
time years*censored(1);
run;

/*KM curves and log-rank test by gender*/
proc lifetest data=cancer_data plots=(survival);
time years*censored(1);
strata gender;
run;

/*KM curves and log-rank test by smoker*/
proc lifetest data=cancer_data plots=(survival);
time years*censored(1);
strata smoker;
run;

/*KM curves and log-rank test by therapy*/
proc lifetest data=cancer_data plots=(survival);
time years*censored(1);
strata therapy;
run;

