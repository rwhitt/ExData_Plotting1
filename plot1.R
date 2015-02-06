#plot1.R creates a histogram for all Global Active Power readings from 2007-02-01 through 2007-02-02

#Read table for all rows encompassing 2007-02-01 through 2007-02-02
rows <- read.table("household_power_consumption.txt", header = FALSE, sep=";", skip = 66637, 
                   nrows = 2881)

#Read Header Row and apply to data
header <- strsplit(readLines('household_power_consumption.txt', n=1),";")
header <- unlist(header, recursive=FALSE)
colnames(rows) <- header

#set margin
par(mar=c(5.1,4.1,4.1,2.1))

#create historgram
hist(rows$Global_active_power,ylim = c(0,1200), col = "red", main = "Global Active Power", 
     xlab = "Global Active Power (kilowatts)")

#print file to png
dev.copy(png, file = "plot1.png")
dev.off()
