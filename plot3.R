# Reading data

NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")


# Making data frame for baltimore city

baltimoreNEI2 <- NEI %>% 
        filter(fips == "24510")

# Plotting the changes in emission for different source type in baltimore
library(ggplot2)

png("plot3.png", height = 480, width = 480)


ggplot(baltimoreNEI2,aes(factor(year),Emissions,fill=type)) +
        geom_bar(stat="identity") +
        theme_bw() + guides(fill=FALSE)+
        facet_grid(.~type,scales = "free",space="free") + 
        labs(x="year", y=expression("Total PM2.5 Emission")) + 
        labs(title=expression("PM2.5 Emissions, Baltimore City 1999 to 2008 by Source Type"))

dev.off()
