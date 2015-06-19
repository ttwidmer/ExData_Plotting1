#Assumption:household_power_consumption.txt file is downloaded in the current  worrkspace
#get Data
    data_hpc<- read.csv("household_power_consumption.txt", sep = ";", na.strings="?",stringsAsFactors =FALSE)
    data_hpc$Date <- as.Date(data_hpc$Date, format= "%d/%m/%Y")
    data_hpc$DateTime<- as.POSIXct(paste(data_hpc$Date, data_hpc$Time), format="%Y-%m-%d %H:%M:%S")
   
    specific_data <- data_hpc[data_hpc$Date == "2007-02-01" | data_hpc$Date == "2007-02-02",]

#create diagram for plot4
    par(mfcol =c(2,2))
    with(specific_data, {
        with(specific_data, plot(DateTime, Global_active_power, type="l",ylab="Global Active Power", xlab="" ))
        with(specific_data, plot(DateTime, Sub_metering_1, type="l", ylab="Energy sup metering",  xlab=""))
        with(specific_data, points(DateTime,Sub_metering_2, col= "red", type="l"))
        with(specific_data, points(DateTime,Sub_metering_3, col= "blue", type="l"))
        legend("topright", lwd = 1, col =c("black","blue", "red"), legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
        Voltage
        with(specific_data, plot(DateTime, Voltage, type="l", xlab="datetime" ))
        with(specific_data, plot(DateTime, Global_reactive_power, type="l", xlab="datetime" ))
    })

    dev.copy(png, file = "plot4.png") 
    dev.off()