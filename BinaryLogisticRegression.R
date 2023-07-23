pneumonia.data<- read.csv(file="./pneumonia_data.csv", header=TRUE, sep=",")

#specifying reference categories
gender.rel<- relevel(as.factor(pneumonia.data$gender), ref="M")
tobacco.use.rel<- relevel(as.factor(pneumonia.data$tobacco_use), ref="0")

#fitting logistic model
summary(fitted.model<- glm(pneumonia ~ age + gender.rel + diabetes
+ asthma + hypertension + cardiovascular + obesity + tobacco.use.rel + PM2_5, 
data=pneumonia.data, family=binomial(link=logit)))

#using fitted model for prediction
print(predict(fitted.model, type="response", data.frame(age=55, gender.rel="F", 
diabetes=0, asthma=1, hypertension=0, cardiovascular=0, obesity=1, 
tobacco.use.rel="0", PM2_5=13.3)))




