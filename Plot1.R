
## Plot 1 R Script File

df <- read.table('/users/HimanshuBharara/Desktop/household_power_consumption.txt',sep=";",dec=".",header=TRUE)
df$Date <- as.Date(df$Date,format="%d/%m/20%y")
df1 <- subset(df,Date >= "2007-02-01" & Date <= "2007-02-02")
hist(as.numeric(as.character(df1$Global_active_power)),col="red",main="Global Active Power",xlab="Global Active Power (kilowatts)",ylab="Frequency")
dev.copy(png, file = "/Users/HimanshuBharara/Desktop/EDA-Coursera/Assignment1/plot1.png", width=480,height=480)
dev.off()



