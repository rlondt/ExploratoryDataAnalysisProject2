source('general_script.R')

#Extracting data
rowsMatchingCoal <- grepl("coal", NEISCC$Short.Name, ignore.case=TRUE)
subsetNEISCC     <- NEISCC[rowsMatchingCoal, ]
aggregatedTotalByYear <- aggregate(Emissions ~ year, subsetNEISCC, sum)

#Plotting
png("plot4.png", width=640, height=480)
g <- ggplot(aggregatedTotalByYear, aes(factor(year), Emissions))
g <- g +
  geom_bar(stat="identity") +
  xlab("year") +
  ylab("total PM2.5 emission") +
  ggtitle('Total Emissions from coal sources from 1999 to 2008')
print(g)
dev.off()
