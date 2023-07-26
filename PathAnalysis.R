hypertension.data<- read.csv("./hypertension_data.csv", header=TRUE, sep=",")

library(lavaan)#lavaan=latent variable analysis

path<- 'anxiety ~ income
stress ~ income
sleep ~ anxiety + stress 
BMI ~ anxiety + stress + sleep 
SBP ~ sleep + BMI'

fitted.path<- sem(path,hypertension.data)
summary(fitted.path)

library(lavaanPlot)

lavaanPlot(model = fitted.path, coefs = TRUE, stand = FALSE, sig = 0.05) 


