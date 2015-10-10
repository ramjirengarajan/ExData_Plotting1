##########################################################################################################################################
#	File Name 	:	plot2.R
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
png("plot2.png",height=480,width=480)
with(hhPwrConData,plot(hhPwrConData$TStamp,hhPwrConData$Global_active_power,xlab="",ylab="Global Active Power (kilowatts)",type="l",lwd="1"))
dev.off()
