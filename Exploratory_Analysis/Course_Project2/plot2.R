# Read in data
NEI <- readRDS("summarySCC_PM25.rds")
SCC<- readRDS("Source_Classification_Code.rds")

# Subset data into only Maryland
data_maryland <- NEI[NEI$fips == "24510", ]

#Aggregate sum of emissions by year
sum_emissions <- aggregate(Emissions~year, data_maryland, sum)

# Plot values
with(sum_emissions, plot(year, Emissions
                         , xlab = "Year", ylab = "Total Emissions", type = "l"
                         , main = "Total Emissions for Baltimore City, Marlyand 1998-2008"))

# Copy plot to PNG file
dev.copy(png, file = "plot2.png")

# Close PNG device
dev.off()

