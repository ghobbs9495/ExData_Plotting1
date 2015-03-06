# Main data set read into 'data' fromt .txt file
data<- read.table("C:\\Users\\ghobbs\\Desktop\\Household\\household_power_consumption.txt", sep=";", header=T, stringsAsFactors = F)

# Subset  data with date equal to one or the other dates given below 
data<- subset(data, (data$Date == "1/2/2007" | data$Date== "2/2/2007")) 

# date format changed to %d/%m/%Y
data$Date <- as.Date(data$Date, format = "%d/%m/%Y")

# manipulates calendar dates and times
data$DateTime <- as.POSIXct(paste(data$Date, data$Time))

# creates png file for plot
png("plot2.png",width=480, height= 480)

plot(data$DateTime, data$Global_active_power, type= "l", lwd=1, ylab= "Global Active Power (kilowatts)", xlab="")

# shuts down current graphical device
dev.off()