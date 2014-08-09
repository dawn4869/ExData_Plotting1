# Read data and subsetting------------------------------
data<-read.table("household_power_consumption.txt",header=TRUE, na="?",sep=";")
data.selectdate.1<-subset(data,data$Date == "1/2/2007")
data.selectdate.2<-subset(data,data$Date == "2/2/2007")
data.selectdate<-rbind(data.selectdate.1,data.selectdate.2)
data.selectdate$Date <- strptime(paste(data.selectdate$Date,data.selectdate$Time), "%d/%m/%Y %H:%M:%S")
#Plot graph------------------------------------------------------------
plot(data.selectdate$Date,data.selectdate$Sub_metering_1,type="n",ylab="Energy sub metering",xlab="")
lines(data.selectdate$Date,data.selectdate$Sub_metering_1)
lines(data.selectdate$Date,data.selectdate$Sub_metering_2,col="red")
lines(data.selectdate$Date,data.selectdate$Sub_metering_3,col="blue")

legend("topright",lty="solid",col=c("black","blue","red"),legend=c("sub_metering_1","sub_metering_2","sub_metering_3"))

dev.copy(png,file="plot3.png")
dev.off()
