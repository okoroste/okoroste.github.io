%let N=1000;
%let beta=0.7;
%let gamma=0.2;
%let t=30;

/*simulating trajectories*/
%macro SIRmodel(N,beta,gamma,t);
data SIR (drop=X Y);
call streaminit(809197);
time=0;
S=&N-1;
I=1;
R=0;
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

%mend;
%SIRmodel(1000,0.7,0.2,30)

/*estimating parameters*/
data SIR;
set SIR;
lag_S=lag(S);
beta_est=(S-lag(S))/(lag(S)*lag(I));
gamma_est=(R-lag(R))/lag(I);
response_var=(I-lag(I))/lag(I);
if beta_est ne .;
run;

proc sql;
 select -1000*mean(beta_est) as beta_hatMM,
 mean(gamma_est) as gamma_hatMM
  from SIR;
quit;

proc glm data=SIR;
model response_var=lag_S;
run;

