# Read data in
  df <- read.table("household_power_consumption.txt", head=T, sep=";", na="?")
  
# Subset
  df$Date <- as.Date(as.character(df$Date), "%d/%m/%Y")
  df <- df[df$Date==as.Date("2007-02-01") | df$Date==as.Date("2007-02-02"),]


# Create plot
  png(filename="plot1.png", width = 480, height = 480)
  hist(df$Global_active_power, main="Global Active Power", xlab="Global Active Power (killowatts)", col="red")
  dev.off()