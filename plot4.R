################################plot4.R
df1 <- read.table('household_power_consumption.txt', header = TRUE, sep = ";", 
                  quote = "\"", dec = ".", stringsAsFactors = F)


df1 <- df1[( df1$Date == '1/2/2007' |  df1$Date == '2/2/2007' ), ]

df1 <- transform(df1, Date = as.Date(Date, "%d/%m/%Y"),
                 #Time = format(strptime(Time, "%H:%M:%S"), format="%H:%M:%S"),
                 #Time = strptime(paste(Date,Time), "%Y/%m/%m %H:%M:%S"),
                 Global_active_power = as.numeric(Global_active_power), 
                 Global_reactive_power = as.numeric(Global_reactive_power),
                 Voltage = as.numeric(Voltage), Global_intensity = as.numeric(Global_intensity),
                 Sub_metering_1 = as.numeric(Sub_metering_1),
                 Sub_metering_2 = as.numeric(Sub_metering_2))


df1 <- transform(df1, 
                 #Time = format(strptime(Time, "%H:%M:%S"), format="%H:%M:%S"),
                 Time = strptime(paste(Date,Time),"%Y-%m-%d %H:%M:%S")
)




par(mfcol = c(2, 2))

plot(df1$Time, df1$Global_active_power,  
     ylab = "Global Active Power (kilowatts)", xlab ='',
     type = "l", lwd = 1
) 


plot(df1$Time, df1$Sub_metering_1,  
     ylab = "Energy sub metering", xlab ='',
     type = "n"
) 
lines(df1$Time, df1$Sub_metering_1, col = "black")
lines(df1$Time, df1$Sub_metering_2, col = "red")
lines(df1$Time, df1$Sub_metering_3, col = "blue")
legend("topright", pch = '-', col = c("black", "red", "blue"), 
       legend = names(df1)[7:9], cex = 0.4)

plot(df1$Time, df1$Voltage,  
     ylab = "Voltage", xlab ='datetune',
     type = "l", lwd = 1
) 

plot(df1$Time, df1$Global_reactive_power,  
     xlab ='datetune',
     type = "l", lwd = 1
) 

par(mfrow = c(1, 1))

dev.copy(png, file = "plot4.png", width = 480, height = 480, units = "px") ## Copy my plot to a PNG file
dev.off() 

