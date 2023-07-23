infection.data<- read.csv(file="./respiratory_infection.csv", header=TRUE, sep=",")

#creating long-form data set
library(reshape2)
data1<- melt(infection.data[,c("medID","gender","age","BMI","xerophthalmia1",
"xerophthalmia2","xerophthalmia3","xerophthalmia4")], id.vars=c("medID", 
"gender","age","BMI"), variable.name="xero_visit", value.name="xerophthalmia")

data2<- melt(infection.data[,c("medID","infection1","infection2",
"infection3","infection4")], id.vars="medID", 
variable.name="infection_visit", value.name="infection")
data2<- data2[c("infection")]

longform.data<- cbind(data1,data2)

#creating variable for visit
longform.data$visit<- ifelse(longform.data$xero_visit=="xerophthalmia1",1,
ifelse(longform.data$xero_visit=="xerophthalmia2",2,
ifelse(longform.data$xero_visit=="xerophthalmia3",3,4)))

#specifying reference category
longform.data$gender.rel<- relevel(as.factor(longform.data$gender), ref="M")
longform.data$xerophthalmia.rel<- relevel(as.factor(longform.data$xerophthalmia), ref="0")

#cleaning long-form data
longform.data<- longform.data[!names(longform.data) %in% 
c("gender", "xero_visit","xerophthalmia")]

#fitting logistic model with random intercept 
#install.packages("Rcpp")
library(lme4)
summary(fitted.model<- glmer(infection ~gender.rel + age+ BMI 
+ xerophthalmia.rel + visit + (1 | medID), data=longform.data, 
family=binomial(link="logit")))

#using fitted model for prediction
new.data<- rbind(longform.data, data.frame(medID="999999",
age=10, BMI=15.6, infection=NA, visit=2, gender.rel="M", 
xerophthalmia.rel=1))

pred<- predict(fitted.model, new.data, re.form=NA, type="response")
pred[length(pred)]



