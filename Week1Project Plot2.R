Plot2<-function(){
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
    
    
    # Create the device and plot the curve
    png("plot2.png", width=480, height=480)
    #Plot1: X-Axis: Global Active Power vs frequency
    plot(x=subsetpowerdata$DateTime,y=subsetpowerdata$Global_active_power, type="l",xlab="",ylab="Global Active Power (kilowatts)")
    dev.off()
  
    }