# Read data and subsetting------------------------------
data<-read.table("household_power_consumption.txt",header=TRUE, na="?",sep=";")
data.selectdate.1<-subset(data,data$Date == "1/2/2007")
data.selectdate.2<-subset(data,data$Date == "2/2/2007")
data.selectdate<-rbind(data.selectdate.1,data.selectdate.2)
# Plot the data---------------------------------------
data.selectdate$Date <- strptime(paste(data.selectdate$Date,data.selectdate$Time), "%d/%m/%Y %H:%M:%S")
plot(data.selectdate$Date,data.selectdate$Global_active_power, type="n",ylab="Global Active Power(kilowatts)",xlab="")
lines(data.selectdate$Date,data.selectdate$Global_active_power)

dev.copy(png,file="plot2.png")
dev.off()