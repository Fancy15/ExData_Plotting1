library(dplyr)
library(data.table)

setwd("C:/Users/Owner/Documents/Coursera_Exploratory_Data/data")

hhPower <- fread("household_power_consumption.txt", na.strings = "?", stringsAsFactors = FALSE)
twodays <- filter(hhPower, grep("^[1,2]/2/2007", Date))

datetime <- strptime(paste(twodays$Date, twodays$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
png("plot3.png", width=480, height=480)
plot(datetime, twodays$Sub_metering_1, type = "l", xlab = "", ylab = "Energy sub metering")
lines(datetime, twodays$Sub_metering_2, type="l", col="red")
lines(datetime, twodays$Sub_metering_3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, col=c("black", "red", "blue"))
dev.off()
