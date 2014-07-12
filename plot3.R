data <- read.table(
    "data/household_power_consumption.txt",
    na.strings="?", sep=";", header=TRUE)

two_day_data <- data[data$Date == "2/2/2007" | data$Date == "1/2/2007",]

two_day_data$DateTime <- strptime(
    paste(two_day_data$Date, two_day_data$Time, sep=" "),
    format="%d/%m/%Y %H:%M:%S")

par(cex=0.7, mar=c(6, 4, 6, 1))

with(two_day_data, {
    plot(DateTime, Sub_metering_1, type="l", xlab="", ylab="Energy sub metering")
    lines(DateTime, Sub_metering_2, type="l", col="red")
    lines(DateTime, Sub_metering_3, type="l", col="blue")
    
    legend("topright", col = c("black", "red", "blue"),
           legend = c(
               "Sub_metering_1    ",
               "Sub_metering_2    ",
               "Sub_metering_3    "),
           lty=1, y.intersp=0.6)
})

dev.copy(png, file="plot3.png")
dev.off()