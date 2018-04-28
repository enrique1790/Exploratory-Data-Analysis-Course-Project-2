if (!exists("NEI")) {
  NEI <- readRDS("summarySCC_PM25.rds") 
}

if (!exists("SCC")) {
  SCC <- readRDS("Source_Classification_Code.rds")
}

#######################################################################
# 2. Have total emissions from PM2.5 decreased in the Baltimore City, 
#Maryland (fips == "24510") from 1999 to 2008? Use the base plotting 
#system to make a plot answering this question.
######################################################################

subsetNEI  <- NEI[NEI$fips=="24510", ]
AggregatedTotalByYear <- aggregate(Emissions ~ year, subsetNEI, sum)

barplot(height=AggregatedTotalByYear$Emissions, names.arg=AggregatedTotalByYear$year, 
        xlab="years", ylab=expression('total PM'[2.5]*' emission'),
        main=expression('Total PM'[2.5]*' in the Baltimore City, MD emissions at various years'))

dev.copy(png, file="plot2.png", width=480, height=480)
dev.off()

# not a consistant downtrend data showed a spike in emissions around 2005.