if (!exists("NEI")) {
  NEI <- readRDS("summarySCC_PM25.rds") 
}

if (!exists("SCC")) {
  SCC <- readRDS("Source_Classification_Code.rds")
}


##############################################################################
# 4. Across the United States, how have emissions from coal combustion-related 
#sources changed from 1999–2008?
##############################################################################

# merge the two data sets 
NEISCC <- merge(NEI, SCC, by="SCC")


coalMatches  <- grepl("coal", NEISCC$Short.Name, ignore.case=TRUE)
subsetNEISCC <- NEISCC[coalMatches, ]

aggregatedTotalByYear <- aggregate(Emissions ~ year, subsetNEISCC, sum)


g <- ggplot(aggregatedTotalByYear, aes(factor(year), Emissions))
g <- g + geom_bar(stat="identity") +
  xlab("year") +
  ylab(expression('Total PM'[2.5]*" Emissions")) +
  ggtitle('Total Emissions from coal sources from 1999 to 2008')
print(g)

dev.copy(png, file="plot4.png", width=480, height=480)
dev.off()
#emissions from coal combustion-relates sources havee decrease especially from 2005 to 2008.
