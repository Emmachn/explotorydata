path <- "/Users/emmasun/Desktop/explotorydata"
setwd(path)
rawdata<- read.table("household_power_consumption.txt", sep=";", header = T,
                     stringsAsFactors = FALSE, dec = ".")


rawdata<- subset(rawdata, rawdata$Date %in% c("1/2/2007","2/2/2007"))

rawdata$Global_active_power<- as.numeric(rawdata$Global_active_power)

datetime <- strptime(paste(rawdata$Date, rawdata$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 

rawdata$Sub_metering_1<- as.numeric(rawdata$Sub_metering_1)
rawdata$Sub_metering_2<- as.numeric(rawdata$Sub_metering_2)
rawdata$Sub_metering_3<- as.numeric(rawdata$Sub_metering_3)

png("Plot_3.png", width = 480, height = 480)
with(rawdata, {
  plot(datetime,rawdata$Sub_metering_1, type="l",
       ylab="Energy sub metering")
  lines(datetime,rawdata$Sub_metering_2,col='Red')
  lines(datetime,rawdata$Sub_metering_3,col='Blue')
})
legend("topright", col=c("black", "red", "blue"), 
       legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),lty = 1, lwd = 2)
dev.off()

