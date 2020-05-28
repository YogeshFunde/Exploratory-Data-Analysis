
#Storing file URL
FileUrl <-"https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"

#destination zip file
DestFile <- paste0(getwd(), "/", "powerconsumption.zip")
download.file(url = FileUrl , destfile = DestFile )
unzip(DestFile)

Data <- read.table("household_power_consumption.txt", header = TRUE, sep=";") #Reading text file seperated by semicolon (;)
Data <- Data[strptime(Data$Date,"%d/%m/%Y") >="2007-02-01" & strptime(Data$Date,"%d/%m/%Y") <="2007-02-02" ,] #subsetting the data for the selected

mydates <- strptime(paste(Data$Date, Data$Time), "%d/%m/%Y %H:%M:%S")
plot(x=mydates, y=as.numeric(Data$Global_active_power)/500, type="l", ylab = "Global Active Power(kilowatts)", xlab = "")

dev.copy(png, file="plot2.png")
dev.off()