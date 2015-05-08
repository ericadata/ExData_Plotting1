# set working directory
setwd("./ExData_Plotting1")

# read in relevant data
header <- read.table("exdata-data-household_power_consumption/household_power_consumption.txt",
                     header = T, sep = ";", nrows = 1)

hpc <- read.table("exdata-data-household_power_consumption/household_power_consumption.txt",
            sep = ";", skip = 66637, nrows = 2880, na.strings = "?",
            stringsAsFactors= F)

names(hpc) <- names(header)

# concatenate date and time and change class to date
hpc$datetime <- strptime(paste(hpc$Date, hpc$Time), "%d/%m/%Y %H:%M:%S")

# create plot
png("plot2.png")
with(hpc, plot(datetime, Global_active_power, type = "l", 
               ylab = "Global Active Power (kilowatts)"))
dev.off()