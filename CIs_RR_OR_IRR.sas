data cases;
input x1 n1 x2 n2;
cards;
39 103 53 97
;

/* Relative Risk Confidence Interval */
%let conf_level=95; *choices 90, 95, 99, etc.;

data RR_CI;
set cases;
 RR=(x1/n1)/(x2/n2);
  z=-probit((1-0.01*&conf_level)/2);
   SE=sqrt(1/x1-1/n1+1/x2-1/n2);
    LCL=RR/exp(z*SE);
     UCL=RR*exp(z*SE);
 keep RR LCL UCL;
run;

 proc print data=RR_CI noobs;
 run;

/* Odds Ratio Confidence Interval */

%let conf_level=99; *choices 90, 95, 99, etc.;

data OR_CI;
set cases;
 OR=(x1/(n1-x1))/(x2/(n2-x2));
  z=-probit((1-0.01*&conf_level)/2);
   SE=sqrt(1/x1+1/(n1-x1)+1/x2+1/(n2-x2));
    LCL=OR/exp(z*SE);
     UCL=OR*exp(z*SE);
  keep OR LCL UCL;
 run;

 proc print data=OR_CI noobs;
 run;


/* Incidence Rate Ratio Confidence Interval */
data cases;
input n1 T1 n2 T2;
cards;
52 873.5 69 834.5
;

%let conf_level=99; *choices 90, 95, 99, etc.;

data IRR_CI;
set cases;
 IRR=(n1/T1)/(n2/T2);
  z=-probit((1-0.01*&conf_level)/2);
   SE=sqrt(1/n1+1/n2);
    LCL=IRR/exp(z*SE);
     UCL=IRR*exp(z*SE);
 keep IRR LCL UCL;
run;

 proc print data=IRR_CI noobs;
 run;

