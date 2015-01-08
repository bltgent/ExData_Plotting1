#plot5
#Open some useful libraries
library(dplyr)

#Access the data
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

#subset NEI for only Baltimore
a<-filter(NEI,fips==24510)

#Find all of the SCC codes that match a short.name that includes Vehicle
b<-SCC[grep("Vehicles",SCC[,3]),1]

#Subset NEI on the logical vector
c<-a[b,]

#Group the subset by year
d<-group_by(c,year)

#Sum the Emissions data
d<-summarise_each(d,funs(sum),Emissions)

#Plot the data
plot(d, main="Vehicle-Related Emission in Baltimore")

## Copy my plot to a PNG file
dev.copy(png, file = "plot5.png", width = 480, height = 480)

#Close the png connection.
dev.off(); dev.off(); dev.off();