df <- read.table("epower.txt",sep=";",header = TRUE,stringsAsFactors = FALSE)
df$Date = as.Date(df$Date,"%d/%m/%Y")
sf <- df[df$Date >= "2007-02-01" & df$Date <= "2007-02-02",]
sf$comb <- paste(sf$Date,sf$Time)
sf$comb = strptime(sf$comb,"%Y-%m-%d %H:%M:%S")
sf$Global_active_power = as.numeric(sf$Global_active_power)

png("plot4.png",width = 480, height = 480)
par(mfrow=c(2,2))
plot(sf$comb,sf$Global_active_power,xlab = "",ylab = "Global Active Power",type = "l")
plot(sf$comb,as.numeric(sf$Voltage),xlab = "datetime",ylab = "Voltage",type = "l")

plot(sf$comb,as.numeric(sf$Sub_metering_1),type = "l",xlab = "",ylab = "Energy sub metering",ylim = c(0,40))
lines(sf$comb,as.numeric(sf$Sub_metering_2),col = "red")
lines(sf$comb,as.numeric(sf$Sub_metering_3),col = "blue")
legend("topright",c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),lty = c(1,1,1),col = c("black","red","blue"))

plot(sf$comb,as.numeric(sf$Global_reactive_power),xlab = "datetime",ylab = "Global_reactive_power",type = "l")
dev.off()