url <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
filename <- "data.zip"

if(!file.exists(filename)){
  download.file(url, filename, mode = "wb", quiet = T)
}
unzip(filename)
library("tidyverse")

get_cleaned_data <- function(){
  data <- read_delim("household_power_consumption.txt", delim = ";") %>%
    filter(Date %in% c("1/2/2007","2/2/2007"))
  data %>%
    add_column(timestamp = strptime(paste(data$Date, data$Time), format = "%d/%m/%Y %H:%M:%S"), .before = 1) %>%
    select(-c(Date, Time))
}