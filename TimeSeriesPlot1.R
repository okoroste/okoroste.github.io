diabetes3.data<- read.csv(file="./diabetes_data3.csv", header=TRUE, sep=",")

plot(diabetes3.data$year, diabetes3.data$diabetes, type="l", col="blue", 
main="Diabetes Cases (in millions) in U.S. by Year", xlim=c(1999,2018), ylim=c(0,30), 
xlab="Year", ylab="Number of Cases (in millions)", axes=FALSE, panel.first=grid())
axis(side=1, at=c(seq(1999,2015,by=2), 2018))
axis(side=2)
points(diabetes3.data$year, diabetes3.data$diabetes, pch=16, col="blue") 
#pch=plot character 16=dot


