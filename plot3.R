
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

#Here I create directly a png file instead of copying the screen result as in previous plots to avoid problems with the legend
png("plot3.png", 480, 480)
with(base, plot(Date1, Sub_metering_1, main = "", xlab = "", ylab = "Energy sub metering", type = "n"))
with(base, lines(Date1, Sub_metering_1, col = "black"))
with(base, lines(Date1, Sub_metering_2, col = "red"))
with(base, lines(Date1, Sub_metering_3, col = "blue"))
legend("topright", lwd = 1, col = c("black", "red", "blue"), legend = c("Sub_metering_1","Sub_metering_2", "Sub_metering_3"))
dev.off()