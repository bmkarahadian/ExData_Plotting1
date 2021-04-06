library(tidyverse)
library(lubridate)

dat <- 
  read_delim("household_power_consumption.txt", delim = ";", na = "?") %>%
  mutate(Date = dmy(Date)) %>%
  filter(Date %in% c(dmy("01/02/2007"), dmy("02/02/2007")))

dat2 <- 
  dat %>%
  mutate(dttm = ymd_hms(paste(Date, Time)))

png("plot4.png")
par(mfrow = c(2,2))

plot(dat2$dttm, dat2$Global_active_power, type = "l",
     xlab = "", ylab = "Global Active Power (kilowatts)")

plot(dat2$dttm, dat2$Voltage, type = "l", xlab = "datetime", ylab = "Voltage")

plot(dat2$dttm, dat2$Sub_metering_1, type = "l",
     xlab = "", ylab = "Energy sub metering")
lines(dat2$dttm, dat2$Sub_metering_2, col = "red")
lines(dat2$dttm, dat2$Sub_metering_3, col = "blue")
legend(x = "topright", legend = names(dat2)[7:9], col = c("black", "red", "blue"), lty = 1, bty = "n")

plot(dat2$dttm, dat2$Global_reactive_power, type = "l", xlab = "datetime", ylab = "Global_reactive_power")
dev.off()