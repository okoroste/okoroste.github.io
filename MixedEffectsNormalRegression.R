LDL.data<- read.csv(file="./LDLdata.csv", header=TRUE, sep=",")

#creating long-form data set
library(reshape2)
data1<- melt(LDL.data[,c("id","gender","age","Stress0","Stress6",
"Stress9","Stress24")], id.vars=c("id","gender","age"), 
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

#plotting histogram with fitted normal density
library(rcompanion)
plotNormalHistogram(longform.data$LDL)

#testing for normality of distribution 
shapiro.test(longform.data$LDL)

#specifying reference category
longform.data$gender.rel<- relevel(as.factor(longform.data$gender), ref="M")

#cleaning long-form data
longform.data<- longform.data[!names(longform.data) %in% c("gender", "stressmonth")]

#fitting random slope and intercept model
library(nlme)

summary(fitted.model<- lme(LDL ~ gender.rel+age+stress+month, 
random =~ 1+month|id, data=longform.data, control= lmeControl(opt="optim")))

#using fitted model for prediction
new.data<- rbind(longform.data,data.frame(id="NA", age=60,
stress=25, LDL="NA", month=3, gender.rel="F"))

pred<- predict(fitted.model, new.data, level=0)
pred[length(pred)]

