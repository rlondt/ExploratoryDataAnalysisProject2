source('general_script.R')

#Extracting data
subsetNEI  <- NEI[NEI$fips=="24510", ]
aggregatedTotalByYear <- aggregate(Emissions ~ year, subsetNEI, sum)

#Plotting
png('plot2.png')
barplot( height=aggregatedTotalByYear$Emissions
       , names.arg=aggregatedTotalByYear$year
       , xlab="years"
       , ylab="total PM2.5 emission"
       , main="Total PM2.5 in the Baltimore City, MD emissions at various years"
       )
dev.off()