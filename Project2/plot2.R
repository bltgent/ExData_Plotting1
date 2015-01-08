#plot2
#Load the dplyr package
library(dplyr)

#Access the data
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

#Filter only the observations in which fips==24510
a<-filter(NEI,fips==24510)

#Group the subset by year
a<-group_by(a,year)

#Sum the Emissions data
a<-summarise_each(a,funs(sum),Emissions)

#Plot the data
plot(a)

## Copy my plot to a PNG file
dev.copy(png, file = "plot2.png", width = 480, height = 480)

#Close the png connection.
dev.off(); dev.off(); dev.off();