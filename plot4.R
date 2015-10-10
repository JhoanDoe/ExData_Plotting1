## Plot 4

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

png(file = "Plot4.png", width = 480, height=480, type="windows") 
par(mfrow = c(2,2))

# Top Left
plot(x = HPC_data$Time, 
     y = HPC_data$Global_active_power, 
     type = 'l',
     xlab = '',
     ylab = 'Global Active Power (kilowatts)',
     main = '')

# Top Right
plot(x = HPC_data$Time,
     y = HPC_data$Voltage,
     type = 'l',
     xlab = 'datetime',
     ylab = 'Voltage')

# Lower Left
plot(x = HPC_data$Time, 
     y = HPC_data$Sub_metering_1, 
     type = 'l',
     xlab = '',
     ylab = 'Energy sub metering')

# 2nd Series
lines(x = HPC_data$Time, 
      y = HPC_data$Sub_metering_2, 
      col = 'red')

# 3rd Series
lines(x = HPC_data$Time, 
      y = HPC_data$Sub_metering_3, 
      col = 'blue')

legend('topright',
       lty = c(1,1),
       c('Sub_metering_1','Sub_metering_2','Sub_metering_3'),
       col = c('black','red','blue'),
       bty = 'n')

# Lower Right
plot(x = HPC_data$Time,
     y = HPC_data$Global_reactive_power,
     type = 'l',
     xlab = 'datetime',
     ylab = 'Global_reactive_power')

dev.off()