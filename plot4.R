## Assumes that the unziped datafile household_power_consumption.txt is in working directory:
data <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?")

## Subsets data to include only the two required dates
data <- subset(data, Date == "1/2/2007" | Date == "2/2/2007")

## Creates a date/time vector
datetime <- paste(data$Date, data$Time)
datetime <- strptime(datetime, format = "%d/%m/%Y %H:%M:%S")


## Plot no. 4

# Makes sure weekdays are in English
Sys.setlocale("LC_TIME", "English")

png('plot4.png', width = 480, height = 480, units = "px")

par(mfrow = c(2,2))

# First subplot 
plot(datetime, data$Global_active_power, 
     xlab = "",
     ylab = "Global Active Power",
     type = "l")

# Second subplot
plot(datetime, data$Voltage, 
     xlab = "datetime",
     ylab = "Voltage",
     type = "l")

# Third subplot
plot(x = c(min(datetime), max(datetime)), 
     y = c(min(data$Sub_metering_1), max(data$Sub_metering_1)), 
     xlab = "",
     ylab = "Energy sub metering", 
     type = "n")

lines(datetime, data$Sub_metering_1, col = "black")
lines(datetime, data$Sub_metering_2, col = "red")
lines(datetime, data$Sub_metering_3, col = "blue")

labels <- names(data[7:9])
colors <- c("black", "red", "blue")
legend(x = "topright", inset=0.01, labels, col = colors, lty = c(1, 1, 1), box.lty = 0)

# Fourth subplot
plot(datetime, data$Global_reactive_power, 
     xlab = "datetime",
     ylab = "Global_reactive_power",
     type = "l")


dev.off()

