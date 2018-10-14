## Question 4

# Across the United States, how have emissions from coal combustion-related sources changed from 1999–2008?

## Load the required library

library(ggplot2)

## Merge the two data sets

NEISCC <- merge(NEI, SCC, by="SCC")

## Subset the data for records with Short.Name = "coal"

coalRecords  <- grepl("coal", NEISCC$Short.Name, ignore.case=TRUE)
subNEISCC <- NEISCC[coalRecords, ]

## Aggregate the data

allYearsCoal <- aggregate(Emissions ~ year, subNEISCC, sum)

## Plot the data

png("plot4.png", width=640, height=480)
g <- ggplot(allYearsCoal, aes(factor(year), Emissions))
g <- g + geom_bar(stat="identity") + xlab("year") + ylab(expression('Total PM'[2.5]*" Emissions")) + ggtitle('Total Emissions from coal sources from 1999 to 2008')

print(g)
dev.off()

## The answer is yes, coal emissions have decreased across the US