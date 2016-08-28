source('general_script.R')

# extracting data
subsetNEI <- NEI[(NEI$fips=="24510"|NEI$fips=="06037") & NEI$type=="ON-ROAD",  ]
aggregatedTotalByYearAndFips <- aggregate(Emissions ~ year + fips, subsetNEI, sum)

# relabel
aggregatedTotalByYearAndFips$fips[aggregatedTotalByYearAndFips$fips=="24510"] <- "Baltimore, MD"
aggregatedTotalByYearAndFips$fips[aggregatedTotalByYearAndFips$fips=="06037"] <- "Los Angeles, CA"


#plotting
png("plot6.png", width=1040, height=480)
g <- ggplot(aggregatedTotalByYearAndFips, aes(factor(year), Emissions))
g <- g + 
  facet_grid(. ~ fips) +
  geom_bar(stat="identity")  +
  xlab("year") +
  ylab("total PM2.5 emission") +
  ggtitle('Total Emissions from motor vehicle in Baltimore City, MD vs Los Angeles, CA 1999-2008')
print(g)
dev.off()