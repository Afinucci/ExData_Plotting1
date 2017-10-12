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


# Start Plotting
        
        par(mfcol = c(2,2))
        par(mar=c(4,14,3,4))
        par(cex= 0.4, cex.lab = 1.4)
        par(bg = "grey")
        dev.set(2)
        
# First graph [1,1]
        
        index<- 1:length(df$Date)
        
        with(df , plot(index , Global_active_power ,type = "l", xaxt = "n", xlab = "", 
                       ylab = "Global Active Power"))
        axis(1, at = seq(1,2880,1439), labels = c("Thu","Fri", "Sat"))

# Second graph [2,1]
        
        with(df , plot(index , Sub_metering_1 ,type = "l", xaxt = "n", xlab = "", 
                       ylab = "Energy sub metering"))
        axis(1, at = seq(1,2880,1439), labels = c("Thu","Fri", "Sat"))
        lines(index, df$Sub_metering_2, col= "red")
        lines(index, df$Sub_metering_3, col="blue")
        
        legend("topright" , lty = 1, col = c("black","red","blue"),
               legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3")
               , bty = "n")
        
#Third graph [1,2]
        par(mar=c(4,4,3,14))
        
        with(df , plot(index , Voltage ,type = "l", xaxt = "n", xlab= "datetime"
                       , ylab = "Voltage"))
        axis(1, at = seq(1,2880,1439), labels = c("Thu","Fri", "Sat"))
        
# Fourth graph [2,2]
        with(df , plot(index , Global_reactive_power ,type = "l", xaxt = "n", xlab= "datetime"))
        axis(1, at = seq(1,2880,1439), labels = c("Thu","Fri", "Sat"))
        

# save it to a PNG file with a width of 480 pixels and a height of 480 pixels  
        
        png("plot4.png" , width = 480, height = 480)
        
        par(mfcol = c(2,2))
        par(mar=c(4,10,8,4))
        par(cex= 0.4, cex.lab = 1.4)
        par(bg = "grey")
        
# First graph [1,1]
        
        index<- 1:length(df$Date)
        
        with(df , plot(index , Global_active_power ,type = "l", xaxt = "n", xlab = "", 
                       ylab = "Global Active Power"))
        axis(1, at = seq(1,2880,1439), labels = c("Thu","Fri", "Sat"))
        
# Second graph [2,1]
        
        with(df , plot(index , Sub_metering_1 ,type = "l", xaxt = "n", xlab = "", 
                       ylab = "Energy sub metering"))
        axis(1, at = seq(1,2880,1439), labels = c("Thu","Fri", "Sat"))
        lines(index, df$Sub_metering_2, col= "red")
        lines(index, df$Sub_metering_3, col="blue")
        
        legend("topright" , lty = 1, col = c("black","red","blue"),
               legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3")
               , bty = "n")
#Third graph [1,2]
        par(mar=c(4,4,8,10))
        
        with(df , plot(index , Voltage ,type = "l", xaxt = "n", xlab= "datetime"
                       , ylab = "Voltage"))
        axis(1, at = seq(1,2880,1439), labels = c("Thu","Fri", "Sat"))
        
# Fourth graph [2,2]
        with(df , plot(index , Global_reactive_power ,type = "l", xaxt = "n", xlab= "datetime"))
        axis(1, at = seq(1,2880,1439), labels = c("Thu","Fri", "Sat"))
        
        dev.off()