mydata<-read.csv("household_power_consumption.txt", header=TRUE, sep=";")
data_f<-mydata[which(mydata$Date=="1/2/2007" | mydata$Date=="2/2/2007") ,]

par(mar=c(4,4,1,1))
power<-data_f[3]
power_na<-power[!is.na(power)]
hist(as.numeric(as.character(power_na)), col="red", xlab="Global Active Powers (kilowatts", main="Global Active Power")
dev.copy(png, file="plot1.png")
dev.off()