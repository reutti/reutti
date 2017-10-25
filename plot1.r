

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
 dat1$Global_active_power<-as.numeric(dat1$Global_active_power)
 
 ##plot1
 
 par(mfcol=c(1,1))
 hist(dat1$Global_active_power, main="Global Active Power", 
      xlab="Global Active Power (kilowatts)", ylab="Frequency", col="Red")
 
 ##copy plot to png file
 dev.copy(png,file="plot_1.png")
 dev.off