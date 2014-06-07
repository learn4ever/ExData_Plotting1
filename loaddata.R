#learn4ever, 6June2014

csvfilename<-c("plotdata.csv")

download_file <- function(fileURL, fname) {
  if(!file.exists(fname)) {
    download.file(fileURL, destfile=fname, method="curl")
  }
  fname
}

prepareData <- function() {

  URL <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
  zfile <- "household_power_consumption.zip"
  #if the CSV file exists, load the data from it, return the data.frame with tidy data
    if (file.exists(csvfilename)) {
      data <- read.csv(csvfilename)
      data$DateTime <- strptime(paste(data$Date, data$Time), "%d/%m/%Y %H:%M:%S")
    } else {
        # download the zip file
        zipfile <- download_file(URL, zfile)
        
        #unzip it
        datfile <- unzip(zipfile, files="household_power_consumption.txt")
        data <- read.table(datfile, header=T, sep=';', na.strings="?", colClasses=c("character","character","numeric","numeric","numeric","numeric","numeric","numeric","numeric"))
        #subset it
        data <- data[((data$Date == "1/2/2007") | (data$Date == "2/2/2007")),]
        
        #combine the date and time columns and convert them into datetime
        data$DateTime <- strptime(paste(data$Date, data$Time), "%d/%m/%Y %H:%M:%S")
        
        #create the csv file
        write.csv(data, csvfilename)
    }
  # return the data
  data
}



