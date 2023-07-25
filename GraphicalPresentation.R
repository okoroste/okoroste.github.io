###################################################
#####                BAR GRAPH                #####
###################################################

diabetes1<- read.csv(file="./diabetes1.csv", header=TRUE, sep=",")

table <- xtabs(percent ~ gender+race, data=diabetes1) 

barplot(table, main='Grouped Bar Graph for Prevalence of Diagnosed 
Diabetes by Race and Gender',  ylim=c(0,16), xlab='', ylab='Percent', 
col = c("purple", "blue"), legend.text=rownames(table), beside = TRUE)

###################################################
#####                 HISTOGRAM               #####
###################################################

diabetes2<- read.csv(file="./diabetes2.csv", header=TRUE, sep=",")

hist(diabetes2$percent, main='Histogram of Percent Adults with Diagnosed 
Diabetes', breaks=seq(5,19,by=2), col="blue", xlab="", ylab="Count")
   

######################################################  
#####           TIME SERIES PLOT WITH YEARS      #####
######################################################

diabetes3.data<- read.csv(file="./diabetes3.csv", header=TRUE, sep=",")


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


######################################################  
#####           TIME SERIES PLOT WITH DATES      #####
######################################################

pollution.data<- read.csv(file="./pollution.csv", header=TRUE, sep=",")

plot(as.Date(pollution.data$Date, "%m/%d/%Y"), pollution.data$PM10, type="l", 
col="red", main="PM10 vs. PM2.5 (in micro grams/cubic meter) in Mexico City", 
ylim=c(10,70), xlab="Date", ylab="Particulate Matter", xaxt="n", panel.first=grid())
lines(as.Date(pollution.data$Date, "%m/%d/%Y"), pollution.data$PM2.5, col="black")
points(as.Date(pollution.data$Date, "%m/%d/%Y"), pollution.data$PM10, pch=1, col="red") 
points(as.Date(pollution.data$Date, "%m/%d/%Y"), pollution.data$PM2.5, pch=1, col="black") 
legend("topleft", c("PM10", "PM2.5"), lty=1, col=c("red", "black"))
axis(1, at=as.Date(pollution.data$Date, "%m/%d/%Y"), labels=format(as.Date(pollution.data$Date, 
"%m/%d/%Y"),"%m/%d/%Y"))

