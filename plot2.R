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

plot(dt10$DateTime, dt10$Global_active_power, type = "l", xlab = "", ylab = "Global Active Power (kilowatts)", cex.lab = 0.75, cex.axis = 0.75) # create plot
