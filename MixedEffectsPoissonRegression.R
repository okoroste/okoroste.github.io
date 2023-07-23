cancer.data<- read.csv(file="./skin_cancer_data.csv", header=TRUE, sep=",")

#specifying reference category
cancer.data$group.rel<- relevel(as.factor(cancer.data$group), ref="Tx")
cancer.data$gender.rel<- relevel(as.factor(cancer.data$gender), ref="F")

#cleaning the data set
cancer.data<- cancer.data[!names(cancer.data) %in% c("group", "gender")]

#fitting random intercept Poisson model
#install.packages("Rcpp")
library(lme4)

summary(fitted.model<- glmer(nnewcancers ~ group.rel + age + gender.rel
+ nprevcancers + year + (1 |ptID), data=cancer.data, family=poisson(link="log")))

#using fitted model for prediction
new.data<- rbind(cancer.data, data.frame(ptID="111111",
age=57, nprevcancers=8, year=3, nnewcancers=NA, group.rel="Tx", gender.rel="F"))

pred<- predict(fitted.model, new.data, re.form=NA, type="response")
pred[length(pred)]



