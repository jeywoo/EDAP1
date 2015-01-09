#Needed libraries
library(data.table)


#Download dataset Electronic power consumption from UC Irvine Machine Learning Repository
if(!file.exists("./Exploratory_Data_Analysis_Project1"))
  dir.create("./Exploratory_Data_Analysis_Project1")
dlink<-"https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
if(!file.exists("./Exploratory_Data_Analysis_Project1//datahouseholdpowerconsumption.zip"))
  download.file(url=dlink,destfile = "./Exploratory_Data_Analysis_Project1/datahouseholdpowerconsumption.zip",method = "curl")
if(!file.exists("./Exploratory_Data_Analysis_Project1//household_power_consumption.txt"))
  unzip(zipfile = "./Exploratory_Data_Analysis_Project1//datahouseholdpowerconsumption.zip",exdir = "./Exploratory_Data_Analysis_Project1")


#Load data
data <- read.table(file = "./Exploratory_Data_Analysis_Project1/household_power_consumption.txt",colClasses = c("character","character",rep("numeric",7)),header = T,sep=";",na.strings="?")

#Subset data to include only Feb 1-2, 2007
data<-data[data$Date %in% c("1/2/2007","2/2/2007"),]

#Create Date/Time object from Date & Time
data$Timestamp<-strptime(paste(data$Date,data$Time),format="%d/%m/%Y %H:%M:%S")

#Save plot into a png file
png(file="./Exploratory_Data_Analysis_Project1/plot3.png",bg="transparent")
plot(data$Timestamp,data$Sub_metering_1,ylab="Energy sub metering",xlab="",type="l")
lines(data$Timestamp,data$Sub_metering_2,col="red")
lines(data$Timestamp,data$Sub_metering_3,col="blue")
legend('topright', names(data[7:9]) , lty=1, col=c('black', 'red', 'blue'))
dev.off()
