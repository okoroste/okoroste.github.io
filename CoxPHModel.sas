proc import out=cancer_data
datafile="C:/Users/000110888/Desktop/nasopharyngeal_cancer_data.csv"
dbms=csv replace;
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

/*fitting Cox model*/
proc phreg data=cancer_data outest=betas;
class gender(ref="F") smoker(ref="no") therapy(ref="radio");
 model years*censored(1)= age gender smoker therapy;
    baseline out=outdata survival=Sbar;
run;

proc print data=betas;
run;

proc print data=outdata;
run;
