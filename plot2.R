library(tidyverse)
library(lubridate)

dat <- 
  read_delim("household_power_consumption.txt", delim = ";", na = "?") %>%
  mutate(Date = dmy(Date)) %>%
  filter(Date %in% c(dmy("01/02/2007"), dmy("02/02/2007")))

dat2 <- 
dat %>%
  mutate(dttm = ymd_hms(paste(Date, Time)))

png("plot2.png")
plot(dat2$dttm, dat2$Global_active_power, type = "l",
     xlab = "", ylab = "Global Active Power (kilowatts)")
dev.off()
