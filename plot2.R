library(dplyr)

# Loading the data from text file.
path <- "..\\data/household_power_consumption.txt"
# reading relevant data
data_full <- read.csv(path, header=T, sep=';', na.strings="?", nrows=2075259, check.names=F, stringsAsFactors=F, comment.char="", quote='\"')
data1 <- subset(data_full, Date %in% c("1/2/2007","2/2/2007"))
data1$Date <- as.Date(data1$Date, format="%d/%m/%Y")
datetime <- paste(as.Date(data1$Date), data1$Time)
data1$Datetime <- as.POSIXct(datetime)

## creating png graphic device
png(filename = 'plot2.png', width = 480, height = 480, units = 'px')

# plotting the graph
with(data1, {
    plot(Global_active_power~Datetime, type="l",
         ylab="Global Active Power (kilowatts)", xlab="")
})

# closing the graphic device
dev.off()
