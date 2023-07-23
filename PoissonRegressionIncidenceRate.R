thrombosis.data<-read.csv(file="./thrombosis_data.csv", header=TRUE, sep=",")

gender.rel<- relevel(as.factor(thrombosis.data$gender), ref="F")
NYHA.rel<- relevel(as.factor(thrombosis.data$NYHA), ref="I")

#fitting Poisson model
summary(fitted.model<- glm(AT ~ age + gender.rel + NYHA.rel + offset(log(duration)),
data=thrombosis.data, family=poisson(link=log)))

#using fitted model for prediction
print(predict(fitted.model, data.frame(age=65, gender.rel="M", NYHA.rel="II", 
duration=10000), type="response"))