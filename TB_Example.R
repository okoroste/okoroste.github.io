TBdata<- read.csv(file="./TB_symptoms_data.csv", header=TRUE, sep=",")

female.workers <- subset(TBdata, Gender=="F")
male.workers<- subset(TBdata, Gender=="M")

Fcases<- sum(female.workers$TB_Symptoms)
Mcases<- sum(male.workers$TB_Symptoms)
Ftotal<- nrow(female.workers)
Mtotal<- nrow(male.workers)

Fduration<- as.numeric(sum(as.Date(female.workers$Date_Symptoms)
                           -as.Date("2013-04-02")))
Mduration<- as.numeric(sum(as.Date(male.workers$Date_Symptoms)
                           -as.Date("2013-04-02")))

conf.level<- 95

RR<- (Fcases/Ftotal)/(Mcases/Mtotal)
 OR<- (Fcases/(Ftotal-Fcases))/(Mcases/(Mtotal-Mcases))
  IRR<- (Fcases/Fduration)/(Mcases/Mduration)

  z<- -qnorm((1-0.01*conf.level)/2)

SE.lnRR<- sqrt(1/Fcases-1/Ftotal+1/Mcases-1/Mtotal)
  SE.lnOR<- sqrt(1/Fcases+1/(Ftotal-Fcases)+1/Mcases+1/(Mtotal-Mcases))
    SE.lnIRR<- sqrt(1/Fcases+1/Mcases)
  
  LCL.RR<- RR/exp(z*SE.lnRR)
   UCL.RR<- RR*exp(z*SE.lnRR)
     LCL.OR<- OR/exp(z*SE.lnOR)
      UCL.OR<- OR*exp(z*SE.lnOR)
        LCL.IRR<- IRR/exp(z*SE.lnIRR)
          UCL.IRR<- IRR*exp(z*SE.lnIRR)
  
 print(c(RR,LCL.RR,UCL.RR,OR,LCL.OR,UCL.OR,IRR,LCL.IRR,UCL.IRR))