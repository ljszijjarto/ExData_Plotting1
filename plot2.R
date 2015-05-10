# Coursera Course - Exploratory Data Analysis
# Week 1 - Project 1
# plot2.R
# Author: J Szijjarto
# nrows=2076000 

library(data.table)
plot2 <- function() {
  data_file = "./data/household_power_consumption.txt"
  col_classes = c("Date", "character", "numeric","numeric",
                  "numeric","numeric","numeric","numeric","numeric")
  hpc_df <- fread(data_file, na.strings="?", sep=";", 
                  header=TRUE, colClasses=col_classes)
  hpc_df_feb <- hpc_df[(hpc_df$Date=="1/2/2007" | hpc_df$Date=="2/2/2007"),]
  hpc_df_feb$Datetime <- as.POSIXct(
    strptime(paste(hpc_df_feb$Date,hpc_df_feb$Time), "%d/%m/%Y %H:%M:%S"))
  plot(hpc_df_feb$Datetime,hpc_df_feb$Global_active_power,type="l", 
       xlab="", ylab="Global Active Power (kilowatts)")
  dev.copy(png, file = "plot2.png", width=480, height=480)  
  dev.off ()
}



