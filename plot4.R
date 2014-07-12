data <- read.table(
    "data/household_power_consumption.txt",
    na.strings="?", sep=";", header=TRUE)

two_day_data <- data[data$Date == "2/2/2007" | data$Date == "1/2/2007",]

two_day_data$DateTime <- strptime(
    paste(two_day_data$Date, two_day_data$Time, sep=" "),
    format="%d/%m/%Y %H:%M:%S")

par(mfrow=c(2, 2), mar = c(4, 4, 4, 3), cex=0.55)

with(two_day_data, {
    
    plot(DateTime, Global_active_power, type="l",
         xlab="", ylab="Global Active Power")
    
    plot(DateTime, Voltage, type="l", xlab="datetime")
    
    plot(DateTime, Sub_metering_1, type="l", xlab="", ylab="Energy sub metering")
    lines(DateTime, Sub_metering_2, type="l", col="red")
    lines(DateTime, Sub_metering_3, type="l", col="blue")
    
    legend("topright", col = c("black", "red", "blue"),
           legend = c("Sub_metering_1  ", "Sub_metering_2  ", "Sub_metering_3  "),
           y.intersp=0.8, lty=1, bty="n") 
    
    plot(DateTime, Global_reactive_power, type="l",
         xlab="datetime")
})

dev.copy(png, file="plot4.png")
dev.off()