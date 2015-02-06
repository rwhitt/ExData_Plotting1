#Read table for all rows encompassing 2007-02-01 through 2007-02-02
rows <- read.table("household_power_consumption.txt", header = FALSE, sep=";", skip = 66637, 
                   nrows = 2881)

#Read Header Row and apply to data
header <- strsplit(readLines('household_power_consumption.txt', n=1),";")
header <- unlist(header, recursive=FALSE)
colnames(rows) <- header

#Merge Time with Date and convert to POSIXlt format
rows$Date <- strptime(paste(rows$Date,rows$Time), "%d/%m/%Y %H:%M:%S")

#Open png device
png("plot4.png", height = 480, width = 480)

#size plot area
par(mfcol = c(2,2))
par(mar=c(4,4.2,4,2))

#create Global Active Power line chart
plot(rows$Date,rows$Global_active_power, type = "l", ylab = "Global Active Power", 
     xlab = "")

#create sub metering line chart
plot(rows$Date,rows$Sub_metering_1, type = "l", ylab = "Energy sub metering", xlab = "")
points(rows$Date,rows$Sub_metering_2, col='red', type='l')
points(rows$Date,rows$Sub_metering_3, col='blue', type='l')
#add legend
legend("topright", c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), lty =1, 
       col = c("black","red","blue"), bty ="n", cex = 0.9)

#create Voltage line chart
plot(rows$Date,rows$Voltage, type = "l", ylab = "Voltage", 
     xlab = "datetime")

#create Global_reactive_power line chart
plot(rows$Date,rows$Global_reactive_power, type = "l", ylab = "Global_reactive_power", 
     xlab = "datetime")

#close png
dev.off()
