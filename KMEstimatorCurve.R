#install.packages("survival")
library(survival)
weeks<-c(3, 5, 6, 8, 8, 8, 9, 12, 12)
censored<-c(0, 0, 1, 0, 0, 1, 0, 0, 1)

#Surv() creates survival object
#survfit() produces KM estimator 
weeks.surv <- survfit(Surv(weeks, censored==0) ~ 1, 
se.fit=FALSE) #no confidence band
summary(weeks.surv)

#plotting KM survival curve
plot(weeks.surv, mark.time=TRUE, pch=4, 
col="blue", main="The Kaplan-Meier Survival Curve", 
xlab="Weeks", ylab="Survival Distribution Function")

