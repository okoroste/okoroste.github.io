proc import out=TBdata datafile="./TB_symptoms_data.csv"
dbms=csv replace;

data TBstats (drop=SubjectN Gender TB_Symptoms Date_Symptoms);
 set TBdata;
  if gender='F' and TB_Symptoms=1 then Fcases+1;
   if gender='M' and TB_Symptoms=1 then Mcases+1;
     if gender='F' then Ftotal+1;
     if gender='M' then Mtotal+1;
      if gender='F' then Fduration+Date_Symptoms-'2Apr2013'd;
       if gender='M' then Mduration+Date_Symptoms-'2Apr2013'd;
  if _N_=56;
 run;

%let conf_level=95; *choices 90, 95, 99, etc.;

data TBstats;
 set TBstats;
   RR=(Fcases/Ftotal)/(Mcases/Mtotal);
    OR=(Fcases/(Ftotal-Fcases))/(Mcases/(Mtotal-Mcases));
	  IRR=(Fcases/Fduration)/(Mcases/Mduration);
        z=-probit((1-0.01*&conf_level)/2);
   SE_lnRR=sqrt(1/Fcases-1/Ftotal+1/Mcases-1/Mtotal);
 SE_lnOR=sqrt(1/Fcases+1/(Ftotal-Fcases)+1/Mcases+1/(Mtotal-Mcases));
	 SE_lnIRR=sqrt(1/Fcases+1/Mcases);

    LCL_RR=RR/exp(z*SE_lnRR);
     UCL_RR=RR*exp(z*SE_lnRR);
       LCL_OR=OR/exp(z*SE_lnOR);
         UCL_OR=OR*exp(z*SE_lnOR);
	       LCL_IRR=IRR/exp(z*SE_lnIRR);
             UCL_IRR=IRR*exp(z*SE_lnIRR);

 keep RR OR IRR LCL_RR UCL_RR LCL_OR UCL_OR LCL_IRR UCL_IRR;
run;

 proc print data=TBstats noobs;
 var RR LCL_RR UCL_RR OR LCL_OR UCL_OR IRR LCL_IRR UCL_IRR;
 run;

