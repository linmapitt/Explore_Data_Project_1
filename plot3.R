mydata<-read.csv("household_power_consumption.txt", header=TRUE, sep=";")
data_f<-mydata[which(mydata$Date=="1/2/2007" | mydata$Date=="2/2/2007") ,]

par(mar=c(4,4,1,1))
data_f$datetime<-paste(data_f$Date, data_f$Time)
data_f$datetime<-strptime(data_f$datetime,"%d/%m/%Y %H:%M:%S")

plot(data_f$datetime, as.numeric(as.character(data_f$Sub_metering_1)),type="l",ylab="Energy Sub Metering",xlab="")
lines(data_f$datetime, as.numeric(as.character(data_f$Sub_metering_2)),type="l", col="red")
lines(data_f$datetime, data_f$Sub_metering_3,type="l",col="blue")
legend("topright",lty=c(1,1,1),col=c("black","red","blue"),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
dev.copy(png, file="plot3.png")
dev.off()