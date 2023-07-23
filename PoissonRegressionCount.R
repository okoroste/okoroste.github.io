hospital.stay<-read.csv(file="./hospital_stay.csv", header=TRUE, sep=",")

#specifying reference categories
gender.rel<- relevel(as.factor(hospital.stay$gender), ref="F")
illness.rel<- relevel(as.factor(hospital.stay$illness), ref="no")

#fitting Poisson model
summary(fitted.model<- glm(days ~ gender.rel + age + illness.rel,
data=hospital.stay, family=poisson(link=log)))

#using fitted model for prediction
print(predict(fitted.model, data.frame(gender.rel="M", age=55, illness.rel="no"),
type="response"))