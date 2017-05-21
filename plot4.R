library(plyr)
library(dtplyr)
library(data.table)

df <- read.table("~/Documents/github/ExData_Plotting1/data/household_power_consumption.txt", sep = ";", header = TRUE) # read in txt data
dt0 <- data.table(df) # convert to data table
dt1 <- subset(dt0, Date == "1/2/2007" | Date == "2/2/2007") # subset datatable to include only the dates we care about
dt2 <- mutate(dt1, DateTime = as.POSIXct(paste(Date, Time), format = "%d/%m/%Y %H:%M:%S")) # create new variable combining observation's date and time
dt3 <- mutate(dt2, Date = as.Date(Date,"%d/%m/%Y")) # coercing date variable into a POSIXct class
dt4 <- mutate(dt3, Global_active_power = as.numeric(as.character(Global_active_power))) # converting to numeric
dt5 <- mutate(dt4, Global_reactive_power = as.numeric(as.character(Global_reactive_power))) # converting to numeric
dt6 <- mutate(dt5, Voltage = as.numeric(as.character(Voltage))) # converting to numeric
dt7 <- mutate(dt6, Global_intensity = as.numeric(as.character(Global_intensity))) # converting to numeric
dt8 <- mutate(dt7, Sub_metering_1 = as.numeric(as.character(Sub_metering_1))) # converting to numeric
dt9 <- mutate(dt8, Sub_metering_2 = as.numeric(as.character(Sub_metering_2))) # converting to numeric
dt10 <- mutate(dt9, Sub_metering_3 = as.numeric(as.character(Sub_metering_3))) # converting to numeric
rm("df", "dt0", "dt1", "dt2", "dt3", "dt4", "dt5", "dt6", "dt7", "dt8", "dt9") # removing temporary data tables used in reshaping

par(mfrow = c(2,2), mar = c(4, 4, 2, 1), oma = c(0, 0, 2, 0)) # set layout margins and margins

plot(dt10$DateTime, dt10$Global_active_power, type = "l", xlab = "", ylab = "Global Active Power", cex.lab = 0.70, cex.axis = 0.70) # create plot

plot(dt10$DateTime, dt10$Voltage, type = "l",  xlab = "datetime", ylab = "Voltage", cex.lab = 0.70, cex.axis = 0.70) # create plot

plot(dt10$DateTime, dt10$Sub_metering_1, type = "l", xlab = "", ylab = "Energy sub metering", cex.lab = 0.70, cex.axis = 0.70) # create plot
lines(dt10$DateTime, dt10$Sub_metering_2, type = "l", col = "red") # add line
lines(dt10$DateTime, dt10$Sub_metering_3, type = "l", col = "blue") # add line
legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty = c(1, 1, 1), col = c("black", "red", "blue"), cex = 0.70, bty = "n") # add legend

plot(dt10$DateTime, dt10$Global_reactive_power, type = "l", xlab = "datetime", ylab = "Global_reactive_power", cex.lab = 0.70, cex.axis = 0.70) # create plot