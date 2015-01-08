#plot1
library(dplyr) # Get the dlpyr library

#Access the data
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

#Group the data by year
a<-group_by(NEI,year)

#Sum the Emissions from each year
a<-summarise_each(a, funs(sum),Emissions)

#Plot the summed result from each year
plot(a, type="l")

# Copy my plot to a PNG file
dev.copy(png, file = "plot1.png", width = 480, height = 480)

#Close the png connection.
dev.off(); dev.off(); dev.off();