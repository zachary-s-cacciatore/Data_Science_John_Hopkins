# Read in data
NEI <- readRDS("summarySCC_PM25.rds")
SCC<- readRDS("Source_Classification_Code.rds")

# Aggregate sum of emissions by year
sum_emissions <- aggregate(Emissions~year, NEI, sum)

# Plot values
with(sum_emissions, plot(year, Emissions
                         , xlab = "Year", ylab = "Total Emissions", type = "l"
                         , main = "Total Emissions for Year"))

# Copy plot to PNG file
dev.copy(png, file = "plot1.png")

# Close PNG device
dev.off()