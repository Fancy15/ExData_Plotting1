library(dplyr)
library(data.table)

setwd("C:/Users/Owner/Documents/Coursera_Exploratory_Data/data")

hhPower <- fread("household_power_consumption.txt", na.strings = "?", stringsAsFactors = FALSE)
twodays <- filter(hhPower, grep("^[1,2]/2/2007", Date))

datetime <- strptime(paste(twodays$Date, twodays$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
png("plot2.png", width=480, height=480)
plot(datetime, twodays$Global_active_power, type = "l", xlab = "", ylab = "Global Active Power(kilowatts)")
dev.off()
