library(exactRankTests)
BMI.A<- c(29.3, 31.4, 38.7, 33.2, 30.3)
BMI.B<- c(42.0, 39.9, 44.5, 40.7, 38.9)
wilcox.exact(BMI.A, BMI.B, paired=FALSE, alternative="less")
#The test statistic is W-n1(n1+1)/2

