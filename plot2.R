##Sangrail
##Rev0.2
##Coursera: Exploratory Data Analysis
##Week 1, plot2

df <- read.csv("household_power_consumption.txt", 
               header=T, 
               sep=";", 
               stringsAsFactors=F, 
               na.strings="?", 
               colClasses=c("character", "character", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric"))

## Filter data ouside the datetimes of 2007-02-01 and 2007-02-02
df$timestamp = strptime(paste(df$Date, df$Time), format="%d/%m/%Y %H:%M:%S", tz="UTC")

startDate = strptime("01/02/2007 00:00:00", format="%d/%m/%Y %H:%M:%S", tz="UTC")
endDate = strptime("02/02/2007 23:59:59", format="%d/%m/%Y %H:%M:%S", tz="UTC")

df = df[df$timestamp >= startDate & df$timestamp <= endDate, ]

## Creating the plot
png(filename="plot2.png", width=480, height=480)

plot(df$timestamp, df$Global_active_power, type="l", xlab="",
     ylab="Global Active Power (kilowatts)")

dev.off()