path <- "/Users/emmasun/Desktop/explotorydata"
setwd(path)
rawdata<- read.table("household_power_consumption.txt", sep=";", header = T,
                  stringsAsFactors = FALSE, dec = ".")


rawdata<- subset(rawdata, rawdata$Date %in% c("1/2/2007","2/2/2007"))

rawdata$Global_active_power<- as.numeric(rawdata$Global_active_power)

datetime <- strptime(paste(rawdata$Date, rawdata$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 

png("Plot_2.png", width = 480, height = 480)

plot(datetime,rawdata$Global_active_power,type = "l", ylab = "Global Active Power(kilowatts)")
dev.off()



