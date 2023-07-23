HR<- c(63, 60, 68, 75, 78, 74, 77, 66, 68, 72,
       60, 57, 57, 71, 75, 76, 75, 73, 76, 87,
       86, 83, 87, 81, 86, 84, 77, 61, 69, 82)
month <- 1:30

library("fANCOVA") 
loess.as(month, HR, degree = 1, user.span = 0.1, plot=TRUE)
loess.as(month, HR, degree = 1, user.span = 0.2, plot=TRUE)
loess.as(month, HR, degree = 1, user.span = 0.4, plot=TRUE)
loess.as(month, HR, degree = 1, user.span = 1, plot=TRUE)

loess.as(month, HR, degree = 2, user.span = 0.2, plot=TRUE)
loess.as(month, HR, degree = 2, user.span = 0.3, plot=TRUE)
loess.as(month, HR, degree = 2, user.span = 0.6, plot=TRUE)
loess.as(month, HR, degree = 2, user.span = 1, plot=TRUE)

#prediction
loess.fit1<- loess.as(month, HR, degree = 1, user.span = 0.2)
predict(loess.fit1, 20)

loess.fit2<- loess.as(month, HR, degree=2, user.span = 0.3)
predict(loess.fit2, 20)
