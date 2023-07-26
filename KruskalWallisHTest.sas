data cohorts;
 input community $ BMI @@;
cards;
A 29.3 A 31.4 A 38.7 A 33.2 A 30.3 
B 42.0 B 39.9 B 44.5 B 40.7 B 38.9
C 28.8 C 36.1 C 37.5 C 31.0 C 33.6
;

proc npar1way data=cohorts Wilcoxon;
   class community;
     var BMI;
   exact;
run;

/*Post hoc pairwise comparisons - Wilcoxon rank-sum test*/
proc npar1way data=cohorts Wilcoxon;
   class community;
     var BMI;
   exact;
   where community in ("A","B");
run;

proc npar1way data=cohorts Wilcoxon;
   class community;
     var BMI;
   exact;
   where community in ("A","C");
run;

proc npar1way data=cohorts Wilcoxon;
   class community;
     var BMI;
   exact;
   where community in ("B","C");
run;
