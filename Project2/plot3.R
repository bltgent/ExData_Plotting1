#plot3
#Open some useful libraries
library(dplyr)
library(ggplot2)

#Access the data
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

#Organize the data by grouping and summing
a<-group_by(NEI,year,type)
a<-summarise_each(a, funs(sum),Emissions)

#Create a plot with facets fr each type
qplot(Emissions,  year,  data  =  a,  facets  = .~type) +
 geom_point()

## Copy my plot to a PNG file
dev.copy(png, file = "plot3.png", width = 480, height = 480)

#Close the png connection.
dev.off(); dev.off(); dev.off();