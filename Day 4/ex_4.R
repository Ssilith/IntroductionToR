dir <- 'C:/Users/ktrin/Desktop/Dania/CSV Files'
setwd(dir)
LifeExpectancy<-read.csv("TFR_2020World.csv", header=T)
head(LifeExpectancy)

Education<-read.csv("Education_2009World.csv", header=T)
head(Education)

hist(LifeExpectancy$TFR)
hist(Education$YearEduc)

mean(LifeExpectancy$TFR, na.rm = T)
mean(Education$YearEduc, na.rm = T)

range(LifeExpectancy$TFR, na.rm = T)
range(Education$YearEduc, na.rm = T)

sd(LifeExpectancy$TFR, na.rm = T)
sd(Education$YearEduc, na.rm = T)

data <- merge(LifeExpectancy, Education, by="Country")
head(data)
data<- data[!is.na(data$TFR) | !is.na(data$YearEduc),]

#!is.na
plot(data$TFR, data$YearEduc,
     ylab = "Years of education",
     xlab = "TRF")
cov(data$TFR, data$YearEduc)
cor(data$TFR, data$YearEduc)
