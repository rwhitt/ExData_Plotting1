#Read table for all rows encompassing 2007-02-01 through 2007-02-02
rows <- read.table("household_power_consumption.txt", header = FALSE, sep=";", skip = 66637, 
                   nrows = 2881)

#Read Header Row and apply to data
header <- strsplit(readLines('household_power_consumption.txt', n=1),";")
header <- unlist(header, recursive=FALSE)
colnames(rows) <- header


#Merge Time with Date and convert to POSIXlt format
rows$Date <- strptime(paste(rows$Date,rows$Time), "%d/%m/%Y %H:%M:%S")

#set margin
par(mar=c(5.1,4.1,4.1,2.1))

#create line chart
plot(rows$Date,rows$Global_active_power, type = "l", ylab = "Global Active Power (kilowatts)", 
     xlab = "")

#print file to png
dev.copy(png, file = "plot2.png")
dev.off()

