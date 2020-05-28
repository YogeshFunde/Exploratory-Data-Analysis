#Storing file URL
FileUrl <-"https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"

#destination zip file
DestFile <- paste0(getwd(), "/", "powerconsumption.zip")
download.file(url = FileUrl , destfile = DestFile )
unzip(DestFile)

Data <- read.table("household_power_consumption.txt", header = TRUE, sep=";", stringsAsFactors = FALSE) #Reading text file seperated by semicolon (;)
Data <- Data[strptime(Data$Date,"%d/%m/%Y") >="2007-02-01" & strptime(Data$Date,"%d/%m/%Y") <="2007-02-02" ,] #subsetting the data for the selected

mydates <- strptime(paste(Data$Date, Data$Time), "%d/%m/%Y %H:%M:%S")

plot(x=mydates, y=Data$Sub_metering_1, type="l", ylab = "Energy sub metering", xlab = "")
lines(x=mydates, y=Data$Sub_metering_2, col="red")
lines(x=mydates, y=Data$Sub_metering_3, col="blue")
legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col = c("Black", "blue", "red"), lty=1)

dev.copy(png, file="plot3.png") #sending the file to png device
dev.off()