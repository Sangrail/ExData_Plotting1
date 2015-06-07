##Sangrail
##Rev0.3
##Coursera: Exploratory Data Analysis
##Week 1, plot1

df <- read.csv("household_power_consumption.txt", 
               header=T, 
               sep=";", 
               stringsAsFactors=F, 
               na.strings="?", 
               colClasses=c("character", "character", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric"))


## Filter data ouside the datetimes of 2007-02-01 and 2007-02-02
df$Date = as.Date(df$Date, format="%d/%m/%Y")

startDate = as.Date("01/02/2007", format="%d/%m/%Y")
endDate = as.Date("02/02/2007", format="%d/%m/%Y")

df = df[df$Date >= startDate & df$Date <= endDate, ]

## Create a plot and save to a PDF file
png(filename="plot1.png", width=480, height=480)

hist(df$Global_active_power, main="Global Active Power",
     xlab="Global Active Power (kilowatts)", col="red")

dev.off() #cleanup the device context
