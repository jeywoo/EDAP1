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
png(file="./Exploratory_Data_Analysis_Project1/plot2.png",bg="transparent")
plot(data$Timestamp,data$Global_active_power,ylab="Global Active Power (kilowatts)",xlab="",type="l")
dev.off()
