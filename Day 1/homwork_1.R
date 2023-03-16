vector <- seq(1,9, by=2)
length(vector)

dir <- 'C:\\Users\\ktrin\\Desktop\\Dania\\CSV Files'
setwd(dir)
data<-read.csv("LifeExpectancy_Denmark.csv", header = T, sep=",")

head(data)
LE<-data$LifeExpectancy
Year<-data$Year

year1850 <- LE[51]
year1850

year1950 <- LE[151]
year1950

year2021 <- LE[222]
year2021

avg1950_2021 <- (year1950+year2021)/2
avg1950_2021

LE_2 <- data$LifeExpectancy[data>="1950"]
Year_2 <- data$Year[data>="1950"]

plot(x=Year_2, y=LE_2, type="p",
     col="purple",
     pch=25,
     main="Life expectancy in Denmark between 1950 and 2021",
     xlab="Year",
     ylab="Life expectancy")
