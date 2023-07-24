cancer.data<- read.csv(file="./skin_cancer_data.csv", header=TRUE, sep=",")

#specifying reference category
cancer.data$group.rel<- relevel(as.factor(cancer.data$group), ref="Tx")
cancer.data$gender.rel<- relevel(as.factor(cancer.data$gender), ref="F")

#fitting nonparametric Poisson regression
library(gam)
poisson.fit<- gam(nnewcancers ~ group.rel + gender.rel + lo(age) + 
lo(nprevcancers) + lo(year), data=cancer.data, family=poisson)
coefficients(summary.glm(poisson.fit))

#using the fitted model for prediction
predict(poisson.fit, data.frame(group.rel="Tx", gender.rel="F",
age=57, nprevcancers=8, year=3), type="response")

