############################
#Unzipping and Loading Files
############################

library("data.table")
path <- getwd()
download.file(url = "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2FNEI_data.zip"
              , destfile = paste(path, "dataFiles.zip", sep = "/"))
unzip(zipfile = "dataFiles.zip")

if (!exists("NEI")) {
  # print("Loading NEI Data, please wait.")
  NEI <- readRDS("summarySCC_PM25.rds") 
}

if (!exists("SCC")) {
  # print("Loading SCC Data.")
  SCC <- readRDS("Source_Classification_Code.rds")
}

#######################################################################################
# 1. Have total emissions from PM2.5 decreased in the United States from 1999 to 2008? 
#Using the base plotting system, make a plot showing the total PM2.5 emission from 
#all sources for each of the years 1999, 2002, 2005, and 2008.
#######################################################################################
aggregatedTotalByYear <- aggregate(Emissions ~ year, NEI, sum)


barplot(height=aggregatedTotalByYear$Emissions, names.arg=aggregatedTotalByYear$year, 
        xlab="years", ylab=expression('total PM'[2.5]*' emission'),
        main=expression('Total PM'[2.5]*' emissions at various years'))


dev.copy(png, file="plot1.png", width=480, height=480)
dev.off()
# total emissions from PM2.5 decreased in the United States from 1999 to 2008.

