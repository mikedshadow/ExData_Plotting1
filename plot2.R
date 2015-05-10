# read the data
data <- read.csv("C:/Users/Michael/Exploratory_Data_Analysis/household_power_consumption.txt",
 sep = ";", stringsAsFactors = FALSE)
# subset the relevent data
data$Date <- as.Date(data$Date, format ="%d/%m/%Y") 
data$Time <- strptime(paste(data$Date, data$Time), format ="%Y-%m-%d %H:%M")
mytimedata <- subset(data, data$Date >= "2007-02-01" & data$Date <= "2007-02-02") 
mytimedata$Global_active_power <- as.numeric(mytimedata$Global_active_power)
# open graphics device
png(file = "plot2.png")
# plot
plot(mytimedata$Time, mytimedata$Global_active_power, type = "n", 
     ylab = "Global Active Power (kilowatts)", xlab = "")
lines(x =mytimedata$Time, y = mytimedata$Global_active_power)
# turn off device
dev.off()