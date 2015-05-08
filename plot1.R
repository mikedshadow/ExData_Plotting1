#data <- read.csv("C:/Users/Michael/Exploratory_Data_Analysis/household_power_consumption.txt",
                # sep = ";", stringsAsFactors = FALSE)
data$Date <- as.Date(data$Date, format ="%d/%m/%Y") 
mydatedata <- subset(data, data$Date >= "2007-02-01" & data$Date <= "2007-02-02")
png(file = "plot1.png")
hist(as.numeric(mydatedata$Global_active_power), col = "red", xlab = "Global Active Power (kilowatts)", 
     main = "Global Active Power")
dev.off()