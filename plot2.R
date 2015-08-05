#We assume that the data file downloaded and unzipped from the internet is stored in the same folder as the R script file, with the name epower.txt
df <- read.table("epower.txt",sep=";",header = TRUE,stringsAsFactors = FALSE)
df$Date = as.Date(df$Date,"%d/%m/%Y")
sf <- df[df$Date >= "2007-02-01" & df$Date <= "2007-02-02",]
sf$comb <- paste(sf$Date,sf$Time)
sf$comb = strptime(sf$comb,"%Y-%m-%d %H:%M:%S")
sf$Global_active_power = as.numeric(sf$Global_active_power)

png("plot2.png",width = 480, height = 480)
plot(sf$comb,sf$Global_active_power,xlab = "", ylab = "Global Active Power (kilowatts)",type = "l")
dev.off()