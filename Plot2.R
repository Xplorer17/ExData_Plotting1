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
png(filename = "Plot2.png", width = 480, height = 480, units = "px")

## creating plot
plot(dhpc$fdt, dhpc$Global_active_power, type = 'l', xlab = "", ylab = "Global Active Power (kilowatts)")

## closing png device
dev.off()
