# Coursera Course - Exploratory Data Analysis
# Week 1 - Project 1
# plot4.R
# Author: J Szijjarto
# nrows=2076000 

plot4 <- function() {
  data_file = "./data/household_power_consumption.txt"
  col_classes = c("Date", "character", "numeric","numeric",
                  "numeric","numeric","numeric","numeric","numeric")
  hpc_df <- fread(data_file, na.strings="?", sep=";", 
                  header=TRUE, colClasses=col_classes)
  hpc_df_feb <- hpc_df[(hpc_df$Date=="1/2/2007" | hpc_df$Date=="2/2/2007"),]
  hpc_df_feb$Datetime <- as.POSIXct(
    strptime(paste(hpc_df_feb$Date,hpc_df_feb$Time), "%d/%m/%Y %H:%M:%S"))

  plot_colors <- c("black","red","blue") 
  par(mfrow=c(2,2), mar=c(5,4,2,1), oma=c(0,2,0,2))
  with(hpc_df_feb,{ 
    plot(hpc_df_feb$Datetime,hpc_df_feb$Global_active_power,type="l", 
         xlab="", ylab="Global Active Power")
    
    plot(hpc_df_feb$Datetime,hpc_df_feb$Voltage,type="l", 
         xlab="datetime", ylab="Voltage")

    plot(hpc_df_feb$Datetime,hpc_df_feb$Sub_metering_1,type="l", 
         col=plot_colors[1],
           xlab="", ylab="Energy sub metering")
    lines(hpc_df_feb$Datetime,hpc_df_feb$Sub_metering_2,type="l", 
          col=plot_colors[2])
    lines(hpc_df_feb$Datetime,hpc_df_feb$Sub_metering_3,type="l", 
          col=plot_colors[3])
    col_names <- c("Sub metering 1","Sub metering 2", "Sub metering 3")
    legend("topright", col=plot_colors, col_names, lty=1, cex=0.7, bty="n")
  
    plot(hpc_df_feb$Datetime,hpc_df_feb$Global_reactive_power,type="l", 
         xlab="datetime", ylab="Global reactive power")
    
  })
  
  dev.copy(png, file = "plot4.png", width=480, height=480)  
  dev.off ()
}
