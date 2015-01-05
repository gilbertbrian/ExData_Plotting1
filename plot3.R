data <- read.table(
"/home/bdg/coursera_ds/household_power_consumption.txt",
header=TRUE, sep=";")

data$Date <- as.Date(data$Date,format = "%d/%m/%Y")
data$Time <- strptime(data$Time, format = "%H:%M:%S")
data$Time <- sub(".* ", "", data$Time)
data$timeDate <- strptime(paste(data$Date,data$Time),
                          format = "%Y-%m-%d %H:%M:%S")
data <- subset(data, Date %in% as.Date(c("2007-02-01","2007-02-02")))


png("plot3.png",height=480, width=480)
with(data,plot(data$timeDate,data$Sub_metering_1,type="l",xlab="",
               ylab="Energy sub metering"))
with(data,lines(data$timeDate,data$Sub_metering_2,col="red"))
with(data,lines(data$timeDate,data$Sub_metering_3,col="blue"))
legend("topright",lty=c(1,1),col=c("black", "red","blue"),
       legend = c("Sub_metering_1", "Sub_metering_2","Sub_metering_3"))
dev.off()
