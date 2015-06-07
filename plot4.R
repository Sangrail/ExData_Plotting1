##Sangrail
##Rev0.5
##Coursera: Exploratry Data Analysis
##Week 1, plot4


df <- read.csv("household_power_consumption.txt", 
               header=T, 
               sep=";", 
               stringsAsFactors=F, 
               na.strings="?", 
               colClasses=c("character", "character", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric"))

## Filter data ouside the datetimes of 2007-02-01 and 2007-02-02
df$timestamp = strptime(paste(df$Date, df$Time),format="%d/%m/%Y %H:%M:%S", tz="UTC")

startDate = strptime("01/02/2007 00:00:00", format="%d/%m/%Y %H:%M:%S", tz="UTC")
endDate = strptime("02/02/2007 23:59:59", format="%d/%m/%Y %H:%M:%S", tz="UTC")

df = df[df$timestamp >= startDate & df$timestamp <= endDate, ]

## Creating the plot
png(filename="plot4.png", width=480, height=480)

# Set the canvas up to display 4 plots
par(mfcol=c(2,2))

#plot 1 - Global Active Power
plot(df$timestamp, df$Global_active_power, type="l", xlab="",
     ylab="Global Active Power")

#plot 2 - Energy sub metering
plot(df$timestamp, df$Sub_metering_1, type="l", xlab="", ylab="Energy sub metering")
lines(df$timestamp, df$Sub_metering_2, col="red")
lines(df$timestamp, df$Sub_metering_3, col="blue")
legend("topright", legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       col=c("black", "red", "blue"), lwd=par("lwd"), bty="n")

#Plot 3 - Voltage
plot(df$timestamp, df$Voltage, type="l",
     xlab="Datetime", ylab="Voltage")

#Plot 4 - Global_reactive_power
plot(df$timestamp, df$Global_reactive_power, type="l",
     xlab="Datetime", ylab="Global_reactive_power")

dev.off()