#This piece of code assumes that the household_power_consumption.txt file is available in the Working directory.

#Load database
library(readr)
household_power_consumption <- read_delim("E:/Cursos - Clases (como alumno)/Data Science Specialization - Johns Hopkins University/MOOC 4 - Exploratory Data Analysis/Course Project 1/household_power_consumption.txt", ";", escape_double = FALSE, trim_ws = TRUE)
#convert Date column to Date class
household_power_consumption$Date <- as.Date(household_power_consumption$Date, "%d/%m/%Y")
#Subset Database for the two days required to the analysis (February 1st and 2ds 2007)
base <- subset(household_power_consumption, Date <= "2007-02-02" & Date >= "2007-02-01")
#We need a new date+time variable
base$Date1 <- as.POSIXct(paste(base$Date, base$Time))
#And change the local time setting to avoid days labels in spanish instead of english as required
Sys.setlocale("LC_TIME", "C")

#plot2:
plot(base$Date1, base$Global_active_power, type = "l", xlab = "", ylab = "Global Active Power (kilowatts)")
dev.copy(png, file = "plot2.png", width = 480, height = 480)
dev.off()
