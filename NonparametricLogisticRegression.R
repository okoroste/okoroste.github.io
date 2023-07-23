infection.data<- read.csv(file="./respiratory_infection.csv", header=TRUE, sep=",")

#creating long-form data set
library(reshape2)
longform.data<- melt(infection.data[,c("gender","age","BMI",
"infection1","infection2","infection3","infection4")], 
id.vars=c("gender","age","BMI"), variable.name="infection_visit", 
value.name="infection")

#creating variable for visit
longform.data$visit<- ifelse(longform.data$infection_visit=="infection1", 1,
ifelse(longform.data$infection_visit=="infection2", 2,
ifelse(longform.data$infection_visit=="infection3", 3, 4)))

#specifying reference category
longform.data$gender.rel<- relevel(as.factor(longform.data$gender), ref="M")

#fitting nonparametric logistic regression
library(gam)
logistic.fit <- gam(infection ~ gender.rel + visit + lo(age) + lo(BMI), 
data=longform.data, family=binomial)
coefficients(summary.glm(logistic.fit))

#using fitted model for prediction
predict(logistic.fit, data.frame(gender.rel="M", visit=2, age=10, BMI=15.6),
type="response")





