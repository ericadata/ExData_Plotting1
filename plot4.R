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

# create plots
png("plot4.png")
par(mfcol = c(2,2))

# plot 1
with(hpc, plot(datetime, Global_active_power, type = "l", 
               ylab = "Global Active Power (kilowatts)"))

# plot 2
with(hpc, plot(datetime, Sub_metering_1, type = "n",
               ylab = "Energy Sub metering", xlab = ""))
with(hpc, lines(datetime, Sub_metering_1))
with(hpc, lines(datetime, Sub_metering_2, col = "red"))
with(hpc, lines(datetime, Sub_metering_3, col = "blue"))
legend("topright", lty = c(1,1,1), col = c("black", "red", "blue"),
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

# plot 3
with(hpc, plot(datetime, Voltage, type = "l", 
               ylab = "Voltage", xlab = "datetime"))

# plot 4
with(hpc, plot(datetime, Global_reactive_power, type = "l", 
               ylab = "Global_reactive_power", xlab = "datetime"))

dev.off()