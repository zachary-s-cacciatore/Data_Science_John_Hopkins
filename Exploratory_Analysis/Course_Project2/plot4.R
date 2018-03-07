# Read in data
NEI <- readRDS("summarySCC_PM25.rds")
SCC<- readRDS("Source_Classification_Code.rds")

## Extract coal combustion related sources
coal_codes <- SCC$SCC[grep("coal", SCC$EI.Sector, ignore.case = TRUE)]

coal_SCC <- subset(NEI, SCC %in% coal_codes)

# Aggregate sum of emissions by year
sum_emissions <- aggregate(Emissions~year, coal_SCC, sum)


# Plot values
with(sum_emissions, plot(year, Emissions
                         , xlab = "Year", ylab = "Total Emissions", type = "l"
                         , main = "Total Emissions for Coal Combustion Sources"))

# Copy plot to PNG file
dev.copy(png, file = "plot4.png")

# Close PNG device
dev.off()