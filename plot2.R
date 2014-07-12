data <- read.table(
    "data/household_power_consumption.txt",
    na.strings="?", sep=";", header=TRUE)

two_day_data <- data[data$Date == "2/2/2007" | data$Date == "1/2/2007",]

two_day_data$DateTime <- strptime(
    paste(two_day_data$Date, two_day_data$Time, sep=" "),
    format="%d/%m/%Y %H:%M:%S")

par(cex=0.7, mar=c(6, 4, 6, 1))

plot(two_day_data$DateTime,
     two_day_data$Global_active_power, type="l",
     xlab="", ylab="Global Active Power (kilowatts)")

dev.copy(png, file="plot2.png")
dev.off()