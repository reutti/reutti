library(data.table)
##download the data directory and unzip it
file<-"household_power_consumption.txt"
if (!file.exists(file)){
 url<-"https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
 download.file(url,"datex1.zip")
 unzip("datex1.zip")
}
 ##convert into readble dataframe
 dat<-fread(file)
 
 ##subset only relvant dates
 dat1 <- subset(dat, Date %in% c("1/2/2007","2/2/2007"))
 
 ##change column classes
 dat1$Date <- as.Date(dat1$Date, format="%d/%m/%Y")
 dat1$Sub_metering_1<-as.numeric(dat1$Sub_metering_1)
 dat1$Sub_metering_2<-as.numeric(dat1$Sub_metering_2)
 dat1$Sub_metering_3<-as.numeric(dat1$Sub_metering_3)
 
dat1$date_time<-paste(dat1$Date,dat1$Time)
 dat1$date_time<-as.POSIXct(dat1$date_time)

  ##plot3
 par(mfcol=c(1,1))
 with(dat1,plot(Sub_metering_1~date_time,col="black",type="l",
      ylab="Energy sub metering", xlab="")) 
 with(dat1,lines(Sub_metering_2~date_time,col="red" ,type="l"))
 with(dat1,lines(Sub_metering_3~date_time,col="blue" ,type="l"))
 legend("topright",col=c("black", "red", "blue"), lty=1, lwd=2, 
        legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
 
 ##copy plot to png file
 dev.copy(png,file="plot_3.png")
 dev.off