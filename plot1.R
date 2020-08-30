# Reading data

NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")


# Create data frame  yearly emission (YE)

install.packages("tidyverse")
library(tidyverse)

YE <- NEI %>% 
        group_by(year) %>% 
        summarise(Yearly_Emissions = sum(Emissions))


# plotting yearly total emissions

png("plot1.png", height = 480, width = 480)

barplot((YE$Yearly_Emissions)/10^6,
        names.arg = YE$year,
        xlab = "Years",
        ylab = "Total emissions in year (* 10^6)",
        main = "Total PM2.5 Emissions over the years")
dev.off()


# We can see from the plot that total emissions have decreased over the years.



