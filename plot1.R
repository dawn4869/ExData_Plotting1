# Read data and subsetting------------------------------
data<-read.table("household_power_consumption.txt",header=TRUE, na="?",sep=";")
data.selectdate.1<-subset(data,data$Date == "1/2/2007")
data.selectdate.2<-subset(data,data$Date == "2/2/2007")
data.selectdate<-rbind(data.selectdate.1,data.selectdate.2)
# Plot the data---------------------------------------
with(data,hist(data.selectdate$Global_active_power,col="red",main="Global Active Power",xlab="Global Active Power(kilowatts)"))
dev.copy(png,file="plot1.png")
dev.off()