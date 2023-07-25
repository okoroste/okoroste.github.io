/*Exact Poisson Test*/
data cases;
input T n;
cards;
1978 12
;

%let lambda0=0.01;
%let H1="less";  *choices: "less", "greater", "two.sided";

data test;
 set cases;
 if (&H1="greater") then
  pvalue=cdf("gamma", &lambda0*T, n);
   if (&H1="less") then
     pvalue=1-cdf("gamma", &lambda0*T, n+1);
	if (&H1="two.sided" and n<&lambda0*T) then
	   pvalue=min(2*(1-cdf("gamma",&lambda0*T,n+1)),1);
	    if (&H1="two.sided" and n>=&lambda0*T) then
	      pvalue=min(2*cdf("gamma",&lambda0*T,n),1);
run;


proc print data=test noobs;
run;


/*Exact Poisson Confidence Interval*/

%let conf_level=95;   *choices: 90, 95, 99, etc.;

data CI (drop=alpha);
 set cases;
  alpha=(1-0.01*&conf_level);
   lambda_hat=n/T;
    lambdaL=gaminv(alpha/2,n)/T;
     lambdaU=gaminv(1-alpha/2,n+1)/T;
run;

proc print data=CI noobs;
run;

