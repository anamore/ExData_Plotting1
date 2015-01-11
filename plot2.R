plot2<-function(){

   #  read data from text file (it is assumed that the text file already exists
   #  in the working directory) 
   data<-read.table("household_power_consumption.txt", header = TRUE, sep = ";", colClasses = "character",na.strings = "?")
   data1<-data

   #  convert the Date and Time variables to Date/Time classes in R
   dates<-paste(data$Date,data$Time)
   dates<-strptime(dates, "%d/%m/%Y %H:%M:%S")
   data1$Time<-dates
   data1<-data1[,2:9] 

   # subsetting to specific dates
   data1<-data1[data1$Time>="2007-02-01 00:00:00",]
   data1<-data1[data1$Time<="2007-02-02 23:59:59",]

   # coerce plotted data to numeric
   data1$Global_active_power<-as.numeric(data1$Global_active_power)
   data1$Global_reactive_power<-as.numeric(data1$Global_reactive_power)
   data1$Voltage<-as.numeric(data1$Voltage)
   data1$Global_intensity<-as.numeric(data1$Global_intensity)
   data1$Sub_metering_1<-as.numeric(data1$Sub_metering_1)
   data1$Sub_metering_2<-as.numeric(data1$Sub_metering_2)
   data1$Sub_metering_3<-as.numeric(data1$Sub_metering_3)

   # specify device and create plot
   png(file="plot2.png",width = 480, height = 480, units = "px", bg = "transparent")
   plot(x=data1$Time, y=data1$Global_active_power,type="l",xlab="", ylab="Global Active Power (kilowatts)")
   dev.off()

}