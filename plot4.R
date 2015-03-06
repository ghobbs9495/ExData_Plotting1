# Main data set read into 'data' fromt .txt file
data<- read.table("C:\\Users\\ghobbs\\Desktop\\Household\\household_power_consumption.txt", sep=";", header=T, stringsAsFactors = F)

# Subset  data with date equal to one or the other dates given below
data<- subset(data, (data$Date == "1/2/2007" | data$Date== "2/2/2007")) 

# date format changed to %d/%m/%Y
data$Date <- as.Date(data$Date, format = "%d/%m/%Y")
data$DateTime <- as.POSIXct(paste(data$Date, data$Time))

# creates png file for plot
png("plot4.png")

# Set graphical parameters; Quads
par(mfrow=c(2,2),width=240, height= 240) 

# II Upper left plot
plot(data$DateTime, data$Global_active_power, type= "l", lwd=1, ylab= "Global Active Power (kilowatts)", xlab="") 

# I Upper right plot
plot(data$DateTime, data$Voltage, type="l", xlab="datetime", ylab="Voltage")   

# III Lower left plot
plot(data$DateTime, data$Sub_metering_1, type="l", ylab= "Energy sub metering", xlab="")
lines(data$DateTime, data$Sub_metering_2, type="l", col="red")
lines(data$DateTime, data$Sub_metering_3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, bty="n", col=c("black", "red", "blue")) 

# IV Lower right plot
plot(data$DateTime, data$Global_reactive_power, type="l", xlab="datetime", ylab="Global_reactive_power")  

# shuts down current graphical device
dev.off()
