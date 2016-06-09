##Input Data
data<-read.table("household_power_consumption.txt", header=T, sep=";", na.strings="?")

## Convert the Date to the required format
data$Date<-as.Date(data$Date, format="%d/%m/%Y")

## Sub Sorting the data for the required range
data_sort<-subset(data, Date >="2007-02-01" & Date <= "2007-02-02")

## Convert the data to numeric form 
data_sort$Gloabl_active_power<-as.numeric(as.character(data_sort$Global_active_power))

##Remove the Large Data 
rm(data)

##Plot the histogram 
hist(data_sort$Global_active_power, maiin="Global Active Power", xlab="Global Active Power (kilowatts)", ylabs="Frequency", col="red")

##Saving the Graph 
png(filename="Plot 1.png")
plot(hist(data_sort$Global_active_power, main="Global Active Power", xlab="Global Active Power (kilowatts)", ylabs="Frequency", col="red"))
dev.off()
