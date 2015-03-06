# Main data set read into 'data' fromt .txt file
data<- read.table("C:\\Users\\ghobbs\\Desktop\\Household\\household_power_consumption.txt", sep=";", header=T, stringsAsFactors = F)

# Subset  data with date equal to one or the other dates given below 
data<- subset(data, (data$Date == "1/2/2007" | data$Date== "2/2/2007")) 

# date format changed to %d/%m/%Y
data$Date <- as.Date(data$Date, format = "%d/%m/%Y")

# manipulates calendar dates and times
data$DateTime <- as.POSIXct(paste(data$Date, data$Time))

# creates png file for plot
png("plot3.png",width=480, height= 480)

# Plots created
plot(data$DateTime, data$Sub_metering_1, type="l", ylab= "Energy sub metering", xlab="")
lines(data$DateTime, data$Sub_metering_2, type="l", col="red")
lines(data$DateTime, data$Sub_metering_3, type="l", col="blue")

# Creates legend for plot
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, col=c("black", "red", "blue"))

# shuts down current graphical device
dev.off()