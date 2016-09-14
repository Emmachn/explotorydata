rawdata <- read.table("household_power_consumption.txt", sep = ";", header = T, stringsAsFactors = FALSE, dec = ".")
rawdata <- subset(rawdata, data$Date %in% c("1/2/2007", "2/2/2007"))
rawdata$Global_active_power <- as.numeric(rawdata$Global_active_power)
      
png("plot_1.png", width = 480, height = 480)
hist(rawdata$Global_active_power, main = "Global_active_power", xlab = "Globle active power(kilowatts)", ylab = "Frequency", col = "red")

dev.off()