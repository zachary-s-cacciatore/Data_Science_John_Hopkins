# Read in data
NEI <- readRDS("summarySCC_PM25.rds")
SCC<- readRDS("Source_Classification_Code.rds")

# Subset data by Maryland
data_maryland <- NEI[NEI$fips == "24510", ]

# Extract motor vehicle sources
on_road <- subset(SCC, Data.Category == "Onroad")
motor_codes <- on_road$SCC

# Subset data with motor codes
maryland_motor <- subset(data_maryland, SCC %in% motor_codes)

# Aggregate sum of emissions by year
sum_emissions <- aggregate(Emissions~year, maryland_motor, sum)


# Plot values
with(sum_emissions, plot(year, Emissions
                         , xlab = "Year", ylab = "Total Emissions", type = "l"
                         , main = "Total Emissions for Motor Vehicle Sources in Baltimore City"))

# Copy plot to PNG file
dev.copy(png, file = "plot5.png")

# Close PNG device
dev.off()