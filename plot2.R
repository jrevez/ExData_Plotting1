# Read data in
  df <- read.table("household_power_consumption.txt", head=T, sep=";", na="?")

# Subset
  df$Date <- as.Date(as.character(df$Date), "%d/%m/%Y")
  df <- df[df$Date==as.Date("2007-02-01") | df$Date==as.Date("2007-02-02"),]

# Create new column with date and time
  df$date_time <- paste(df[,1],df[,2])
  df$date_time <- as.POSIXct(strptime(df$date_time, "%Y-%m-%d %H:%M:%S"))
  
# Create plot
  png(filename="plot2.png", width = 480, height = 480)
  plot(df$date_time, df$Global_active_power, xlab="", ylab="Global Active Power (killowatts)",type="l")
  dev.off()
