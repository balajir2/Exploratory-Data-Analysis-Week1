Plot4<-function(){
  # Set working directory
  setwd("D:/2020/Education/Data Science/Course 4/Week 1/Project")
  # read the file into a data frame
  
  # Include Library lubridate for date time functions
  library(lubridate)
  
  # Read the file
  powerdata <- read.table("./household_power_consumption.txt", stringsAsFactors = FALSE, header = TRUE, sep =";", na.strings="?")
  
  #take only complete rows excluding NA
  powerdata<-powerdata[complete.cases(powerdata),]
  
  #create a new column that merges date and time
  powerdata$DateTime <- strptime(paste(powerdata$Date, powerdata$Time), format="%d/%m/%Y %H:%M:%S")
  
  #convert the Date column in a usable format
  powerdata$Date=as.Date(powerdata$Date,format="%d/%m/%Y")
  
  #subset the data for the 2 dates
  subsetpowerdata<-subset(powerdata,Date == "2007-02-01" | Date == "2007-02-02")
  
  # making sure the Global_active_power is numeric
  subsetpowerdata$Global_active_power=as.numeric(subsetpowerdata$Global_active_power)
  
  subsetpowerdata$Sub_metering_1 <- as.numeric(subsetpowerdata$Sub_metering_1)
  subsetpowerdata$Sub_metering_2 <- as.numeric(subsetpowerdata$Sub_metering_2)
  subsetpowerdata$Sub_metering_3 <- as.numeric(subsetpowerdata$Sub_metering_3)
  
  # Create the device and plot the curve
  png("plot4.png", width=480, height=480)
  
  par(mfrow=c(2,2))
  plot(x=subsetpowerdata$DateTime,y=subsetpowerdata$Global_active_power, type="l",xlab="",ylab="Global Active Power (kilowatts)")
  plot(x=subsetpowerdata$DateTime,y=subsetpowerdata$Voltage, type="l",xlab="",ylab="Voltage")
  
  
  with(subsetpowerdata, plot(DateTime, Sub_metering_1, type="l", xlab="Day", ylab="Energy sub metering"))
  lines(subsetpowerdata$DateTime, subsetpowerdata$Sub_metering_2,type="l", col= "red")
  lines(subsetpowerdata$DateTime, subsetpowerdata$Sub_metering_3,type="l", col= "blue")
  legend(c("topright"), c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty= 1, lwd=2, col = c("black", "red", "blue"))
  
  plot(x=subsetpowerdata$DateTime,y=subsetpowerdata$Global_reactive_power, type="l",xlab="datetime",ylab="Global_reactive_power")
  
  
  dev.off()
  
  
}
