#We assume that the data file downloaded and unzipped from the internet is stored in the same folder as the R script file, with the name epower.txt
df <- read.table("epower.txt",sep=";",header = TRUE,stringsAsFactors = FALSE)
df$Date = as.Date(df$Date,"%d/%m/%Y")
sf <- df[df$Date >= "2007-02-01" & df$Date <= "2007-02-02",]
sf$comb <- paste(sf$Date,sf$Time)
sf$comb = strptime(sf$comb,"%Y-%m-%d %H:%M:%S")
sf$Global_active_power = as.numeric(sf$Global_active_power)

png("plot3.png",width = 480, height = 480)
plot(sf$comb,as.numeric(sf$Sub_metering_1),type = "l",xlab = "",ylab = "Energy sub metering",ylim = c(0,40))
lines(sf$comb,as.numeric(sf$Sub_metering_2),col = "red")
lines(sf$comb,as.numeric(sf$Sub_metering_3),col = "blue")
legend("topright",c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),lty = c(1,1,1),col = c("black","red","blue"))
dev.off()