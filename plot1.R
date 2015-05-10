# plot1.R
# nrows=2076000 
#

library(data.table)
library(dplyr)
plot1 <- function() {
  data_file = "./data/household_power_consumption.txt"
  hpc_df <- fread(data_file, header = TRUE, na.strings='?')
  hpc_df_feb <- filter(hpc_df, Date %in% c("1/2/2007","2/2/2007")) 
  hist(as.numeric(hpc_df_feb$Global_active_power), 
       main="Global Active Power",
       xlab="Global Active Power (Kilowatts)",
       col = "red"
       )
  dev.copy(png, file = "plot1.png", width=480, height=480)  
  dev.off ()
}



