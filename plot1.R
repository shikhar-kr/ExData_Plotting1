# Use setwd() to get into the directory

# Read data 
data <- read.table("household_power_consumption.txt", header = TRUE, sep = ";",na.strings = "?",stringsAsFactors = FALSE)

# Convert Date column to "POSIXlt" and "POSIXct"
data$Date <- strptime(data$Date, "%d/%m/%Y")

# Get the subset for 2007 Feb 1 & 2
data.subset <- subset(data, data$Date >= "2007-02-01" & data$Date <= "2007-02-02")

# Open png file device
png("plot1.png")

# Make plot
hist(data.subset$Global_active_power, main="Global Active Power", col="red", xlab="Global Active Power (kilowatts)")

# close png file device
dev.off()