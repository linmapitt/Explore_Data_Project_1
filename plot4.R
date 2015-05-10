mydata<-read.csv("household_power_consumption.txt", header=TRUE, sep=";")
data_f<-mydata[which(mydata$Date=="1/2/2007" | mydata$Date=="2/2/2007") ,]

par(mar=c(4,4,1,1))
par(mfrow=c(2,2)) 
data_f$datetime<-paste(data_f$Date, data_f$Time)
data_f$datetime<-strptime(data_f$datetime,"%d/%m/%Y %H:%M:%S")

plot(data_f$datetime, as.numeric(as.character(data_f$Global_active_power)),type="l",ylab="Global Active Power",xlab="")
plot(data_f$datetime, as.numeric(as.character(data_f$Voltage)),type="l",ylab="Voltage",xlab="datetime")

plot(data_f$datetime, as.numeric(as.character(data_f$Sub_metering_1)),type="l",ylab="Energy Sub Metering",xlab="")
lines(data_f$datetime, as.numeric(as.character(data_f$Sub_metering_2)),type="l", col="red")
lines(data_f$datetime, data_f$Sub_metering_3,type="l",col="blue")
legend("topright",bty="n",lty=c(1,1,1),col=c("black","red","blue"),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))

plot(data_f$datetime, as.numeric(as.character(data_f$Global_reactive_power)),type="l",ylab="Global_reactive_power",xlab="datetime")

dev.copy(png, file="plot4.png")
dev.off()