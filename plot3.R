# import data
library(readr)
value <- read_delim("household_power_consumption.txt", ";", escape_double = FALSE, trim_ws = TRUE)
z <- subset(value,Date == "2/2/2007")
y<- subset(value, Date == "1/2/2007")
x<- rbind(y,z)
x$Global_active_power<- as.numeric(x$Global_active_power)
dat <- paste(x$Date,x$Time) 
dat <-strptime(dat,format = "%d/%m/%Y %H:%M:%S")

png(filename = "plot3.png")

plot(dat, x$Sub_metering_1, type='l',ylab = "Energy sub metering",xlab ="")
points(dat, x$Sub_metering_2 , type ="l",col= "red")
points(dat, x$Sub_metering_3 , type ="l",col= "blue")
legend('topright',c('Sub_metering_1','Sub_metering_2','Sub_metering_3'), lty=1, col=c('black', 'red', 'blue'), cex=.75)


dev.off()