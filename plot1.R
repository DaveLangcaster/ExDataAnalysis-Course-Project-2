## Question 1

# Have total emissions from PM2.5 decreased in the United States from 1999 to 2008? Using the base plotting system, make a plot showing the total PM2.5 emission from all sources for each of the years 1999, 2002, 2005, and 2008.

## Read in data (files already placed in working directory)

if(!exists("NEI")){
        NEI <- readRDS("summarySCC_PM25.rds")
}
if(!exists("SCC")){
        SCC <- readRDS("Source_Classification_Code.rds")
}

## Aggregate the data 

allYears <- aggregate(Emissions~year,data = NEI,FUN = sum)

## Plot the data

png('plot1.png')

barplot(height=allYears$Emissions, names.arg=allYears$year, xlab="years", ylab=expression('total PM'[2.5]*' emission'),main=expression('Total PM'[2.5]*' emissions at various years'))

dev.off()

## The answer is yes, total PM2.5 emissions have decreased