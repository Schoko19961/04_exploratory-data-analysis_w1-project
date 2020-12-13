
if(!exists("diagram_data")){
  diagram_data <- get_cleaned_data()
}

png('plot4.png', width = 480, height = 480)
par(mfrow= c(2,2))

#Create Diagram 1
plot(diagram_data$timestamp, diagram_data$Global_active_power, ylab = "Global Archive Power", xlab = "", type = "l")

#Create Diagram 2
plot(diagram_data$timestamp, diagram_data$Voltage, ylab = "Voltage", xlab = "", type = "l")

#Create Diagram 3
plot( 
  rep(diagram_data$timestamp, 3), 
  c(diagram_data$Sub_metering_1, diagram_data$Sub_metering_2, diagram_data$Sub_metering_3),
  ylab = "Energy sub meeting", 
  xlab = "",
  col = rep(c("black", "red", "blue"), each = nrow(diagram_data)), 
  type="n"
)
lines(diagram_data$timestamp, diagram_data$Sub_metering_1, col = "black")
lines(diagram_data$timestamp, diagram_data$Sub_metering_2, col = "red")
lines(diagram_data$timestamp, diagram_data$Sub_metering_3, col = "blue")
legend(
  "topright", 
  legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
  col = c("black", "red", "blue"), 
  pch = "-"
)

#Create Diagram 4
plot(diagram_data$timestamp, diagram_data$Global_reactive_power, xlab = "", type = "l", ylab = "Global_reactive_power")

dev.off()