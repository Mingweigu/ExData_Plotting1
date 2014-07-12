data <- read.table(
    "data/household_power_consumption.txt",
    na.strings="?", sep=";", header=TRUE)

two_day_data <- data[data$Date == "2/2/2007" | data$Date == "1/2/2007",]

par(cex=0.7, mar=c(6, 4, 6, 1))

hist(two_day_data$Global_active_power,
     main="Global Active Power",
     xlab="Global Active Power (kilowatts)",
     col="red")

dev.copy(png, file="plot1.png")
dev.off()