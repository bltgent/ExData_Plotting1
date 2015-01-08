#plot6
#Open some useful libraries
library(dplyr)
library(ggplot2)

#Access the data
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

#subset NEI for only Baltimore
a<-filter(NEI,fips==24510)
l<-filter(NEI,fips=="06037")
a<-rbind(a,l)

#Find all of the SCC codes that match a short.name that includes Vehicle
b<-SCC[grep("Vehicles",SCC[,3]),1]

#Subset NEI on the logical vector
c<-a[b,]

#Group the subset by year
d<-group_by(c,year,fips)

#Sum the Emissions data
d<-summarise_each(d,funs(sum),Emissions)

#Plot the data
qplot( year, Emissions, data  =  d,  facets  = .~fips, main="Emissions: Los Angeles vs. Baltimore") +
        geom_line()

## Copy my plot to a PNG file
dev.copy(png, file = "plot6.png", width = 480, height = 480)

#Close the png connection.
dev.off(); dev.off(); dev.off();