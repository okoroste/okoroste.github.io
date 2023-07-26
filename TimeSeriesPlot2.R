pollution.data<- read.csv(file="./pollution_data.csv", header=TRUE, sep=",")

plot(as.Date(pollution.data$Date, "%m/%d/%Y"), pollution.data$PM10, type="l", 
col="red", main="PM10 vs. PM2.5 (in micro grams/cubic meter) in Mexico City", 
ylim=c(10,70), xlab="Date", ylab="Particulate Matter", xaxt="n", panel.first=grid())
lines(as.Date(pollution.data$Date, "%m/%d/%Y"), pollution.data$PM2.5, col="black")
points(as.Date(pollution.data$Date, "%m/%d/%Y"), pollution.data$PM10, pch=1, col="red") 
points(as.Date(pollution.data$Date, "%m/%d/%Y"), pollution.data$PM2.5, pch=1, col="black") 
legend("topleft", c("PM10", "PM2.5"), lty=1, col=c("red", "black"))
axis(1, at=as.Date(pollution.data$Date, "%m/%d/%Y"), labels=format(as.Date(pollution.data$Date, 
"%m/%d/%Y"),"%m/%d/%Y"))

