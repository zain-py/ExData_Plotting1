# Loading the data from text file.
path <- "..\\data/household_power_consumption.txt"
df <- read.table(path, header = TRUE, sep = ';', na.strings = '?')

# sub-setting based on the dates
init_date <- as.Date('01-02-2007')
final_date <- as.Date('02-02-2007')

my_data <- df[which(df$Date == init_date | df$Date == final_date), ]

# opening png graphic device
png(filename = 'plot1.png', width = 480, height = 480, units = 'px')

# making the graph
hist(my_data$Global_active_power , col = 'red', xlab = 'Golbal Active Power (kilowatts)', main = 'Global Active Power')

# closing the graphic device
dev.off()
