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
png(file = "plot3.png", 
    width = 480, 
    height = 480, 
    units = "px")
    
#4. Draw plot
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
       bg = FALSE)
dev.off()
