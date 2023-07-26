data cohorts;
 input community $ BMI @@;
cards;
A 29.3 A 31.4 A 38.7 A 33.2 A 30.3 
B 42.0 B 39.9 B 44.5 B 40.7 B 38.9
C 28.8 C 36.1 C 37.5 C 31.0 C 33.2
;

proc anova;
class community;
 model BMI=community;
 run;

proc glm;
  class community;
   model BMI=community;
     means community/tukey;
run;



