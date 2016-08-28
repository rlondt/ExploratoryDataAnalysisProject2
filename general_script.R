# Download file if not available
if (!file.exists("summarySCC_PM25.rds")) { 
  ## Downloading and unzipping file
  temp <- tempfile()
  download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2FNEI_data.zip",temp)
  unzip(temp, exdir ="./")
}

# Initial filling of projectwide-datasets
if(!exists("NEI")){
  NEI <- readRDS("./summarySCC_PM25.rds")
}
if(!exists("SCC")){
  SCC <- readRDS("./Source_Classification_Code.rds")
}
if(!exists("NEISCC")){
  NEISCC <- merge(NEI, SCC, by="SCC")
}

library(ggplot2)
