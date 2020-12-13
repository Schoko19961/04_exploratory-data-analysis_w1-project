source("core.R")

if(!exists("diagram_data")){
  diagram_data <- get_cleaned_data()
}
png('plot1.png', width = 480, height = 480)
diagram <- hist(diagram_data$Global_active_power, main = "Global Active Power", col = "red", xlab = "Global Active Power (kilowatts)")
dev.off()
