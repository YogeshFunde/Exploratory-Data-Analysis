
#Storing file URL
FileUrl <-"https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"

#destination zip file
DestFile <- paste0(getwd(), "/", "powerconsumption.zip")
download.file(url = FileUrl , destfile = DestFile )
unzip(DestFile)

Data <- read.table("household_power_consumption.txt", header = TRUE, sep=";") #Reading text file seperated by semicolon (;)
Data <- Data[strptime(Data$Date,"%d/%m/%Y") >="2007-02-01" & strptime(Data$Date,"%d/%m/%Y") <="2007-02-02" ,] #subsetting the data for the selected
hist(as.numeric(Data$Global_active_power)/500, col="red", xlab = "Global Active Power(kilowatts)",main="Global Active Power")

dev.copy(png, file="plot1.png")
dev.off()