#exact binomial test
binom.test(725, 10000, p=0.07, alternative="greater")
#options are alternative=c("two.sided", "greater", "less")

#exact binomial confidence interval
binom.test(725, 10000, conf.level = 0.9)

#approximate test
prop.test(725, 10000, conf.level=0.9)