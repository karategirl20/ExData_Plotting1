rm(list = ls())
data <- read.table("C:/Users/sroy/Documents/R/Exploratory Data Analysis/household_power_consumption.txt", header = T, sep = ";", na.strings = "?")
# Get the dimensions so that it matches the dataset as prescribed by the instructions
dim(data)
# consists of 9 columns and 2075259 rows
#Will use data from the dates 2007-02-01 and 2007-02-02. One alternative is to read the data from
#just those dates rather than reading in the entire dataset and subsetting to those dates
str(data)
# date field is a factor variable in this dataset:data
# converting the date variable to Date class as the Date field is a Factor variable
data$Date <- as.Date(data$Date, format = "%d/%m/%Y")
data1<-subset(data,subset = (Date >= "2007-02-01" & Date <= "2007-02-02"))
str(data1)
#'data.frame':	2880 obs. of  9 variables:
#Date  : Date, format: "2007-02-01" 
# Convert dates and times
data$datetime <- strptime(paste(data$Date, data$Time), "%Y-%m-%d %H:%M:%S")
# plot#1
attach(data)
hist(Global_active_power, main = "Global Active Power", xlab = "Global Active Power (kilowatts)", col = "Red")
#Save the file
dev.copy(png, file = "plot1.png", height = 480, width = 480)
dev.off()
detach(data)
