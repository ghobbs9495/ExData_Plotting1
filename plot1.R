# Main data set read into 'data' fromt .txt file
data<- read.table("C:\\Users\\ghobbs\\Desktop\\Household\\household_power_consumption.txt", sep=";", header=T, stringsAsFactors = F, na.strings= "?")

# Subset  data with date equal to one or the other dates given below
data<- subset(data, (data$Date == "1/2/2007" | data$Date== "2/2/2007")) 

# creates png file for plot
png("plot1.png")

# Plot created
hist(data$Global_active_power, col= "red", xlab= "Global Active Power kilowatts", ylab= "Frequency", main= "Global Active Power")

# shuts down current graphical device
dev.off()