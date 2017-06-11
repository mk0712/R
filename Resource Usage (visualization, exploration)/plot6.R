#### Part 6: plot6.R

#### Load data:
data <- readRDS("R:/Online Courses/John Hopkins University - Data Science (Spring 2014)/Data Science Specialization/04_Exploratory_Data_Analysis/Course_Project_2/exdata-data-NEI_data/summarySCC_PM25.rds")

#### Filter type "on-road" for motor vehicles
emissions <- data[data$type == "ON-ROAD" & (data$fips == "24510"|data$fips == "06037") 
                  & (data$year==1999|data$year==2002|data$year==2005|data$year==2008),]
emissions <- tapply(emissions$Emissions, list( emissions$year, emissions$fips ), sum)
emissions <- as.data.frame( as.table(emissions) )

#### Adjust columnnames:
colnames(emissions) <- c('Year', 'City','Emissions')
emissions$City <- as.character(emissions$City)

#### Adjust code:
emissions$City[emissions$City=='24510'] <- 'Baltimore City'
emissions$City[emissions$City=='06037'] <- 'Los Angeles County'

##### Normalize data to allow for comparison. This approach has been recommended in the discussion forums!
emissions$RelativeEmissions[emissions$City=='Baltimore City'] <- emissions$Emissions[emissions$City=='Baltimore City']/(emissions[emissions$City=='Baltimore City' & emissions$Year == 1999,3])
emissions$RelativeEmissions[emissions$City=='Los Angeles County'] <- emissions$Emissions[emissions$City=='Los Angeles County']/(emissions[emissions$City=='Los Angeles County' & emissions$Year == 1999,3])

#### Create plot6.png:
png("plot6.png",width=480,height=480,units="px")
library(ggplot2)
qplot(Year, RelativeEmissions, data=emissions, group=City, 
      geom="line", colour=City, main='Normalized Total Emissions by Type, Baltimore City',
      xlab='Year', ylab='Normalized Emissions, level = 1 in 1999')
dev.off()
