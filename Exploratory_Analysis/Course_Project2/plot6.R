# Read in data
NEI <- readRDS("summarySCC_PM25.rds")
SCC<- readRDS("Source_Classification_Code.rds")

# Subset data into only Maryland and California
data <- NEI[with(NEI, fips == "06037"| fips=="24510"), ]

# Extract motor vehicle sources
on_road <- subset(SCC, Data.Category == "Onroad")
motor_codes <- on_road$SCC

# Subset data with motor codes
motor_data <- subset(data, SCC %in% motor_codes)

# Aggregate sum of emissions by year
sum_emissions <- aggregate(Emissions~year + fips, motor_data, sum)

# Load ggplot2 library
library(ggplot2)

# Plot the values
g <- ggplot(sum_emissions, aes(year, Emissions))
g + facet_grid(.~fips) + geom_line()

# Copy plot to PNG file
dev.copy(png, file = "plot6.png")

# Close PNG device
dev.off()

