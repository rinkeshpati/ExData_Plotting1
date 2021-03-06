dat <- read.table("household_power_consumption.txt",  sep=";") 
data <- rbind(dat[grep(as.Date("1/2/2007",format = '%d/%m/%Y'),as.Date(dat[,1], format = '%d/%m/%Y')),],dat[grep(as.Date("2/2/2007",format = '%d/%m/%Y'),as.Date(dat[,1], format = '%d/%m/%Y')),])
plot(strptime(paste(data[,1], data[,2]), format = '%d/%m/%Y %H:%M:%OS'), as.numeric(as.character(data[,3])), pch = ".", type = "o", xlab = "", ylab = "Global Active Power (kilowatts)")
dev.copy(png, file = "plot2.png")
dev.off()