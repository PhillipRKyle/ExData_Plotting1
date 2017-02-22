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
        
#Plot 2 
#Open PNG device
png(file = "plot2.png", 
    width = 480, 
    height = 480, 
    units = "px")
#Draw plot

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
dev.off()
