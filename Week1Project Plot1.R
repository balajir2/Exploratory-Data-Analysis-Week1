plot1<-function(){
# Set working directory
setwd("D:/2020/Education/Data Science/Course 4/Week 1/Project")
# read the file into a data frame
library(lubridate)
powerdata <- read.table("./household_power_consumption.txt", stringsAsFactors = FALSE, header = TRUE, sep =";", na.strings="?")
powerdata$DateTime <- strptime(paste(powerdata$Date, powerdata$Time), format="%d/%m/%Y %H:%M:%S")
powerdata$Date=as.Date(powerdata$Date,format="%d/%m/%Y")
head(powerdata)

# remove all rows with NA
powerdata<-powerdata[complete.cases(powerdata),]

#create subset of data based on dates
subsetpowerdata<-subset(powerdata,Date == "2007-02-01" | Date == "2007-02-02")

#Plotting assignment
png("plot1.png", width=480, height=480)
#Plot1: X-Axis: Global Active Power vs frequency
hist(subsetpowerdata$Global_active_power, col="red",xlab = "Global Active Power(kilowatts)", main="Global Active Power")
dev.off()
}



