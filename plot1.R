library(dplyr)
library(data.table)

setwd("C:/Users/Owner/Documents/Coursera_Exploratory_Data/data")

hhPower <- fread("household_power_consumption.txt", na.strings = "?", stringsAsFactors = FALSE)
twodays <- filter(hhPower, grep("^[1,2]/2/2007", Date))

png("plot1.png", width=480, height=480)
hist(twodays$Global_active_power, col = "red", main = "Global Active Power", 
     xlab = "Global Active Power (kilowatts)")
dev.off()
