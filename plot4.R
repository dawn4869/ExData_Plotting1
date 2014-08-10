# Read data and subsetting------------------------------
data<-read.table("household_power_consumption.txt",header=TRUE, na="?",sep=";")
data.selectdate.1<-subset(data,data$Date == "1/2/2007")
data.selectdate.2<-subset(data,data$Date == "2/2/2007")
data.selectdate<-rbind(data.selectdate.1,data.selectdate.2)

data.selectdate$Date <- strptime(paste(data.selectdate$Date,data.selectdate$Time), "%d/%m/%Y %H:%M:%S")

# Set layout for mutiple plots
par(mfrow=c(2,2))

# Plot figure 1: Global Active Power---------------------------------------
with(data.selectdate,{
        plot(data.selectdate$Date,data.selectdate$Global_active_power, type="n",ylab="Global Active Power(kilowatts)",xlab="")
        lines(data.selectdate$Date,data.selectdate$Global_active_power)
})

# Plot figure 2: Voltage---------------------------------------------------------------
with (data.selectdate,{
        plot(data.selectdate$Date,data.selectdate$Voltage,type="n",ylab="Voltage",xlab="datetime")
        lines(data.selectdate$Date,data.selectdate$Voltage)
})

# Plot figure 3: Energy sub metering---------------------------------------------
with (data.selectdate,{
        plot(data.selectdate$Date,data.selectdate$Sub_metering_1,type="n",ylab="Energy sub metering",xlab="")
        lines(data.selectdate$Date,data.selectdate$Sub_metering_1)
        lines(data.selectdate$Date,data.selectdate$Sub_metering_2,col="red")
        lines(data.selectdate$Date,data.selectdate$Sub_metering_3,col="blue")
        legend("topright",lty="solid",col=c("black","blue","red"),legend=c("sub_metering_1","sub_metering_2","sub_metering_3"),cex=0.7)
})
# plot figure 4-----------------------------------------------------
with (data.selectdate,{
        plot(data.selectdate$Date,data.selectdate$Global_reactive_power,type="n",ylab="Global_reactive_power",xlab="datetime")
        lines(data.selectdate$Date,data.selectdate$Global_reactive_power)
})

dev.copy(png,file="plot4.png")
dev.off()