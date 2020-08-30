# Reading data

NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")


# Creating data frame for coal combustion related sources

combustionRelated <- grepl("comb", SCC$SCC.Level.One, ignore.case=TRUE)
coalRelated <- grepl("coal", SCC$SCC.Level.Four, ignore.case=TRUE) 
coalCombustion <- (combustionRelated & coalRelated)
combustionSCC <- SCC[coalCombustion,]$SCC
combustionNEI <- NEI[NEI$SCC %in% combustionSCC,]


# Creating plot
library(ggplot2)

png("plot4.png", height = 480, width = 480)


ggplot(combustionNEI,aes(x = factor(year),y = Emissions/10^5)) +
        geom_bar(stat="identity", fill ="blue", width=0.75) +
        labs(x="year", y=expression("Total PM2.5 Emission  in 10^5 Tons")) + 
        labs(title=expression("PM2.5 Coal Combustion Source Emissions Across US from 1999 to 2008"))

dev.off()

