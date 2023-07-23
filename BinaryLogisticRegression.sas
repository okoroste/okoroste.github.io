proc import out=pneumonia datafile="./pneumonia_data.csv"
dbms=csv replace;

/*fitting logistic model*/
proc genmod;
class gender(ref="M") tobacco_use(ref="0");
   model pneumonia(event="1")= age gender diabetes asthma 
hypertension cardiovascular obesity tobacco_use PM2_5/
             dist=binomial link=logit;
run;

/*using fitted model for prediction*/
data prediction;
input age gender$ diabetes asthma hypertension cardiovascular obesity 
tobacco_use PM2_5;
cards;
55 F 0 1 0 0 1 0 13.3
;

data pneumonia;
 set pneumonia prediction;
run;

proc genmod;
class gender tobacco_use;
  model pneumonia(event="1")= age gender diabetes asthma hypertension 
    cardiovascular obesity tobacco_use PM2_5/dist=binomial link=logit;
 output out=outdata p=pprob_pneumonia;
run;

proc print data=outdata (firstobs=201) noobs;
var pprob_pneumonia;
run;


