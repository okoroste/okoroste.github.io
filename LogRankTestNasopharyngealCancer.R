cancer.data<- read.csv("./nasopharyngeal_cancer_data.csv", header=TRUE,sep=",")

library(survival)
#fitting overall KM survival curve
overall.surv<-survfit(Surv(years, censored==0) ~ 1, 
data=cancer.data, se.fit=FALSE)

plot(overall.surv, mark.time=TRUE, pch=4, col="blue",
main="Overall KM Survival Curve", xlab="Years",
ylab="Survival Distribution Function")

#KM curves and log-rank test by gender
gender.surv<-survfit(Surv(years, censored==0) ~ gender, 
data=cancer.data, se.fit=FALSE)
survdiff(Surv(years, censored==0) ~ gender, data=cancer.data)

plot(gender.surv, mark.time=TRUE, pch=4, col=c("blue","red"),
main="KM Survival Curves by Gender", xlab="Years", ylab="Survival 
Distribution Function")
legend("bottomleft", lty=1, col=c("blue","red"), legend=c("Female","Male"), text.col=c("blue",
"red"))

#KM curves and log-rank test by smoker
smoker.surv<-survfit(Surv(years, censored==0) ~ smoker, 
data=cancer.data, se.fit=FALSE)
survdiff(Surv(years, censored==0) ~ smoker, data=cancer.data)

plot(smoker.surv, mark.time=TRUE, pch=4, col=c("blue","red"),
main="KM Survival Curves by Smoker", xlab="Years", ylab="Survival 
Distribution Function")
legend("bottomleft", lty=1, col=c("blue","red"), legend=c("Smoker No","Smoker Yes"), 
text.col=c("blue","red"))

#KM curves and log-rank test by therapy
therapy.surv<-survfit(Surv(years, censored==0) ~ therapy, 
data=cancer.data, se.fit=FALSE)
survdiff(Surv(years, censored==0) ~ therapy, data=cancer.data)

plot(therapy.surv, mark.time=TRUE, pch=4, col=c("blue","red"),
main="KM Survival Curves by Therapy", xlab="Years", ylab="Survival 
Distribution Function")
legend("bottomleft", lty=1, col=c("blue","red"), legend=c("Chemotherapy",
"Radiation Therapy"), text.col=c("blue","red"))

