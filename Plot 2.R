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
data_sort$Datetime<-as.POSIXct(datetime)
 
##Plotting the graph
with(data_sort, plot(data_sort$Global_active_power, data_sort$datetime, xlab=" ", ylab=" Global Active Power (kilowatts)", type="l"))
dev.copy(png, file="Plot 2.png", height=480, width=480)
dev.off()

