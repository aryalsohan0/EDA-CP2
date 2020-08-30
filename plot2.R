# Reading data

NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

# Create data frame containing only Baltimore data and calculating yearwise total emissions


baltimoreNEI <- NEI %>% 
        filter(fips == "24510") %>% 
        group_by(year) %>% 
        summarise(Yearly_Emissions = sum(Emissions))


# Plotting data 
png("plot2.png", height = 480, width = 480)

barplot(baltimoreNEI$Yearly_Emissions,
        names.arg = YE$year,
        xlab = "Years",
        ylab = "Total emissions in year in Baltimore",
        main = "Total PM2.5 Emissions over the years in Baltimore")
dev.off()



