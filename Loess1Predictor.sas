data heart_rate;
input HR @@;
 month=_N_;
 cards;
63 60 68 75 78 74 77 66 68 72
60 57 57 71 75 76 75 73 76 87
86 83 87 81 86 84 77 61 69 82
;

proc loess data=heart_rate;
 model HR = month / smooth= 0.1 0.2 0.4 1;
run;

proc loess data=heart_rate;
 model HR = month /degree=2 smooth=0.2 0.3 0.6 1;
run;

/*prediction*/
data point4pred;
 input month;
cards;
20
;

proc loess data=heart_rate;
 model HR = month / smooth= 0.2;
  ods output ScoreResults=predicted;
    score data=point4pred;
run;

proc print data=predicted noobs;
var p_HR;
run;

proc loess data=heart_rate;
 model HR = month /degree=2 smooth=0.3;
  ods output ScoreResults=predicted;
    score data=point4pred;
run;

proc print data=predicted noobs;
var p_HR;
run;
