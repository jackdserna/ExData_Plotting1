#Plot 2
library(data.table)
library(dplyr)
library(lubridate)

data<- fread('household_power_consumption.txt', na.strings = c('?', 'NA'))
data<- mutate(data, datetime = dmy_hms(paste(Date, Time)), 
              Date = as.Date(Date, "%d/%m/%Y"))
sub<- filter(data, Date == as.Date("2007-02-01") & Date ==  as.Date("2007-02-02"))

plot(sub$datetime, sub$Global_active_power, type = 'l', xlab = 'Feb. 1-2, 2007',
     ylab = 'Global Active Power (kilowatts)', main = 'Global Active Power over Time')
