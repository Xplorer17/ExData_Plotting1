## reading data
hpc <- read.csv("household_power_consumption.txt", sep = ";", stringsAsFactors = FALSE, na.strings = "?", header = T, nrows = 10)
ccl <- sapply(hpc, class)
hpcc <- read.csv("household_power_consumption.txt", sep = ";", stringsAsFactors = FALSE, na.strings = "?", header = T, colClasses = ccl)

## formatting dates
hpcc$dt <- paste(hpcc$Date, hpcc$Time, " ")
hpcc$fdt <- strptime(hpcc$dt, format = "%d/%m/%Y %H:%M:%S")

## subsetting data to include records of only two dates
dhpc <- subset(hpcc, fdt >= "2007-02-01" & fdt < "2007-02-03")

## opening png device
png(filename = "Plot3.png", width = 480, height = 480, units = "px")

## creating plot
plot(dhpc$fdt, dhpc$Sub_metering_1, type = 'l', xlab = "", ylab = "Energy sub metering")
lines(dhpc$fdt, dhpc$Sub_metering_2, col = "red")
lines(dhpc$fdt, dhpc$Sub_metering_3, col = "blue")
legend("topright", lty = 1, col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

## closing png device
dev.off()
