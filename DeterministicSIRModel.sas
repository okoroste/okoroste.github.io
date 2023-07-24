%let N=1000;
%let beta=0.7;
%let gamma=0.2;
%let t=30;

data SIR;
S=&N-1;
I=1;
R=0;
time=0;
output;
do time=1 to &t; 
 S+(-&beta*S*I/&N);
   I+&beta*S*I/&N-&gamma*I;
     R+&gamma*I;
  output;
end;
run;

symbol interpol=join value=none width=2;
axis label=none;
title "The Deterministic SIR Epidemic Model";
proc gplot data=SIR;
plot (S I R)*time/overlay legend vaxis=axis;
run;


