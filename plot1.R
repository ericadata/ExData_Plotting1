setwd("./ExData_Plotting1")

header <- read.table("exdata-data-household_power_consumption/household_power_consumption.txt",
                     header = T, sep = ";", nrows = 1)

hpc <- read.table("exdata-data-household_power_consumption/household_power_consumption.txt",
                  sep = ";", skip = 66637, nrows = 2880, na.strings = "?")

names(hpc) <- names(header)

png("plot1.png")
hist(hpc$Global_active_power, main = "Global Active Power",
     xlab = "Global Active Power (kilowatts)", col ="red")
dev.off()