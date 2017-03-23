fileURL <-"https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
download.file(fileURL, destfile= "~/Documents/Coursera/project_exploratory", method="curl")

#unzip file
unzip("~/Documents/Coursera/project_exploratory")

measures<-read.csv("household_power_consumption.txt", header=TRUE, sep=";", na.strings = "?")
names(measures)

measures$Date<-as.Date(measures$Date, "%d/%m/%Y")
measures$Time<-strptime(measures$Time, format="%H:%M:%S")
measures$Time<-format(measures$Time, format="%H:%M:%S")
measures$Global_active_power<-as.numeric(measures$Global_active_power)
measures$Global_reactive_power<-as.numeric(measures$Global_reactive_power)
measures$Global_intensity<-as.numeric(measures$Global_intensity)
measures$Voltage<-as.numeric(measures$Voltage)
measures$Sub_metering_1<-as.numeric(measures$Sub_metering_1)
measures$Sub_metering_2<-as.numeric(measures$Sub_metering_2)
measures$Sub_metering_3<-as.numeric(measures$Sub_metering_3)
measures_subset$datetime <- with(measures_subset, as.POSIXct(paste(Date, Time), format="%Y-%m-%d %H:%M:%S"))

measures_subset<-subset(measures, Date=="2007-02-01"|Date=="2007-02-02")

png("plot2.png", width=480, height=480)
with(measures_subset, plot(datetime, Global_active_power, type="l", ylab="Global Active Power (kilowatts)"))
dev.off()
