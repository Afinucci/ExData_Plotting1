# START - Importing the dataset "household_power_consumption.txt" directly from the 
# UC Irvine Machine Learning Repository


        fileUrl <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
        
        zipFile = 'household_power_consumption.zip'
        if (!file.exists(zipFile)){
          download.file(fileUrl, zipFile, method = 'curl')
        }
        
          unzip(zipFile)
          
          ColNames <- c("Date", "Time" , "Global_active_power","Global_reactive_power",
                        "Voltage", "Global_intensity", "Sub_metering_1", "Sub_metering_2",
                        "Sub_metering_3")

          df <- read.table("household_power_consumption.txt" , header = TRUE , sep=";",col.names = ColNames,
                           skip = 66636 , nrows = 2880)

 
#Trasforming formats         
          
          df$Date <- as.Date(df$Date , format = "%d/%m/%Y" )
          
          df$Time<- strptime(df$Time, format = "%H:%M:%S")
          
          
          
# END - Importing the dataset
          
          
# START Plotting
# Plotting on the screen
          dev.set(2)
          par(bg = "grey")
          hist(df$Global_active_power, col = "red", xlab = "Global Active Power (kilowatts)",
               main = "Global Active Power")
# save it to a PNG file with a width of 480 pixels and a height of 480 pixels
          png("plot1.png" , width = 480, height = 480)
          par(bg = "grey")
          hist(df$Global_active_power, col = "red", xlab = "Global Active Power (kilowatts)",
               main = "Global Active Power")
          
          dev.off()
          
          
          
          
          
