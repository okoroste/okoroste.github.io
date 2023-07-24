%let N=1000;
%let beta=0.7;
%let gamma=0.2;
%let t=30;

data SIR;
call streaminit(809197);
S=&N-1;
I=1;
time=0;
output;
do time=1 to &t; 
X=rand("binomial", &beta*I/&N, S);
Y=rand("binomial", &gamma, I);
 S+(-X);
   I+X-Y;
     R+Y;
  output;
end;
run;

symbol interpol=join value=none width=2;
axis label=none;
title "The Binomial SIR Epidemic Model";
proc gplot data=SIR;
plot (S I R)*time/overlay legend vaxis=axis;
run;

