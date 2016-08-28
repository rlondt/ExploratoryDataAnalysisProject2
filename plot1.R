source('general_script.R')

#Extracting data
aggregatedTotalByYear <- aggregate(Emissions ~ year, NEI, sum)

#Plotting
png('plot1.png')
barplot( height=aggregatedTotalByYear$Emissions
       , names.arg=aggregatedTotalByYear$year
       , xlab="years"
       , ylab="total PM2.5 emission"
       , main="Total PM2.5 emissions has decreased over various years"
       )
dev.off()