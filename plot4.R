proj1dat<-read.table("./household_power_consumption.txt",header=TRUE,sep=";",na.strings="?")
d1<-proj1dat[(proj1dat$Date=="1/2/2007"),] ##subset data for Feb 1st, 2007
d2<-proj1dat[(proj1dat$Date=="2/2/2007"),]  ##subset data for Feb 2nd, 2007
d<-rbind(d1,d2) ##combine data for Feb 1st and Feb 2nd to make project dataset
d$datetime<-paste(d$Date,d$Time) ##create column with combined date and time
d$datetime<-strptime(d$datetime,format="%d/%m/%Y %H:%M:%S") ##convert date/time into POSIT format
par(mfrow=c(2,2)) ## define structure for multiple base plots
plot(d$datetime,d$Global_active_power,type="l",ylab="Global Active Power",cex=0.6,xlab=" ") ##Create plot 2 line chart
plot(d$datetime,d$Voltage,type="l",ylab="Voltage",xlab="datetime") ##Create new Voltage line chart
plot(d$datetime,d$Sub_metering_1,type="n",ylab="Energy sub metering",xlab=" ") ##Create chart skeleton for plot 3 line chart
plot_colors<-c("blue","red","forestgreen") ## select colors for lines
lines(d$datetime,d$Sub_metering_1,type="l",lty=1,col=plot_colors[1])  ##plot line for sub_metering_1
lines(d$datetime,d$Sub_metering_2,type="l",lty=1,col=plot_colors[2])  ##plot line for sub_metering_2
lines(d$datetime,d$Sub_metering_3,type="l",lty=1,col=plot_colors[3])  ##plot line for sub_metering_3
legend("topright",lty=1,col=plot_colors,legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),bty="n",y.intersp=0.6,seg.len=0.5,xjust=0,cex=0.7,inset=c(.13,0)) ##Add legend for 3 lines
plot(d$datetime,d$Global_reactive_power,type="l",ylab="Global Reactive Power",xlab="datetime") ##Create new Global Reactive Power line chart
dev.copy(png,file="plot4.png")  ##copy histogram to a PNG file
dev.off()  ##close PNG device