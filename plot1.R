# Read table from working directory, subset relevant data

all <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?")
data <- subset(all, (all$Date == "1/2/2007") | (all$Date == "2/2/2007"))

# Convert Date and Time to proper classes

data$Date <- as.Date(data$Date, format = "%d/%m/%Y")
data$Time <- strptime(paste(data$Date, data$Time, sep = " "), "%Y-%m-%d %H:%M:%S")

# Create plot1.png

png("plot1.png", width = 480, height = 480)
hist(data[,3], main = "Global Active Power", xlab = "Global Active Power (kilowatts)", col = "orangered")
dev.off()