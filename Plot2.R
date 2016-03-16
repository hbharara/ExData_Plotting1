## Plot 2 R Script File
df <- read.table('/users/HimanshuBharara/Desktop/household_power_consumption.txt',sep=";",dec=".",header=TRUE)
df$Date <- as.Date(df$Date,format="%d/%m/20%y")
df1 <- subset(df,Date >= "2007-02-01" & Date <= "2007-02-02")

df1$WeekDays <- substring(weekdays(strptime(paste(df1$Date,df1$Time),format="%Y-%m-%d %H:%M:%S")),1,3)
df1$TimeStamp <- strptime(paste(df1$Date,df1$Time),format="%Y-%m-%d %H:%M:%S")
Sys.setlocale("LC_TIME","C")
with(df1,plot(TimeStamp,as.numeric(as.character(Global_active_power)), 
              type ="l", ylab = "Global Active Power (kilowatts)",xlab=" "
              ,ylim=c(0,6)))
dev.copy(png, file = "/Users/HimanshuBharara/Desktop/EDA-Coursera/Assignment1/plot2.png", width=480,height=480)
dev.off()
