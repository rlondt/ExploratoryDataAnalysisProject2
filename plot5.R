source('general_script.R')

# extracting data
subsetNEI <- NEI[NEI$fips=="24510" & NEI$type=="ON-ROAD",  ]
aggregatedTotalByYear <- aggregate(Emissions ~ year, subsetNEI, sum)

#plotting
png("plot5.png", width=640, height=480)
g <- ggplot(aggregatedTotalByYear, aes(factor(year), Emissions))
g <- g + 
  geom_bar(stat="identity") +
  xlab("year") +
  ylab("total PM2.5 emission") +
  ggtitle('Total Emissions from motor vehicle in Baltimore City, Maryland from 1999 to 2008')
print(g)
dev.off()

