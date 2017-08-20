library(readr)
household_power_consumption <- read_delim("./data/household_power_consumption.txt",";",escape_double = FALSE, trim_ws = TRUE)

household_power_consumption$Date <- as.Date(household_power_consumption$Date,"%d/%m/%Y")
x <- subset(household_power_consumption, household_power_consumption$Date >= "2007-02-01" & household_power_consumption <= "2007-02-02")

x$datetime <- strptime(paste(x$Date, x$Time), "%Y-%m-%d %H:%M:%S")
x$datetime <- as.POSIXct(x$datetime)
plot(x$Global_active_power ~ x$datetime, type = "l",
     ylab = "Global Active Power (kilowatts)", xlab = "")
dev.copy(png, file = "plot2.png", height = 480, width = 480)
dev.off()
