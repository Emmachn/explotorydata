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

png(filename = 'Plot_4.png', width = 480, height = 480, units='px')
par(mfrow = c(2, 2))
plot(datetime, rawdata$Global_active_power, xlab = '', ylab = 'Global Active Power (kilowatt)', type = 'l')
plot(datetime, rawdata$Voltage, xlab = 'datetime', ylab = 'Voltage', type = 'l')
plot(datetime, rawdata$Sub_metering_1, xlab = '', ylab = 'Energy sub metering', type = 'l')
lines(datetime, rawdata$Sub_metering_2, col = 'red')
lines(datetime, rawdata$Sub_metering_3, col = 'blue')
legend('topright', col = c('black', 'red', 'blue'), legend = c('Sub_metering_1', 'Sub_metering_2', 'Sub_metering_3'), lwd = 1)
plot(datetime, rawdata$Global_reactive_power, xlab = 'datetime', ylab = 'Global_reactive_power', type = 'l')
dev.off()