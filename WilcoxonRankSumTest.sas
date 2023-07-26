data cohortsAB;
 input community $ BMI @@;
cards;
A 29.3 A 31.4 A 38.7 A 33.2 A 30.3 
B 42.0 B 39.9 B 44.5 B 40.7 B 38.9
;

proc npar1way data=cohortsAB Wilcoxon;
   class community;
     var BMI;
   exact;
run;

