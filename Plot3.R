## Plot 3 R Script File
df <- read.table('/users/HimanshuBharara/Desktop/household_power_consumption.txt',sep=";",dec=".",header=TRUE)
df$Date <- as.Date(df$Date,format="%d/%m/20%y")
df1 <- subset(df,Date >= "2007-02-01" & Date <= "2007-02-02")

df1$WeekDays <- substring(weekdays(strptime(paste(df1$Date,df1$Time),format="%Y-%m-%d %H:%M:%S")),1,3)
df1$TimeStamp <- strptime(paste(df1$Date,df1$Time),format="%Y-%m-%d %H:%M:%S")
Sys.setlocale("LC_TIME","C")

with(df1,plot(TimeStamp,as.numeric(as.character(Sub_metering_1)), type ="l" 
              , ylab = "Global Active Power (kilowatts)"
              , xlab=" ",col="black"))
points(df1$TimeStamp,as.numeric(as.character(df1$Sub_metering_2)),col="red",type="l")
points(df1$TimeStamp,as.numeric(as.character(df1$Sub_metering_3)),col="blue",type="l")
legend("topright",cex=0.6,lty=1:1,col=c("black","red","blue"),
       legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
dev.copy(png, file = "/Users/HimanshuBharara/Desktop/EDA-Coursera/Assignment1/plot3.png", width=480,height=480)
dev.off()
