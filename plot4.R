# import data
library(readr)
value <- read_delim("household_power_consumption.txt", ";", escape_double = FALSE, trim_ws = TRUE)
z <- subset(value,Date == "2/2/2007")
y<- subset(value, Date == "1/2/2007")
x<- rbind(y,z)
x$Global_active_power<- as.numeric(x$Global_active_power)
dat <- paste(x$Date,x$Time) 
dat <-strptime(dat,format = "%d/%m/%Y %H:%M:%S")





png(filename = "plot4.png")
par(mfrow = c(2, 2), mar = c(5, 4, 2, 1))
plot(dat,x$Global_active_power,pch="",ylab='', xlab = '')
lines(dat,x$Global_active_power, type = "l")
title (y= "Global Active Power (kilowatts)")

plot(dat,x$Voltage, type ="l" , xlab = "datetime", ylab ="Voltage", ylim = c(234,246) )

plot(dat, x$Sub_metering_1, type='l',ylab = "Energy sub metering",xlab ="")
points(dat, x$Sub_metering_2 , type ="l",col= "red")
points(dat, x$Sub_metering_3 , type ="l",col= "blue")
legend('topright',c('Sub_metering_1','Sub_metering_2','Sub_metering_3'), lty=1, col=c('black', 'red', 'blue'), cex=.75)

plot(dat,x$Global_reactive_power, type ="l" , xlab = "datetime",ylab= "Global_reactive_power")
dev.off()