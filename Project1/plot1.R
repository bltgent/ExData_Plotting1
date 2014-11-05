#Set the working directory
setwd("C:/Users/Brian/Documents/GitHub/ExData_Plotting1/Project1")
#Read the file from the working directory.  File has already been unzipped.
file<-c("household_power_consumption.txt")
#read the data into the environment
p1<- read.table(file, comment.char = "#", header = TRUE, sep = ";", na.strings = "?")
#create a names variable
cnames <- readLines(file, 1)
#Look at the names
print(cnames)
#Split the names into uindividual elements
cnames <- strsplit(cnames, ";", fixed = TRUE)
#Look at the names again
print(cnames)
#Rename the columns of the data table
names(p1) <- make.names(cnames[[1]])
#Check the progress
head(p1)
#Change the classes of Columns 3:9 (Probably a better way to do this)
for(i in 3:9){
        p1[,i]<-as.numeric(as.character(p1[,i]))
}
#Change data table to data frame with diplyr
p1<-tbl_df(p1)
#Change format of Date column
p1$Date<-as.Date(as.character(p1$Date),"%d/%m/%Y")
#Get only the data for dates 2/1/2007-2/2/2007
p2<-filter(p1,Date=='2007-02-01')
p3<-filter(p1,Date=='2007-02-02')
#Bind the data
p1<-rbind(p2,p3)

#Remove unneccesary data from working environment
rm(p2)
rm(p3)

#Make a Histogram
hist(p1[,3],main="Global Active Power",xlab="Global Active Power (kilowatts)", col=2)

## Copy my plot to a PNG file
dev.copy(png, file = "plot1.png")

##Turn off the devices
dev.off(); dev.off();
