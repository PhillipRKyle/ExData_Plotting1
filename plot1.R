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

#Plot 1 
#Initialize device
png(file = "plot1.png", 
    width = 480, 
    height = 480, 
    units = "px")
hist(b$Global_active_power,
     breaks=15,
     col = "red",
     xlab= "Global Active Power (kilowatts)", 
     main= "Global Active Power", 
     cex.lab = 0.8, 
     cex.axis = 0.70,
     cex.main = 0.9) 
dev.off()
