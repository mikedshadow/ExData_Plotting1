# read the data
data <- read.csv("C:/Users/Michael/Exploratory_Data_Analysis/household_power_consumption.txt",
                sep = ";", stringsAsFactors = FALSE)
# subset the relevent data
data$Date <- as.Date(data$Date, format ="%d/%m/%Y") 
data$Time <- strptime(paste(data$Date, data$Time), format ="%Y-%m-%d %H:%M")
mytimedata <- subset(data, data$Date >= "2007-02-01" & data$Date <= "2007-02-02") 
mytimedata$Sub_metering_1 <- as.numeric(mytimedata$Sub_metering_1)
mytimedata$Sub_metering_2 <- as.numeric(mytimedata$Sub_metering_2)
mytimedata$Sub_metering_3 <- as.numeric(mytimedata$Sub_metering_3)
# open graphics device
png(file = "plot3.png")
# plot
plot(mytimedata$Time, mytimedata$Sub_metering_1, type = "n", 
     ylab = "Energy sub metering", xlab = "")
lines(x = mytimedata$Time, y = mytimedata$Sub_metering_1)
lines(x = mytimedata$Time, y = mytimedata$Sub_metering_2, col = "red")
lines(x = mytimedata$Time, y = mytimedata$Sub_metering_3, col = "blue")
legend("topright", lty = c(1,1,1), col = c("black", "red", "blue"), 
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), cex = .8)
# turn off device
dev.off()