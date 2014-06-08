source("loaddata.R")

doPlot3 <- function() {
  
  # read the data into a table
  tbl <- prepareData()
  
  # open the image device
  png(filename = "plot3.png", width = 480, height = 480, units = "px")
  
  # write the graph
  plot(tbl$DateTime, tbl$Sub_metering_1, 
       type="l", 
       xlab="", 
       ylab="Energy Sub Metering", 
       col="Black")
  # add the second line graph for the second variable
  lines(tbl$DateTime, tbl$Sub_metering_2, 
        type="l", 
        col="Red")
  
  # add the third line graph for the third variable
  lines(tbl$DateTime, tbl$Sub_metering_3, 
        type="l", 
        col="Blue")
  
  # add the legend
  legend("topright", 
         lty=1, lwd=1, 
         col=c("Black","Red","Blue"), 
         legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
  
  #close the device
  dev.off()
}

doPlot3()

