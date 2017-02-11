# Use setwd() to get into the directory

# Read data 
data <- read.table("household_power_consumption.txt", header = TRUE, sep = ";",na.strings = "?",stringsAsFactors = FALSE)

# Convert Date column to "POSIXlt" and "POSIXct"
data$Date <- strptime(data$Date, "%d/%m/%Y")

# Get the subset for 2007 Feb 1 & 2
data.subset <- subset(data, data$Date >= "2007-02-01" & data$Date <= "2007-02-02")

# x axis vector
datetime <- strptime(paste(data.subset$Date, data.subset$Time, sep=" "), "%Y-%m-%d %H:%M:%S")

# Open png file device
png("plot4.png")

par(mfrow = c(2, 2)) 

# Plot 1
plot(datetime,data.subset$Global_active_power,type = "l",xlab="",ylab="Global Active Power")

# Plot 2
plot(datetime,data.subset$Voltage,type = "l",xlab="datetime",ylab="Voltage")

# Plot 3
# draw a canvas, using sub_metering_1 for Y axis as it has the biggest range
plot(datetime,data.subset$Sub_metering_1,type = "n",ylab="Energy sub metering", xlab="")

# draw lines for metering 1,2,3
lines(datetime,data.subset$Sub_metering_1, col="black")
lines(datetime,data.subset$Sub_metering_2, col="red")
lines(datetime,data.subset$Sub_metering_3, col="blue")

# legend
legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=2.5, col=c("black", "red", "blue"))

# Plot 4
plot(datetime,data.subset$Global_reactive_power,type = "l",xlab="datetime",ylab="Global_reactive_power")

# close png file device
dev.off()