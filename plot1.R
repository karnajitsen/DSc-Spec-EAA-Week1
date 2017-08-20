library(readr)
household_power_consumption <- read_delim("/watson-Iot/personal/education/Data-Science/DSSpecialization-JohnHopkins/EAA/week1/capstone/ExData_Plotting1/data/household_power_consumption.txt",";",escape_double = FALSE, trim_ws = TRUE)

household_power_consumption$Date <- as.Date(household_power_consumption$Date,"%d/%m/%Y")
x <- subset(household_power_consumption, household_power_consumption$Date >= "2007-02-01" & household_power_consumption <= "2007-02-02")
png(filename="./plot1.png", bg="white")
hist(x$Global_active_power, col = "red", border = "black", xlab = "Global Active Power (kilowatts)", main = "Global Active Power")
dev.off()