setwd("/Users/Piotrek/Desktop/Coursera/ExploratoryAnalysis")

require(dplyr)
require(lubridate)

##PLOT 1
df <- read.table("./data/household_power_consumption.txt", sep = ";",
                 header = TRUE,  na.strings = "?",
                 colClasses = c("character", "character", "numeric", "numeric", "numeric", "numeric", "factor", "factor", "factor"))
df2 <- tbl_df(df)
df3 <- df2 %>%
       filter(Date == "1/2/2007" | Date =="2/2/2007") %>%
       mutate(date_full = dmy_hms(paste(as.character(Date), Time)))
rm("df", "df2")

png(filename = "./out/plot1.png")
with(df3, hist(Global_active_power, col = "red", 
     main = "Global Active Power", xlab = "Global Active Power (kilowatts)"))
dev.off()
