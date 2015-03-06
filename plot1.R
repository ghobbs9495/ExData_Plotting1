data<- read.table("C:\\Users\\ghobbs\\Desktop\\Household\\household_power_consumption.txt", sep=";", header=T, stringsAsFactors = F, na.strings= "?")

# Subsetting  data in two related days from main file: 
data<- subset(data, (data$Date == "1/2/2007" | data$Date== "2/2/2007")) 

# creating Plot1
png("plot1.png")

hist(data$Global_active_power, col= "red", xlab= "Global Active Power kilowatts", ylab= "Frequency", main= "Global Active Power")

dev.off()