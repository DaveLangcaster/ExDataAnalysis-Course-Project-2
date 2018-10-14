## Question 5

# How have emissions from motor vehicle sources changed from 1999–2008 in Baltimore City?
        
## Load the required library

library(ggplot2)

## Merge the two data sets

NEISCC <- merge(NEI, SCC, by="SCC")

## Subset the data

subNEI <- NEI[NEI$fips=="24510" & NEI$type=="ON-ROAD",  ]

## Aggregate the data

allYearsBaltimoreVehicles <- aggregate(Emissions ~ year, subNEI, sum)

## Plot the data

png("plot5.png", width=840, height=480)
g <- ggplot(allYearsBaltimoreVehicles, aes(factor(year), Emissions))
g <- g + geom_bar(stat="identity") + xlab("year") + ylab(expression('Total PM'[2.5]*" Emissions")) + ggtitle('Total Emissions from motor vehicle (type = ON-ROAD) in Baltimore City, Maryland (fips = "24510") from 1999 to 2008')

print(g)
dev.off()

## The answer is yes, emissions from motor vehicles have changed in Baltimore, they have reduced since 1999