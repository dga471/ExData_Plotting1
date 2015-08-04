df <- read.table("epower.txt",sep=";",header = TRUE,stringsAsFactors = FALSE)
df$Date = as.Date(df$Date,"%d/%m/%Y")
sf <- df[df$Date >= "2007-02-01" & df$Date <= "2007-02-02",]
sf$Time = strptime(sf$Time,"%H:%M:%S")
sf$Global_active_power = as.numeric(sf$Global_active_power)

png("plot1.png",width = 480, height = 480)
hist(sf$Global_active_power,col="red",main = "Global Active Power",xlab = "Global Active Power (kilowatts)")
dev.off()