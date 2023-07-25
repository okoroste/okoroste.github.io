diabetes2<- read.csv(file="./diabetes2.csv", header=TRUE, sep=",")

hist(diabetes2$percent, main='Histogram for Percent of Adults with Diagnosed 
Diabetes in California Counties', breaks=seq(5,19,by=2), col="dodgerblue", 
xlab="", ylab="Count")
   

