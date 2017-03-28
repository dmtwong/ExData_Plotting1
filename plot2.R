################################plot2.R
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

df2 <- transform(df1, 
                 #Time = format(strptime(Time, "%H:%M:%S"), format="%H:%M:%S"),
                 Time = strptime(paste(Date,Time),"%Y-%m-%d %H:%M:%S")
)
str(df2)
#names(unclass(df2$Time)); df2$Time[['mday']]

plot(df2$Time, df2$Global_active_power,  
     ylab = "Global Active Power (kilowatts)", xlab ='',
     type = "l", lwd = 1
) ## Create hist on screen device

dev.copy(png, file = "plot2.png", width = 480, height = 480, units = "px") ## Copy my plot to a PNG file
dev.off() 

