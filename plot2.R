data <- read.table(
"/home/bdg/coursera_ds/household_power_consumption.txt",
header=TRUE, sep=";")

data$Date <- as.Date(data$Date,format = "%d/%m/%Y")
data$Time <- strptime(data$Time, format = "%H:%M:%S")
data$Time <- sub(".* ", "", data$Time)
data$timeDate <- strptime(paste(data$Date,data$Time),
                          format = "%Y-%m-%d %H:%M:%S")
data <- subset(data, Date %in% as.Date(c("2007-02-01","2007-02-02")))

data$Global_active_power <- 
        as.numeric(as.character(data$Global_active_power))

png("plot2.png",height=480, width=480)
plot(data$timeDate,data$Global_active_power,type="l",xlab="",
     ylab="Global Active Power (kilowatts)")
dev.off()
