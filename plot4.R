dat <- read.table("household_power_consumption.txt",  sep=";") 
data <- rbind(dat[grep(as.Date("1/2/2007",format = '%d/%m/%Y'),as.Date(dat[,1], format = '%d/%m/%Y')),],dat[grep(as.Date("2/2/2007",format = '%d/%m/%Y'),as.Date(dat[,1], format = '%d/%m/%Y')),])
par(mfrow=c(2,2))
plot(strptime(paste(data[,1], data[,2]), format = '%d/%m/%Y %H:%M:%OS'), as.numeric(as.character(data[,3])), pch = ".", type = "o", xlab = "", ylab = "Global Active Power")
plot(strptime(paste(data[,1], data[,2]), format = '%d/%m/%Y %H:%M:%OS'), as.numeric(as.character(data[,5])), pch = ".", type = "o", xlab = "datetime", ylab = "Voltage")

plot(strptime(paste(data[,1], data[,2]), format = '%d/%m/%Y %H:%M:%OS'), as.numeric(as.character(data[,7])), pch = ".", type = "o", xlab = "", ylab= "Energy sub metering")
lines(strptime(paste(data[,1], data[,2]), format = '%d/%m/%Y %H:%M:%OS'), as.numeric(as.character(data[,8])), col = "red")
lines(strptime(paste(data[,1], data[,2]), format = '%d/%m/%Y %H:%M:%OS'), as.numeric(as.character(data[,9])), col = "blue")
legend("topright", bty = "n", lty = c(1,1,1), lwd = c(1.5,1.5,1.5), col = c("black","red", "blue"), legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),  pt.cex=1, cex=0.5)
plot(strptime(paste(data[,1], data[,2]), format = '%d/%m/%Y %H:%M:%OS'), as.numeric(as.character(data[,4])), pch = ".", type = "o", xlab = "datetime", ylab = "Global_reactive_power")

dev.copy(png, file = "plot4.png")
dev.off()