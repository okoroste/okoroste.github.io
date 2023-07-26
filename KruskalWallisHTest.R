BMI.A<- c(29.3, 31.4, 38.7, 33.2, 30.3)
BMI.B<- c(42.0, 39.9, 44.5, 40.7, 38.9)
BMI.C<- c(28.8, 36.1, 37.5, 31.0, 33.2)

BMI.list<- list(BMI.A, BMI.B, BMI.C)
kruskal.test(BMI.list)

library(exactRankTests)
wilcox.exact(BMI.A, BMI.B, paired=FALSE, alternative="two.sided")
wilcox.exact(BMI.A, BMI.C, paired=FALSE, alternative="two.sided")
wilcox.exact(BMI.B, BMI.C, paired=FALSE, alternative="two.sided")