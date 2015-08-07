# Read table from working directory, subset relevant data

all <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?")
data <- subset(all, (all$Date == "1/2/2007") | (all$Date == "2/2/2007"))

# Convert Date and Time to proper classes

data$Date <- as.Date(data$Date, format = "%d/%m/%Y")
data$Time <- strptime(paste(data$Date, data$Time, sep = " "), "%Y-%m-%d %H:%M:%S")

# Create plot3.png

png("plot3.png", width = 480, height = 480)
plot(data$Time, data$Sub_metering_1,type = "l", xlab = "", ylab = "Energy sub metering")
lines(data$Time, data$Sub_metering_2, type = "l", col = "red")
lines(data$Time, data$Sub_metering_3, type = "l", col = "blue")
legend(x = "topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty = 1, col = c("black", "red", "blue"))
dev.off()