#### Part 5: plot5.R

#### Load data:
data <- readRDS("R:/Online Courses/John Hopkins University - Data Science (Spring 2014)/Data Science Specialization/04_Exploratory_Data_Analysis/Course_Project_2/exdata-data-NEI_data/summarySCC_PM25.rds")

#### Filter type "on-road" for motor vehicles
emissions <- data[data$type == "ON-ROAD" & data$fips == "24510" 
                  & (data$year==1999|data$year==2002|data$year==2005|data$year==2008),c(4,6)]
sums <- tapply(emissions$Emissions, emissions$year, sum)

#### Create plot5.png:
png("plot5.png",width=480,height=480,units="px")
plot(as.numeric(names(sums)), as.numeric(sums), type='l', main='Total Emissions, motor vehicle Baltimore City',
     xlab='Year', ylab='Total Emissions')
dev.off()
