# Plot 4
library(data.table)
library(dplyr)
library(lubridate)

data<- fread('household_power_consumption.txt', na.strings = c('?', 'NA'))
data<- mutate(data, datetime = dmy_hms(paste(Date, Time)), 
              Date = as.Date(Date, "%d/%m/%Y"))
sub<- filter(data, Date == as.Date("2007-02-01") | Date ==  as.Date("2007-02-02"))

par(mfcol = c(2,2), mar = c(4,4,2,1), oma = c(0,0,2,1))
# 1st Quandrant
plot(sub$datetime, sub$Global_active_power, xlab = 'Feb. 1-2, 2007', 
     ylab = 'Global Active Power', type = 'l')
# 2nd Quadrant
plot(sub$datetime, sub$Sub_metering_1, type = 'l', xlab = "Feb. 1-2, 2007", 
     ylab = "Energy Sub Metering")
lines(sub$datetime, sub$Sub_metering_2, col = 'red', type = 'l')
lines(sub$datetime, sub$Sub_metering_3, col = 'blue', type = 'l')
legend('topright', lty = 1, col = c('black', 'red', 'blue'), xjust = 1, cex = 0.5,
       legend = c('Sub Metering 1', 'Sub Metering 2', 'Sub Metering 3'))
# 3rd Quandrant
plot(sub$datetime, sub$Voltage, xlab = 'Feb. 1-2, 2007', ylab = 'Voltage', type = 'l')
# 4th Quandrant
plot(sub$datetime, sub$Global_reactive_power, xlab = 'Feb. 1-2, 2007', ylab = 'Global Reactive Power', type = 'l')
mtext('Exploratory Data Analaysis', outer = TRUE)
