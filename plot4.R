#Load data
setwd("C:/Users/Phillip/Desktop/R/Power")
data <- read.table("household_power_consumption.txt", 
                   sep = ";", 
                   header = TRUE, 
                   stringsAsFactors = FALSE, 
                   na.strings = "?")

#1. Extract observations from date range 
data$Date <- as.Date(data$Date, format = "%d/%m/%Y") 
sample <- subset(data, Date == "2007-02-01" | Date == "2007-02-02")


#2. Construct plots 
#Convert variables to numerics
b = sample %>%
        mutate_each(funs(as.numeric),3:9)
        
#3. Initialize graphics device
png(file = "plot4.png", 
    width = 480, 
    height = 480, 
    units = "px")
    
#4. Create 2x2 panel
par(mfrow=c(2,2), mar = c(4,4,2,1))
plot.new()

#5a. Insert top left plot
plot(b$Global_active_power, 
     type = "n", 
     xlab="", 
     ylab="Global Active Power", 
     cex.lab = 0.8,
     cex.axis = 0.8, 
     xaxt = "n")
axis(side = 1,
     at = c(0, 1240, 2880), 
     labels=c("Thu", "Fri", "Sat"), 
     cex.axis = 0.8)
lines(b$Global_active_power,type ="l")

#5b. Insert top right plot
plot(b$Voltage,
     type = "n",
     xlab ="datetime",
     ylab = "Voltage",
     cex.lab = 0.8,
     cex.axis = 0.8,
     xaxt = "n" #suppress X axis values
)
axis(side = 1,
     at = c(0, 1240, 2880), 
     labels=c("Thu", "Fri", "Sat"), 
     cex.axis = 0.8
)
lines(b$Voltage,type ="l", col = "black")

#5c. Insert bottom left plot
plot(b$Sub_metering_1, 
     type = "n", 
     xlab ="",
     ylab = "Energy sub meetering",
     cex.lab = 0.8,
     cex.axis = 0.8,
     xaxt = "n" #suppress X axis values
)
axis(side = 1,
     at = c(0, 1240, 2880), 
     labels=c("Thu", "Fri", "Sat"), 
     cex.axis = 0.8
)
lines(b$Sub_metering_1,type ="l", col = "black")
lines(b$Sub_metering_2,type ="l", col = "red")
lines(b$Sub_metering_3,type ="l", col = "blue")
legend("topright",
       c("Sub meetering 1", "Sub meetering 2", "Sub meetering 3"), 
       cex=0.75, 
       col = c("black", "red", "blue"), 
       lty = 1, 
       bg = FALSE, 
       bty = "n")
       
5d. Insert bottom right plot
plot(b$Global_reactive_power,
     type = "n",
     xlab ="datetime",
     ylab = "Global_reactive_power",
     cex.lab = 0.8,
     cex.axis = 0.7,
     xaxt = "n" #suppress X axis values
)
axis(side = 1,
     at = c(0, 1240, 2880), 
     labels=c("Thu", "Fri", "Sat"), 
     cex.axis = 0.7
)
lines(b$Global_reactive_power,type ="l", col = "black")

#close graphics device
dev.off()

