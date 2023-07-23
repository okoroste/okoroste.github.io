LDL.data<- read.csv(file="./LDLdata.csv", header=TRUE, sep=",")

#creating long-form data set
library(reshape2)
data1<- melt(LDL.data[,c("id","Stress0","Stress6",
"Stress9","Stress24")], id.vars=c("id"), 
variable.name = "stressmonth", value.name="stress")

data2<- melt(LDL.data[,c("id","LDL0","LDL6","LDL9","LDL24")],id.vars="id",
variable.name="LDLmonth", value.name="LDL")
data2<- data2[c("LDL")]

longform.data<- cbind(data1,data2)

#creating numeric variable for time
longform.data$month<- ifelse(longform.data$stressmonth=="Stress0", 0, 
ifelse(longform.data$stressmonth=="Stress6", 6, 
ifelse(longform.data$stressmonth=="Stress9", 9, 24)))

longform.data$stress<- as.numeric(longform.data$stress)
longform.data$LDL<- as.numeric(longform.data$LDL)

longform.data<- na.omit(longform.data)

#fitting the loess model
LDL.loess<- loess(LDL  ~ stress + month, data=longform.data, 
degree=1, span=1)

#plotting fitted surface
grid<- expand.grid(list(stress=seq(min(longform.data$stress), 
max(longform.data$stress), 1), month=seq(0, 24, 1)))

LDL.predict<- predict(LDL.loess, newdata=grid)
  
library(rgl)  #R Graphics Library
persp3d(LDL.predict, col="green")

#using the fitted model for prediction
predict(LDL.loess, data.frame(stress=15, month=3))               

