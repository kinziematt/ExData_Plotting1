plot3<-function(){setwd("C:/Users/uawe/Desktop/Coursera/Data Science Specialization/Course 4 Exploratory Data Analysis/Week 1")
## by trial and error found that this is the relevant subset of rows for Feb. 1 and 2, 2007
data<-read.table("household_power_consumption.txt", sep=";", nrows=2885, skip = 66637, stringsAsFactors=FALSE)
##read first row to get column names. Prevent it from reading as a factor
column_names<-read.table("household_power_consumption.txt", sep=";", nrows=1, stringsAsFactors = FALSE)
##use that to give column names to data frame
colnames(data)<-column_names

##include date within the time column so you know e.g. 1pm on which date
data$Time<-paste(data$Date, data$Time)
##convert date column to date format
data$Date<-as.Date(data$Date, format="%d/%m/%Y")
##convert time column to date,time format
data$Time<-strptime(data$Time, format= "%d/%m/%Y %H:%M:%S")

## create plot3
png(file="plot3.png", width = 480, height = 480, units = "px")
##use Sub_metering_1 as the y-axis to make it work
with(data, plot(Time, Sub_metering_1, ylab="Energy sub Meeting", type="n"))
## do each line separately
points(data$Time, data$Sub_metering_1, type="l")
points(data$Time, data$Sub_metering_2, type="l", col="red")
points(data$Time, data$Sub_metering_3, type="l", col="blue")
## create the legend
legend("topright", col=c("black", "red", "blue"), lty=1, legend=c("Sub_Metering_1", "Sub_Metering_2", "Sub_Metering_3"))
dev.off()}