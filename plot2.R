mydata<-read.csv("household_power_consumption.txt", header=TRUE, sep=";")
data_f<-mydata[which(mydata$Date=="1/2/2007" | mydata$Date=="2/2/2007") ,]

par(mar=c(4,4,1,1))
data_f$datetime<-paste(data_f$Date, data_f$Time)
data_f$datetime<-strptime(data_f$datetime,"%d/%m/%Y %H:%M:%S")
plot(data_f$datetime, as.numeric(as.character(data_f$Global_active_power)), type="l", ylab="Global Active Power (kilowatts)", xlab="")
dev.copy(png, file="plot2.png")
dev.off()