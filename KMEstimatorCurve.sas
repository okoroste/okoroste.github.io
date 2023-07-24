data remission;
input weeks censored @@;
cards;
3 0 5 0 6 1 8 0 8 0 8 1 9 0 12 0 12 1
;

proc lifetest plots=(survival);
time weeks*censored(1);
run;
