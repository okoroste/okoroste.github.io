set.seed(191962)
N<- 1000
beta<- 0.7
gamma<- 0.2
S<- c()
I<- c()
R<- c()

S[1]<- N-1
I[1]<- 1
R[1]<- 0

for (j in 1:30) {
   X<- rbinom(1,S[j],beta*I[j]/N)
   Y<- rbinom(1,I[j],gamma)
   S[j+1]<- S[j]-X
   I[j+1]<- I[j]+X-Y
   R[j+1]<- R[j]+Y
}

time<- 0:30
plot(time,S, type="l", lty=1, lwd=3, main="The Binomial SIR 
Epidemic Model", ylim=c(0,N), col="green",ylab="")
lines(time,I,lwd=3, col="red")
lines(time,R,lwd=3, col="blue")
legend("left", c("S","I","R"), lty=1, col=c("green","red","blue"))
