data flu_freq;
do i=1 to 725;
   flu="yes";
   output;
end;
  do i=726 to 10000;
   flu="no";
   output;
end;
run;

proc freq data=flu_freq;
table flu/binomial (p=.07 level="yes") alpha=0.1;
run;

/*or */
data flu_freq2;
input flu$ freq;
cards;
yes 725
no 9275
;

proc freq data=flu_freq2;
table flu/binomial (p=0.07 level="yes") alpha=0.1;
weight freq;
run;

