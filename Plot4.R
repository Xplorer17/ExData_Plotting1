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
png(filename = "Plot4.png", width = 480, height = 480, units = "px")

## setting parameters
par(mfrow = c(2,2))

## creating plot
plot(dhpc$fdt, dhpc$Global_active_power, type = 'l', xlab = "", ylab = "Global Active Power")
plot(dhpc$fdt, dhpc$Voltage, type = 'l', xlab = "datetime", ylab = "Voltage")
plot(dhpc$fdt, dhpc$Sub_metering_1, type = 'l', xlab = "", ylab = "Energy sub metering")
lines(dhpc$fdt, dhpc$Sub_metering_2, col = "red")
lines(dhpc$fdt, dhpc$Sub_metering_3, col = "blue")
legend("topright", lty = 1, col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), bty = "n", pt.cex = 1, cex = .9)
plot(dhpc$fdt, dhpc$Global_reactive_power, xlab = "datetime", ylab = "Global_reactive_power", type = "l")

## closing png device
dev.off()
