source('general_script.R')

#Extracting data
subsetNEI  <- NEI[NEI$fips=="24510", ]
aggregatedTotalByYearAndType <- aggregate(Emissions ~ year + type, subsetNEI, sum)

#Plotting
png("plot3.png", width=640, height=480)
g <- ggplot(aggregatedTotalByYearAndType, aes(year, Emissions, color = type))
g <- g +
  geom_line() +
  xlab("year") +
  ylab("total PM2.5 emission") +
  ggtitle(expression( atop("Total Emissions in Baltimore City, Maryland from 1999 to 2008"
                    , atop(italic("Only the POINT-type shows an increase over the years"), ""))))  +
  theme( axis.text.x = element_text(angle=-45, hjust=0, vjust=1)
       , plot.title = element_text(size = 15, face = "bold", colour = "black", vjust = -1)
  )
print(g)
dev.off()
