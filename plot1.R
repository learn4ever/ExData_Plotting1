source("loaddata.R")

doPlot1 <- function() {
    # read the data into a table
    tbl <- prepareData()
    
    # open the image device
    png(filename = "plot1.png", width = 480, height = 480, units = "px")
    # write the graph
    hist(tbl$Global_active_power, 
         main="Global Active Power", 
         xlab="Global Active Power (kilowatts)", 
         col="red")
    # close
    dev.off()
}

doPlot1()

