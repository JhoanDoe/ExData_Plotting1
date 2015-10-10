## Plot 2

## Getting and cleanning the data for the days 01/02/2007 and 02/02/2007

fileName = 'household_power_consumption.txt'

HPC_data = read.table(fileName,sep = ';',header = TRUE, na.strings = c("?","")) # Reading the data into a data frame

HPC_data$Date = as.Date(HPC_data$Date, format = "%d/%m/%Y") # Changing the class of the Date column from 'factor' to 'Date'

Day_1 = '2007-02-01'
Day_2 = '2007-02-02'

HPC_data = HPC_data[HPC_data$Date == Day_1 | HPC_data$Date == Day_2,] # Filtering the data for the Day 1 and Day 2

HPC_data$Global_active_power = as.numeric(HPC_data$Global_active_power) # Changing the class of the Global Active Power column to numeric

HPC_data$Time <- strptime(paste(HPC_data$Date, HPC_data$Time), format = "%Y-%m-%d %H:%M:%S")

## Creating the Plot file

plot(x = HPC_data$Time, 
     y = HPC_data$Global_active_power, 
     type = 'l',
     xlab = '',
     ylab = 'Global Active Power (kilowatts)',
     main = '')

dev.copy(png,'Plot2.png')
dev.off()
