## Question 6

# Compare emissions from motor vehicle sources in Baltimore City with emissions from motor vehicle sources in Los Angeles County, California (fips == "06037"). Which city has seen greater changes over time in motor vehicle emissions?
        
## Load the required library

library(ggplot2)

## Merge the two data sets

NEISCC <- merge(NEI, SCC, by="SCC")

## Subset the data

subNEI <- NEI[(NEI$fips=="24510"|NEI$fips=="06037") & NEI$type=="ON-ROAD",  ]

## Aggregate the data

allYearsBaltimoreLAVehicles <- aggregate(Emissions ~ year + fips, subNEI, sum)
allYearsBaltimoreLAVehicles$fips[allYearsBaltimoreLAVehicles$fips=="24510"] <- "Baltimore, MD"
allYearsBaltimoreLAVehicles$fips[allYearsBaltimoreLAVehicles$fips=="06037"] <- "Los Angeles, CA"

## Plot the data

png("plot6.png", width=1040, height=480)
g <- ggplot(allYearsBaltimoreLAVehicles, aes(factor(year), Emissions))
g <- g + facet_grid(. ~ fips)
g <- g + geom_bar(stat="identity")  + xlab("year") + ylab(expression('Total PM'[2.5]*" Emissions")) + ggtitle('Total Emissions from motor vehicle (type=ON-ROAD) in Baltimore City, MD (fips = "24510") vs Los Angeles, CA (fips = "06037")  1999-2008')

print(g)
dev.off()

## The answer is that LA has seen the greater changes over time, but the baseline was higher, and there was an increase from 1999 to 2005, and levels then dropped from 2005 to 2008.