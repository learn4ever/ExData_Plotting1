source("loaddata.R")
#learn4ever, 6 June 2014
doPlot4 <- function() {
    tbl <- prepareData()
    
    png(filename = "plot4.png", width = 480, height = 480, units = "px")
    
    #create a matrix of 2x2 plots
    par(mfrow=c(2,2))
    
    #plot 1 - Global active power
    plot(tbl$DateTime,tbl$Global_active_power, 
         type="l", 
         main="", 
         xlab="", 
         ylab="Global Active Power")
    
    #plot 2 - Voltage
    plot(tbl$DateTime, tbl$Voltage, 
         type="l", 
         xlab="datetime", 
         ylab="Voltage")
    
    #plot 3 - Sub metering
    plot(tbl$DateTime, tbl$Sub_metering_1, 
         type="l", 
         xlab="", 
         ylab="Energy Sub Metering", 
         col="Black")
    lines(tbl$DateTime, tbl$Sub_metering_2, 
          type="l", 
          col="Red")
    lines(tbl$DateTime, tbl$Sub_metering_3, 
          type="l", 
          col="Blue")
    legend("topright", 
           bty="n", 
           lty=1, 
           lwd=1, 
           col=c("Black","Red","Blue"), 
           legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))

    #plot 4 - Global reactive power  
    plot(tbl$DateTime, tbl$Global_reactive_power, 
         type="l", 
         xlab="datetime", 
         ylab="Global_reactive_power")

   dev.off()
}

doPlot4()

