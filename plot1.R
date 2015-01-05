data <- read.table(
"/home/bdg/coursera_ds/household_power_consumption.txt",
header=TRUE, sep=";")

data$Date <- as.Date(data$Date,format = "%d/%m/%Y")
data$Time <- strptime(data$Time, format = "%H:%M:%S")

data <- subset(data, Date %in% as.Date(c("2007-02-01","2007-02-02")))

png("plot1.png",height=480, width=480)
hist(as.numeric(as.character(data$Global_active_power)), col="red", main="Global Active Power",
     xlab= "Global Active Power (kilowatts)")
dev.off()
