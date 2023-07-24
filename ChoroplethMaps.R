# Map of USA: Plotting West Nile Virus Cases in US by State, 1999-2020
cases.data<- read.csv(file="./WestNileVirusCasesR.csv", 
header=TRUE, sep=",")

#install.packages("usmap")
library(usmap)
library(ggplot2)

plot_usmap(data=cases.data, values="total", color="blue") + 
scale_fill_continuous(low="white", high="blue", name="Total Cases", 
label=scales::comma) + labs(title="West Nile Virus Cases by State, 
1999-2020", subtitle="Choropleth Map") + theme(legend.position="right")

#Plotting West Nile Virus Cases in US by State in 2005, 2010, 2015, and 2020
#install.packages("gridExtra")   
library("gridExtra")   
plot2005<- plot_usmap(data = cases.data, values = "Y2005", color = "gray")+ 
scale_fill_continuous(low = "white", high = "blue")+theme(legend.position = "right") 

plot2010<- plot_usmap(data = cases.data, values = "Y2010", color = "gray")+ 
  scale_fill_continuous(low = "white", high = "green")+theme(legend.position = "right")

plot2015<- plot_usmap(data = cases.data, values = "Y2015", color = "gray")+ 
  scale_fill_continuous(low = "white", high = "red")+theme(legend.position = "right")

plot2020<- plot_usmap(data = cases.data, values = "Y2020", color = "gray")+ 
  scale_fill_continuous(low = "white", high = "purple")+theme(legend.position = "right")

grid.arrange(plot2005, plot2010, plot2015, plot2020, ncol=2, nrow=2, 
top="West Nile Virus Cases in US") 

#Map of CA: Plotting Percent of Adult Population Diagnosed with Diabetes in California by County
diabetes.data<- read.csv(file="./CA_Diabetes_by_CountyR.csv", 
header=TRUE, sep=",")

#install.packages("usmap")
library(usmap)
library(ggplot2)

plot_usmap(data = diabetes.data, values = "percent", regions="counties",
include="CA", color = "blue") + scale_fill_continuous(low = "white", high = "green", 
name = "Percent", label = scales::comma) + labs(title = "Percent Adults with Diabetes", 
subtitle = "in California by County") + theme(legend.position = "right")

#Plotting Malaria Cases in 2017 by Country in Africa
#install.packages("rworldmap")
library(rworldmap)

malaria.data<- read.csv(file="./AfricaMalariaCases.csv", header=TRUE, sep=",")

#joining data to a map
Map <- joinCountryData2Map(malaria.data, nameJoinColumn="Country", 
joinCode="NAME" )

mapDevice("x11") #creating a separate window

#plotting map of the World
mapCountryData(Map, nameColumnToPlot="Ncases", mapTitle="Malaria Cases in 2017", 
colourPalette=c("white","gray","green","yellow","red","blue","black"))
              
#plotting map of Africa
mapCountryData(Map, nameColumnToPlot="Ncases", mapTitle="Malaria Cases in 2017", 
mapRegion="Africa",colourPalette=c("white","gray","green","yellow","red","blue","black"))

