## Question 2

# Have total emissions from PM2.5 decreased in the Baltimore City, Maryland (fips == "24510")from 1999 to 2008? Use the base plotting system to make a plot answering this question.

## Read in data (files already placed in working directory)

if(!exists("NEI")){
        NEI <- readRDS("summarySCC_PM25.rds")
}
if(!exists("SCC")){
        SCC <- readRDS("Source_Classification_Code.rds")
}

## Subset and aggregate the data

subNEI  <- NEI[NEI$fips=="24510", ]

allYearsBaltimore <- aggregate(Emissions ~ year, subNEI, sum)

## Plot the data

png('plot2.png')

barplot(height=allYearsBaltimore$Emissions, names.arg=allYearsBaltimore$year, xlab="years", ylab=expression('total PM'[2.5]*' emission'),main=expression('Total PM'[2.5]*' in the Baltimore City, MD emissions at various years'))

dev.off()

## The answer is yes, in general the emissions have decreased, but there was a spike in 2005.