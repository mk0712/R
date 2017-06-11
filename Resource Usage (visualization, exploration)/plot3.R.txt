#### Part 3: plot3.R

#### Load data:
data <- readRDS("R:/Online Courses/John Hopkins University - Data Science (Spring 2014)/Data Science Specialization/04_Exploratory_Data_Analysis/Course_Project_2/exdata-data-NEI_data/summarySCC_PM25.rds")

### Filter relevant data
emissions <- data[data$fips == "24510" & (data$year==1999|data$year==2002|data$year==2005|data$year==2008),4:6]

#### Compute:
emissions <- tapply(emissions$Emissions,list(emissions$year,emissions$type),sum)
emissions <- as.data.frame(as.table(emissions))

#### Create plot3.png:
png("plot3.png",width=480,height=480,units="px")
library(ggplot2)
qplot(Var1,Freq,data=emissions,group=Var2, geom="line", colour=Var2,main='Total Emissions by Type, Baltimore City',xlab='Year',ylab='Total Emissions')
dev.off()