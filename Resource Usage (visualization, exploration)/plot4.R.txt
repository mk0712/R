#### Part 4: plot4.R

#### Load data:
dataNei <- readRDS("R:/Online Courses/John Hopkins University - Data Science (Spring 2014)/Data Science Specialization/04_Exploratory_Data_Analysis/Course_Project_2/exdata-data-NEI_data/summarySCC_PM25.rds")
dataScc <- readRDS("R:/Online Courses/John Hopkins University - Data Science (Spring 2014)/Data Science Specialization/04_Exploratory_Data_Analysis/Course_Project_2/exdata-data-NEI_data/Source_Classification_Code.rds")

#### Filter:
emissions <- dataNei[dataNei$year==1999|dataNei$year==2002|dataNei$year==2005|dataNei$year==2008,c(4,6)]

#### Search coal and comb in the classification:
coal <- dataScc[grepl("comb.*coal|coal.*comb", dataScc$Short.Name,ignore.case=TRUE),1]

#### Filter:
emissions <- dataNei[ dataNei$SCC == coal & (dataNei$year==1999|dataNei$year==2002|dataNei$year==2005|dataNei$year==2008),c(4,6)]

#### Compute:
sums <- tapply(emissions$Emissions, emissions$year,sum)

#### Create plot4.png:
png("plot4.png", width=480, height=480, units="px")
plot(as.numeric(names(sums)), as.numeric(sums), type='l', main='Total Emissions, coal combustion USA',
     xlab='Year', ylab='Total Emissions')
dev.off()