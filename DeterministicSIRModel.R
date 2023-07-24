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
   S[j+1]<- S[j]-beta*S[j]*I[j]/N
   I[j+1]<- I[j]+beta*S[j]*I[j]/N-gamma*I[j]
   R[j+1]<- R[j]+gamma*I[j]
}

time<- 0:30
plot(time,S, type="l", lty=1, lwd=3, main="The Deterministic 
SIR Epidemic Model", ylim=c(0,N), col="green",ylab="")
lines(time,I,lwd=3, col="red")
lines(time,R,lwd=3, col="blue")
legend("left", c("S","I","R"), lty=1, col=c("green","red","blue"))

  
