library(tidyverse)
library(lubridate)

dat <- 
read_delim("household_power_consumption.txt", delim = ";", na = "?") %>%
  mutate(Date = dmy(Date)) %>%
  filter(Date %in% c(dmy("01/02/2007"), dmy("02/02/2007")))

#create plot 1
png("plot1.png")
hist(dat$Global_active_power, col = "red", main = "Global Active Power",
     xlab = "Global Active Power (kilwatts)", ylim = c(0, 1200))
dev.off()