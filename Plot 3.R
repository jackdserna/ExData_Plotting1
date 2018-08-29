#Plot 3
library(data.table)
library(dplyr)
library(lubridate)

data<- fread('household_power_consumption.txt', na.strings = c('?', 'NA'))
data<- mutate(data, datetime = dmy_hms(paste(Date, Time)), 
              Date = as.Date(Date, "%d/%m/%Y"))
sub<- filter(data, Date == as.Date("2007-02-01") | Date ==  as.Date("2007-02-02"))

plot(sub$datetime, sub$Sub_metering_1, type = 'l', xlab = "Feb. 1-2, 2007", 
     ylab = "Energy Sub Metering", main = 'Energy Grouped by Sub-Metering')
lines(sub$datetime, sub$Sub_metering_2, col = 'red', type = 'l')
lines(sub$datetime, sub$Sub_metering_3, col = 'blue', type = 'l')
legend('topright', lty = 1, col = c('black', 'red', 'blue'), xjust = 1, cex = 0.75,
       legend = c('Sub Metering 1', 'Sub Metering 2', 'Sub Metering 3'))
