#plot4
#Open some useful libraries
library(dplyr)

#Access the data
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

#Find all of the SCC codes that match a short.name that includes coal
b<-SCC[grep("[cC]oal",SCC[,3]),1]

#Create a logical vector for NEI observations that pertain to coal
c<-NEI[,2] %in% b

#Subset NEI on the logical vector
c<-NEI[c,]

#Group the subset by year
d<-group_by(c,year)

#Sum the Emissions data
d<-summarise_each(a,funs(sum),Emissions)

#Plot the data
plot(d, main="Coal-Related Emission in the U.S")

## Copy my plot to a PNG file
dev.copy(png, file = "plot4.png", width = 480, height = 480)

#Close the png connection.
dev.off(); dev.off(); dev.off();