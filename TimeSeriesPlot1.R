diabetes3.data<- read.csv(file="./diabetes_data3.csv", header=TRUE, sep=",")

plot(diabetes3.data$year, diabetes3.data$diagnosed, type="l", col="blue", 
main="Diabetes Cases (in millions) in U.S. by Year", xlim=c(1999,2018), ylim=c(0,35), 
xlab="Year", ylab="Number of Cases (in millions)", axes=FALSE, panel.first=grid())
axis(side=1, at=c(seq(1999,2015,by=2), 2018))
axis(side=2)
lines(diabetes3.data$year, diabetes3.data$undiagnosed, col="black")
lines(diabetes3.data$year, diabetes3.data$total, col="red")
points(diabetes3.data$year, diabetes3.data$diagnosed, pch=16, col="blue") #pch=plot character 16=dot
points(diabetes3.data$year, diabetes3.data$undiagnosed, pch=1, col="black") #1=circle
points(diabetes3.data$year, diabetes3.data$total, pch=5, col="red") #5=diamond
legend("topleft", c("diagnosed", "undiagnosed", "total"), lty=1, col=c("blue", "black", "red"))

