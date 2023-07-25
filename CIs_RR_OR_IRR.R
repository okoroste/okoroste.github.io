#Relative Risk Confidence Interval
x1<- 39
n1<- 103
x2<- 53
n2<- 97

conf.level<- 95
z<- -qnorm((1-0.01*conf.level)/2)
SE<- sqrt(1/x1-1/n1+1/x2-1/n2)
print(RR<- (x1/n1)/(x2/n2))
print(LCL<- RR/exp(z*SE))
print(UCL<- RR*exp(z*SE))


#Odds Ratio Confidence Interval
conf.level<- 99
z<- -qnorm((1-0.01*conf.level)/2)
SE<- sqrt(1/x1+1/(n1-x1)+1/x2+1/(n2-x2))
print(OR<- (x1/(n1-x1))/(x2/(n2-x2)))
print(LCL<- OR/exp(z*SE))
print(UCL<- OR*exp(z*SE))


#Incidence Rate Ratio Confidence Interval
n1<- 52
T1<- 873.5
n2<- 69
T2<- 834.5
conf.level<- 99
z<- -qnorm((1-0.01*conf.level)/2)
SE<- sqrt(1/n1+1/n2)
print(IRR<- (n1/T1)/(n2/T2))
print(LCL<- IRR/exp(z*SE))
print(UCL<- IRR*exp(z*SE))

