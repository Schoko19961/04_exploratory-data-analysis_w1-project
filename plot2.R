source("core.R")

if(!exists("diagram_data")){
  diagram_data <- get_cleaned_data()
}
png('plot2.png', width = 480, height = 480)
plot(diagram_data$timestamp, diagram_data$Global_active_power, type = "l", ylab = "Global Active Power (kilowatts)")
dev.off()