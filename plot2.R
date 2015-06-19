#Assumption:household_power_consumption.txt file is downloaded in the current  worrkspace
#get Data
    data_hpc<- read.csv("household_power_consumption.txt", sep = ";", na.strings="?",stringsAsFactors =FALSE)
    data_hpc$Date <- as.Date(data_hpc$Date, format= "%d/%m/%Y")
    data_hpc$DateTime<- as.POSIXct(paste(data_hpc$Date, data_hpc$Time), format="%Y-%m-%d %H:%M:%S")
    
    specific_data <- data_hpc[data_hpc$Date == "2007-02-01" | data_hpc$Date == "2007-02-02",]

#create diagram for plot2
    with(specific_data, plot(DateTime, Global_active_power, type="l",ylab="Global Active Power (kilowatts)", xlab="" ))
    
    dev.copy(png, file = "plot2.png") 
    dev.off()
