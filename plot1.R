## Data source. Uncomment to download again:

# download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip", "power.zip")

## Assumes that the unziped datafile household_power_consumption.txt is in working directory:
data <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?")

## Subsets data to include only the two required dates
data <- subset(data, Date == "1/2/2007" | Date == "2/2/2007")

## Creates a date/time vector
datetime <- paste(data$Date, data$Time)
datetime <- strptime(datetime, format = "%d/%m/%Y %H:%M:%S")

## Plot no. 1
png('plot1.png', width = 480, height = 480, units = "px")

hist(data$Global_active_power, 
     main = "Global Active Power", 
     xlab = "Global Active Power (kilowatts)",
     col = "red")

dev.off()