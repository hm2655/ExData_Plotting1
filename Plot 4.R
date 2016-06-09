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

#Plotting the Graph
par(mfrow=c(2,2))
plot(data$Global_active_power, data$datetime, xlab=" ", ylab=" Global Active Power", type="l")
plot(data$Voltage, data$datetime, xlab=" ", ylab=" Voltage", type="l")
with(data, plot(data$Sub_metering_1,data$datetime, xlab=" ", ylab="Energy Sub Metering", type="l"))
with(data, points(data$Sub_metering_2,data$datetime, type="l", col="red"))
with(data, points(data$Sub_metering_3,data$datetime, type="l", col="blue"))
plot(data$Global_active_power, data$datetime, xlab=" ", ylab=" Global Active Power", type="l")
dev.copy(png, "Plot 4.png", height=480, width=480)
dev.off()
