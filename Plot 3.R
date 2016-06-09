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

##Create new variable and attach it to the table 
datetime <- paste(as.Date(data_sort$Date), data_sort$Time)
data_sort$datetime<-as.POSIXct(datetime)
 
##Plotting the graph
with(data_sort, plot(data_sort$Sub_metering_1,data_sort$datetime, xlab=" ", ylab="Energy Sub Metering", type="l"))
with(data_sort, points(data_sort$Sub_metering_2,data_sort$datetime, col="red", type="l"))
with(data_sort, points(data_sort$Sub_metering_3,data_sort$datetime, col="blue", type="l"))
dev.copy(png, file="Plot 3.png", height=480, width=480)
dev.off()
