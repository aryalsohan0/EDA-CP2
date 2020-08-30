# Reading data

NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")


# Creating data frame with emissions from motor vehicle sources

vehicles <- grepl("vehicle", SCC$SCC.Level.Two, ignore.case=TRUE)
vehiclesSCC <- SCC[vehicles,]$SCC
vehiclesNEI <- NEI[NEI$SCC %in% vehiclesSCC,]
baltimoreVehiclesNEI <- vehiclesNEI %>% 
        filter(fips == "24510")


# Plotting
library(ggplot2)

png("plot5.png", height = 480, width = 480)

ggplot(baltimoreVehiclesNEI,aes(factor(year),Emissions)) +
        geom_bar(stat="identity", fill ="blue" ,width=0.75) +
        labs(x="year", y=expression("Total PM2.5 Emission in 10^5 Tons")) + 
        labs(title=expression("PM2.5 Motor Vehicle Source Emissions in Baltimore from 1999 to 2008"))

dev.off()

