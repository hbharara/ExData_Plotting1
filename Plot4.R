## Plot 4 R Script File

df <- read.table('/users/HimanshuBharara/Desktop/household_power_consumption.txt',sep=";",dec=".",header=TRUE)
df$Date <- as.Date(df$Date,format="%d/%m/20%y")
df1 <- subset(df,Date >= "2007-02-01" & Date <= "2007-02-02")

df1$WeekDays <- substring(weekdays(strptime(paste(df1$Date,df1$Time),format="%Y-%m-%d %H:%M:%S")),1,3)
df1$TimeStamp <- strptime(paste(df1$Date,df1$Time),format="%Y-%m-%d %H:%M:%S")
par(mfrow=c(2,2))
Sys.setlocale("LC_TIME","C")
#plot row 1 c 1
with(df1,plot(TimeStamp,as.numeric(as.character(Global_active_power)), 
              type ="l", ylab = "Global Active Power (kilowatts)",xlab=" "
              ,ylim=c(0,6)))
# plot row 1 c 2
with(df1,plot(TimeStamp,as.numeric(as.character(Voltage)),type="l",
              ylim=c(234,246),xlab="datetime",ylab="Voltage"))

# plot row 2 c 1
with(df1,plot(TimeStamp,as.numeric(as.character(Sub_metering_1)), type ="l" 
              , ylab = "Global Active Power (kilowatts)"
              , xlab=" ",col="black"))
points(df1$TimeStamp,as.numeric(as.character(df1$Sub_metering_2)),col="red",type="l")
points(df1$TimeStamp,as.numeric(as.character(df1$Sub_metering_3)),col="blue",type="l")
legend("topright",cex=0.6,lty=1:1,col=c("black","red","blue"),
       legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))

# plot row 2 c 2

with(df1,plot(TimeStamp,as.numeric(as.character(Global_reactive_power)),type="l",
              ylim=c(0.0,0.5),xlab="datetime",ylab="Global_reactive_power"))

# print the output to file.png
dev.copy(png, file = "/Users/HimanshuBharara/Desktop/EDA-Coursera/Assignment1/plot4.png", width=480,height=480)
dev.off()

