source("loaddata.R")

doPlot2 <- function() {
  # read the data into a table
    tbl <- prepareData()
    #Open the image
    png(filename = "plot2.png", width = 480, height = 480, units = "px")
    # write the plot
    plot(tbl$DateTime, tbl$Global_active_power, 
         type="l", #type = line
         xlab="",  #x-axis label
         ylab="Global Active Power (kilowatts)")  #y-axis label
    # close the image
    dev.off()
}

doPlot2()

