# Read table from working directory, subset relevant data

all <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?")
data <- subset(all, (all$Date == "1/2/2007") | (all$Date == "2/2/2007"))

# Convert Date and Time to proper classes

data$Date <- as.Date(data$Date, format = "%d/%m/%Y")
data$Time <- strptime(paste(data$Date, data$Time, sep = " "), "%Y-%m-%d %H:%M:%S")

# Create plot2.png

png("plot2.png", width = 480, height = 480)
plot(data$Time, data$Global_active_power,type = "l", xlab = "", ylab = "Global Active Power (kilowatts)")
dev.off()