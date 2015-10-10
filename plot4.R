##########################################################################################################################################
#	File Name 	:	plot4.R
#	Author		:	Ramji Rengarajan
#	Description	:	R Script for the Peer Assessment for the Course Project 1 for the Exploratory Data Analysis Course
##########################################################################################################################################

# Code to set the Working Directory
setwd("G:/Coursera/EDI/R Code")
srcFileName <- "household_power_consumption.txt"
hhPwrCon <- read.table(file=srcFileName,header=TRUE,sep=";",na.strings= c("?",""))
hhPwrCon$Date <- as.Date(hhPwrCon$Date,"%d/%m/%Y")
hhPwrCon$TStamp <- paste(hhPwrCon$Date," ",hhPwrCon$Time)
hhPwrCon$TStamp <- strptime(hhPwrCon$TStamp, format = "%Y-%m-%d %H:%M:%S")

StartDate <- as.Date("2007-02-01")
EndDate <- as.Date("2007-02-02")

hhPwrConData <- hhPwrCon[hhPwrCon$Date >= StartDate & hhPwrCon$Date <= EndDate,]

library(datasets)
png("plot4.png",height=480,width=480)
par(mfcol=c(2,2), mar=c(4,4,4,2), oma=c(1,1,1,1))
with(hhPwrConData, {
plot(hhPwrConData$TStamp,hhPwrConData$Global_active_power,xlab="",ylab="Global Active Power",type="l",lwd="1")
plot(hhPwrConData$TStamp,hhPwrConData$Sub_metering_1,xlab="",ylab="Energy sub metering",type="n",lwd="1.5")
lines(hhPwrConData$TStamp,hhPwrConData$Sub_metering_1,col="black")
lines(hhPwrConData$TStamp,hhPwrConData$Sub_metering_2,col="red")
lines(hhPwrConData$TStamp,hhPwrConData$Sub_metering_3,col="blue")
legend("topright",lwd=c(1,1,1),col = c("black","red","blue"), legend= c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),bty="n")
plot(hhPwrConData$TStamp,hhPwrConData$Voltage,xlab="datetime",ylab="Voltage",type="l",lwd="1")
plot(hhPwrConData$TStamp,hhPwrConData$Global_reactive_power,xlab="datetime",ylab="Global_reactive_power",type="l",lwd="1")
})
dev.off()
