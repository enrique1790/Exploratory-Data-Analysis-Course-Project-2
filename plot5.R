if (!exists("NEI")) {
  NEI <- readRDS("summarySCC_PM25.rds") 
}

if (!exists("SCC")) {
  SCC <- readRDS("Source_Classification_Code.rds")
}

############################################################################################
# 5. How have emissions from motor vehicle sources changed from 1999–2008 in Baltimore City?
############################################################################################
 
# Subset the vehicles NEI data to Baltimore's fip & 
#Gather the subset of the NEI data which corresponds to vehicles
subsetNEI <- NEI[NEI$fips=="24510" & NEI$type=="ON-ROAD",  ]

aggregatedTotalByYear <- aggregate(Emissions ~ year, subsetNEI, sum)


g <- ggplot(aggregatedTotalByYear, aes(factor(year), Emissions))
g <- g + geom_bar(stat="identity") + 
  xlab("year") +
  ylab(expression('Total Tons of PM'[2.5]*" Emissions")) +
  ggtitle('Emissions in Baltimore City from Motor Vehicles from 1999 to 2008')
print(g)

dev.copy(png, file="plot5.png", width=480, height=480)
dev.off()

# Emissions from motor vehicles have declined from 1999-2008 in Baltimore City.