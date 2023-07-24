group<-c("Tx","Tx","Tx","Tx","Tx","Tx","Tx","Cx",
"Cx","Cx","Cx","Cx","Cx","Cx")
days<-c(3, 3, 4, 4, 4, 5, 5, 4, 5, 5, 6, 6, 6, 10)
censored<-c(0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 1)

library(survival)
#survdiff() performs the log-rank test
survdiff(Surv(days, censored==0) ~ group)

#computing the KM estimates
days.surv<-survfit(Surv(days, censored==0) ~ group, 
se.fit=FALSE)

#plotting the KM survival curves
plot(days.surv, mark.time=TRUE, pch=4, col=c("blue","red"), 
main="Kaplan-Meier Survival Curves", xlab="Days", 
ylab="Survival Distribution Function")
legend("topright", lty=1, col=c("blue","red"), legend=c("Cx","Tx"), 
text.col=c("blue","red"))
