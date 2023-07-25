
#exact Poisson test
poisson.test(12, 1978, r=0.01, alternative="less")


#exact Poisson confidence interval
#install.packages("DescTools")
library(DescTools)
PoissonCI(12, 1978, method="exact", conf.level = 0.95)