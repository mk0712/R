# Part 4: plot4.R

# Load data and filter to respective dates:

#### Load Data and Packages
dataframe <- read.table("R:/Online Courses/John Hopkins University - Data Science (Spring 2014)/Data Science Specialization/04_Exploratory_Data_Analysis/Course Project_1/exdata-data-household_power_consumption/household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?", comment.char = "")

#### Filter and remove col names
dataframe <- subset(dataframe, Date == "1/2/2007" | Date == "2/2/2007")
row.names(dataframe) <- NULL

#### Create Date objects based on the two columns (1) Date and (2) Time
dataframe$DateTime <- paste(dataframe$Date, dataframe$Time, sep = " ")
dataframe$DateTime <- strptime(dataframe$DateTime, format = "%d/%m/%Y %H:%M:%S")
dataframe <- dataframe[, !(names(dataframe) %in% c("Date", "Time"))]

# Create plot4.png
png(file = "plot4.png")
par(mfrow = c(2, 2))

plot(dataframe$DateTime, dataframe$Global_active_power, type = "n", xlab = "", ylab = "Global Active Power")
lines(dataframe$DateTime, dataframe$Global_active_power)

plot(dataframe$DateTime, dataframe$Voltage, type = "n", xlab = "datetime", ylab = "Voltage")
lines(dataframe$DateTime, dataframe$Voltage)

plot(dataframe$DateTime, dataframe$Sub_metering_1, type = "n", xlab = "", ylab = "Energy sub metering")
lines(dataframe$DateTime, dataframe$Sub_metering_1, col = "black")
lines(dataframe$DateTime, dataframe$Sub_metering_2, col = "red")
lines(dataframe$DateTime, dataframe$Sub_metering_3, col = "blue")
legend("topright", lty = 1, bty = "n", col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

plot(dataframe$DateTime, dataframe$Global_reactive_power, type = "n", xlab = "datetime", ylab = "Global_reactive_power")
lines(dataframe$DateTime, dataframe$Global_reactive_power)
dev.off()