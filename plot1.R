proj1dat<-read.table("./household_power_consumption.txt",header=TRUE,sep=";",na.strings="?")
d1<-proj1dat[(proj1dat$Date=="1/2/2007"),] ##subset data for Feb 1st, 2007
d2<-proj1dat[(proj1dat$Date=="2/2/2007"),]  ##subset data for Feb 2nd, 2007
d<-rbind(d1,d2) ##combine data for Feb 1st and Feb 2nd to make project dataset
hist(d$Global_active_power,main="Global Active Power",xlab="Global Active Power (kilowatts)",col="blue") ##Create histogram on screen device
dev.copy(png,file="plot1.png")  ##copy histogram to a PNG file
dev.off()  ##close PNG device
