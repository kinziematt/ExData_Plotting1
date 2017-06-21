plot1<-function(){setwd("C:/Users/uawe/Desktop/Coursera/Data Science Specialization/Course 4 Exploratory Data Analysis/Week 1")
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

##create plot1
##open graphics device and set dimensions to 480 pixels
png(file="plot1.png", width = 480, height = 480, units = "px")
hist(data$Global_active_power, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)")
dev.off()}