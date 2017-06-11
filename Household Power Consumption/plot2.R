# Part 2: plot2.R

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

# Create plot2.png
plot(dataframe$DateTime, dataframe$Global_active_power, type = "n", xlab = "", ylab = "Global Active Power (kilowatts)")
lines(dataframe$DateTime, dataframe$Global_active_power)
dev.copy(png, file = "plot2.png")
dev.off()