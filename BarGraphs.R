diabetes1<- read.csv(file="./diabetes_data1.csv", header=TRUE, sep=",")

table1 <- xtabs(percent ~ gender+race, data=diabetes1) 
table2 <- xtabs(percent ~ race+gender, data=diabetes1) 

barplot(table1, main='Side-by-side Bar Graph for Prevalence of Diagnosed 
Diabetes by Race and Gender', ylim=c(0,17), xlab='', ylab='Percent', 
col=c("purple","blue"), legend.text=rownames(table), beside=TRUE)

barplot(table2, main='Grouped Bar Graph for Prevalence of Diagnosed 
Diabetes by Gender and Race', ylim=c(0,17), xlab='', ylab='Percent', 
col=c("blue","purple","lightgreen","dodgerblue","skyblue"), 
legend.text=rownames(table), beside=TRUE)

barplot(table1, main='Stacked Bar Graph for Prevalence of Diagnosed 
Diabetes by Race and Gender', ylim=c(0,30), xlab='', ylab='Percent', 
col=c("purple", "blue"), legend.text=rownames(table), beside=FALSE)

barplot(table2, main='Stacked Bar Graph for Prevalence of Diagnosed 
Diabetes by Gender and Race', ylim=c(0,60), xlab='', ylab='Percent', 
col=c("blue","purple","lightgreen","dodgerblue","skyblue"),
legend.text=rownames(table), beside=FALSE)
      