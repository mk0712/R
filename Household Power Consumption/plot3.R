# Part 3: plot3.R

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

# Create plot3.png
png(file = "plot3.png")
plot(dataframe$DateTime, dataframe$Sub_metering_1, type = "n", xlab = "", ylab = "Energy sub metering")
lines(dataframe$DateTime, dataframe$Sub_metering_1, col = "black")
lines(dataframe$DateTime, dataframe$Sub_metering_2, col = "red")
lines(dataframe$DateTime, dataframe$Sub_metering_3, col = "blue")
legend("topright", lty = 1, col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
dev.off()