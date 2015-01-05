### Read data in from txt file

data <- read.table(
"/home/bdg/coursera_ds/household_power_consumption.txt",
header=TRUE, sep=";")

### Change Date and Time to proper R date format
### then create new var timeDate which is Time and Date combined

data$Date <- as.Date(data$Date,format = "%d/%m/%Y")
data$Time <- strptime(data$Time, format = "%H:%M:%S")
data$Time <- sub(".* ", "", data$Time)
data$timeDate <- strptime(paste(data$Date,data$Time),
                          format = "%Y-%m-%d %H:%M:%S")

### get subset of data that we need

data <- subset(data, Date %in% as.Date(c("2007-02-01","2007-02-02")))

### Change needed vars from factor to numeric

data$Global_active_power <- 
        as.numeric(as.character(data$Global_active_power))
data$Global_reactive_power <- 
        as.numeric(as.character(data$Global_reactive_power))
data$Voltage <- 
        as.numeric(as.character(data$Voltage))
data$Sub_metering_1 <- 
        as.numeric(as.character(data$Sub_meterting_1))
data$Sub_metering_2 <- 
        as.numeric(as.character(data$Sub_meterting_2))
data$Sub_metering_3 <- 
        as.numeric(as.character(data$Sub_meterting_3))

### create plots and store in png file

png("plot4.png",height=480, width=480)
par(mfrow=c(2,2))
with(data,plot(data$timeDate,data$Global_active_power,type="l",xlab="",
               ylab="Global Active Power"))
with(data,plot(data$timeDate,data$Voltage,type="l",xlab="datetime",
               ylab="Voltage"))
with(data,plot(data$timeDate,data$Sub_metering_1,type="l",xlab="",
               ylab="Energy sub metering"))
with(data,lines(data$timeDate,data$Sub_metering_2,col="red"))
with(data,lines(data$timeDate,data$Sub_metering_3,col="blue"))
legend("topright",lty=c(1,1),col=c("black", "red","blue"),bty="n",
       legend = c("Sub_metering_1", "Sub_metering_2","Sub_metering_3"))
with(data,plot(data$timeDate,data$Global_reactive_power,type="l",
               xlab="datetime",ylab="Global_reactive_power"))
dev.off()
