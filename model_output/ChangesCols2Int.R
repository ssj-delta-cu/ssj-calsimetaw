data <- read.csv("wy2015/model_output.csv", stringsAsFactors=F)
data$Year <- as.integer(data$Year)
data$Mon <- as.integer(data$Mon)
data$Day <- as.integer(data$Day)
data$DOY <- as.integer(data$DOY)
write.csv(data, "wy2015/model_output.csv", row.names = F)



data <- read.csv("wy2016/model_output.csv", stringsAsFactors=F)
data$Year <- as.integer(data$Year)
data$Mon <- as.integer(data$Mon)
data$Day <- as.integer(data$Day)
data$DOY <- as.integer(data$DOY)
write.csv(data, "wy2016/model_output.csv", row.names = F)
