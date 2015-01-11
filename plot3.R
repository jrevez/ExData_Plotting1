# Read data in
  df <- read.table("household_power_consumption.txt", head=T, sep=";", na="?")

# Subset
  df$Date <- as.Date(as.character(df$Date), "%d/%m/%Y")
  df <- df[df$Date==as.Date("2007-02-01") | df$Date==as.Date("2007-02-02"),]

# Create new column with date and time
  df$date_time <- paste(df[,1],df[,2])
  df$date_time <- as.POSIXct(strptime(df$date_time, "%Y-%m-%d %H:%M:%S"))

# Create plot
  png(filename="plot3.png", width = 480, height = 480)
  plot(df$date_time, df$Sub_metering_1, xlab="", ylab="Energy sub metering", type="l")
  lines(df$date_time, df$Sub_metering_2, col="red")
  lines(df$date_time, df$Sub_metering_3, col="blue")
  legend("topright", legend=names(df)[7:9], col=c("black", "red", "blue"), lty="solid")
  dev.off()
  
  plot(rnorm(100),type="l",col=2)
   lines(rnorm(100),col=3)
  