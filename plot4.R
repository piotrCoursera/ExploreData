setwd("/Users/Piotrek/Desktop/Coursera/ExploratoryAnalysis")

require(dplyr)
require(lubridate)

df <- read.table("./data/household_power_consumption.txt", sep = ";",
                 header = TRUE,  na.strings = "?",
                 colClasses = c("character", "character", "numeric", "numeric", "numeric", "numeric", "factor", "factor", "factor"))
df2 <- tbl_df(df)
df3 <- df2 %>%
       filter(Date == "1/2/2007" | Date =="2/2/2007") %>%
       mutate(date_full = dmy_hms(paste(as.character(Date), Time)))
rm("df", "df2")

png(filename = "./out/plot4.png")
par(mfrow=c(2,2))
#PLOT 1,1
with(df3, plot(x = date_full , y= Global_active_power, xlab = "", ylab = "Global Active Power", type = "n"))
with(df3,lines(x = date_full , y= Global_active_power))
#PLOT (1,2)
with(df3, plot(x = date_full , y= Voltage, type = "n"))
with(df3,lines(x = date_full , y= Voltage))
#PLOT (2,1)
with(df3, plot(x = date_full , y= Sub_metering_1, xlab = "", ylab = "Energy submetering", type = "n"))
with(df3,lines(x = date_full , y= Sub_metering_1, col = "black"))
with(df3,lines(x = date_full , y= Sub_metering_2, col = "red"))
with(df3,lines(x = date_full , y= Sub_metering_3, col = "blue"))
legend("topright", col = c("black", "red", "blue"), lty = 1, legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),  bty = "n" )
#PLOT(2,2)
with(df3, plot(x = date_full , y= Global_reactive_power, type = "n"))
with(df3,lines(x = date_full , y= Global_reactive_power))
dev.off()
