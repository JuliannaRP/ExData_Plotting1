temp <- tempfile()
download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip",temp)
header <- read.table(unz(temp, "household_power_consumption.txt"),sep=";",nrows=1,header=FALSE,stringsAsFactors = FALSE)
data <- read.table(unz(temp, "household_power_consumption.txt"),sep=";",header=TRUE,skip=66636,nrows=2880,quote="",na.strings="?")
unlink(temp)
colnames(data) <- unlist(header)
x <- c("Thu","Fri","Sat")
a <- c(1,1440,2880)
set <- 1:2880
leg <- c("Sub_metering_1","Sub_metering_2","Sub_metering_3")
png("plot4.png", width=480, height=480)
par(mfcol=c(2,2))
##Plot A
plot(set,data$Global_active_power,type="l",ylab="Global Active Power (kilowatts)",xlab="",main="",xaxt="n")
axis(1, at=a, labels=x)
##Plot B
plot(set,data$Sub_metering_1,type="n",ylab="Energy sub metering",xlab="",main="",xaxt="n")
axis(1, at=a, labels=x)
lines(set,data$Sub_metering_1, type="l")
lines(set,data$Sub_metering_2, type="l", col="red")
lines(set,data$Sub_metering_3, type="l", col="blue")
legend("topright",leg,lty=c(1,1),bty="n",col=c("black","red","blue"))
##Plot C
plot(set,data$Voltage,type="l",ylab="Voltage",xlab="datetime",main="",xaxt="n")
axis(1, at=a, labels=x)
##Plot D
plot(set,data$Global_reactive_power,type="l",ylab="Global_reactive_power",xlab="datetime",main="",xaxt="n")
axis(1, at=a, labels=x)
dev.off()
