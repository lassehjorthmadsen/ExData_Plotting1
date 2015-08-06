## Assumes that the unziped datafile household_power_consumption.txt is in working directory:
data <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?")

## Subsets data to include only the two required dates
data <- subset(data, Date == "1/2/2007" | Date == "2/2/2007")

## Creates a date/time vector
datetime <- paste(data$Date, data$Time)
datetime <- strptime(datetime, format = "%d/%m/%Y %H:%M:%S")

## Plot no. 2

# Makes sure weekdays are in English
Sys.setlocale("LC_TIME", "English")

png('plot2.png', width = 480, height = 480, units = "px")

plot(datetime, data$Global_active_power, 
     xlab = "",
     ylab = "Global Active Power (kilowatts)",
     type = "l")

dev.off()
