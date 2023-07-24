data pneumonia;
input group$ days censored @@;
cards;
Tx 3 0 Tx 3 0 Tx 4 0 Tx 4 0 Tx 4 1 Tx 5 0 Tx 5 0
Cx 4 0 Cx 5 0 Cx 5 0 Cx 6 0 Cx 6 0 Cx 6 0 Cx 10 1
;

proc lifetest plots=(survival);
time days*censored(1);
strata group;
run;
