## Question 3 

# Of the four types of sources indicated by the type (point, nonpoint, onroad, nonroad) variable, which of these four sources have seen decreases in emissions from 1999–2008 for Baltimore City? Which have seen increases in emissions from 1999–2008? Use the ggplot2 plotting system to make a plot answer this question.

## Read in data (files already placed in working directory)

if(!exists("NEI")){
        NEI <- readRDS("summarySCC_PM25.rds")
}
if(!exists("SCC")){
        SCC <- readRDS("Source_Classification_Code.rds")
}

## Load the required library

library(ggplot2)

## Subset and aggregate the data

subNEI  <- NEI[NEI$fips=="24510", ]

allYearsAndTypesBaltimore <- aggregate(Emissions ~ year + type, subNEI, sum)

png("plot3.png", width=640, height=480)

g <- ggplot(allYearsAndTypesBaltimore, aes(year, Emissions, color = type))
g <- g + geom_line() + xlab("year") + ylab(expression('Total PM'[2.5]*" Emissions")) + ggtitle('Total Emissions in Baltimore City, Maryland (fips == "24510") from 1999 to 2008')


print(g)
dev.off()

## The answer is unclear for the 'point' data - emissions increased from 1999 to 2005, but then rapidly dropped between 2005 and 2008 to what looks like a similar level to 1999. All other emissions have dropped.

