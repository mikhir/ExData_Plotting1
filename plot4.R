data <- read.csv('household_power_consumption.txt', sep=';', na.strings='?')
data <- transform(data, Date=strptime(paste(as.character(Date),as.character(Time)), format='%d/%m/%Y %H:%M:%S'))
data <- subset(data, Date>="2007-02-01 00:00:00" & Date<="2007-02-02 23:59:59")
png('plot4.png', width=480, height=480)

par(mfrow=c(2,2))

with(data, plot(Date, Global_active_power, xlab="", ylab="Global Active Power (kilowatts)", main="", type="l"))

with(data, plot(Date, Voltage, xlab="datetime", ylab="Voltage", main="", type="l"))

with(data, plot(Date, Sub_metering_1, xlab="", ylab="Energy sub metering", main="", type="l", col="black"))
with(data, lines(Date, Sub_metering_2, type="l", col="red"))
with(data, lines(Date, Sub_metering_3, type="l", col="blue"))
legend("topright", col=c("black","red","blue"), lty=1, lwd=1, legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

with(data, plot(Date, Global_reactive_power, xlab="datetime", ylab="Global_reactive_power", main="", type="l"))

dev.off()