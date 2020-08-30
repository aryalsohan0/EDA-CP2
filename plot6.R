# Reading data

NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")


# Creating data frame with emissions from motor vehicle sources

vehicles <- grepl("vehicle", SCC$SCC.Level.Two, ignore.case=TRUE)
vehiclesSCC <- SCC[vehicles,]$SCC
vehiclesNEI <- NEI[NEI$SCC %in% vehiclesSCC,]

vehiclesNEI <- vehiclesNEI %>% 
        filter(fips=="06037" | fips=="24510")

# Adding new variables city

vehiclesNEI$city <- ifelse(vehiclesNEI$fips == "24510", "Baltimore City", "LA County")


# Plotting

library(ggplot2)

png("plot6.png", height = 480, width = 480)

ggplot(vehiclesNEI, aes(x=factor(year), y=Emissions, fill=city)) +
        geom_bar(aes(fill=year),stat="identity") +
        facet_grid(scales="free", space="free", .~city) +
        labs(x="year", y=expression("Total PM2.5 Emission in Kilo-Tons")) + 
        labs(title=expression("PM2.5 Motor Vehicle Source Emissions in Baltimore & LA, 1999 to 2008"))

dev.off()











