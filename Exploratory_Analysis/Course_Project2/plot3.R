# Read in data
NEI <- readRDS("summarySCC_PM25.rds")
SCC<- readRDS("Source_Classification_Code.rds")

# Subset data into only Maryland
data_maryland <- NEI[NEI$fips == "24510", ]

#Aggregate sum of emissions by year
sum_emissions <- aggregate(Emissions~year + type, data_maryland, sum)

# Load ggplot2 library
library(ggplot2)

# Plot the values
g <- ggplot(sum_emissions, aes(year, Emissions))
g + facet_grid(.~type) + geom_line()

# Copy plot to PNG file
dev.copy(png, file = "plot3.png")

# Close PNG device
dev.off()