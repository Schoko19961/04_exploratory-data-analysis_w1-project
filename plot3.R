source("core.R")

if(!exists("diagram_data")){
  diagram_data <- get_cleaned_data()
}
png('plot3.png', width = 480, height = 480)
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
dev.off()
