library(readr)
household_power_consumption <- read_delim("/watson-Iot/personal/education/Data-Science/DSSpecialization-JohnHopkins/EAA/week1/capstone/ExData_Plotting1/data/household_power_consumption.txt",";",escape_double = FALSE, trim_ws = TRUE)

household_power_consumption$Date <- as.Date(household_power_consumption$Date,"%d/%m/%Y")
x <- subset(household_power_consumption, household_power_consumption$Date >= "2007-02-01" & household_power_consumption <= "2007-02-02")

x$datetime <- strptime(paste(x$Date, x$Time), "%Y-%m-%d %H:%M:%S")
x$datetime <- as.POSIXct(x$datetime)

par(mfrow = c(2, 2))
plot(x$Global_active_power ~ x$datetime, type = "l", ylab = "Global Active Power", 
     xlab = "")
plot(x$Voltage ~ x$datetime, type = "l")
plot(x$Sub_metering_1 ~ x$datetime, type = "l", ylab = "Energy sub metering", 
     xlab = "")
lines(x$Sub_metering_2 ~ x$datetime, col = "Red")
lines(x$Sub_metering_3 ~ x$datetime, col = "Blue")
legend("topright", lty = 1, col = c("black", "red", "blue"), 
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       bty = "n")

plot(x$Global_reactive_power ~ x$datetime, type = "l")
dev.copy(png, file = "plot4.png", height = 480, width = 480)
dev.off()