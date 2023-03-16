# Lecture script Day 7

setwd()

library(readr)
data.tfr <- read_csv("TFR_2020World.csv")
data.edu <- read_csv("Education_2009World.csv")

merge(data.tfr, data.edu, all=T)

data <- merge(data.edu, data.tfr)

head(data)
tail(data)

class(data)

class(data$YearEduc)
class(data$TFR)

summary(data)

plot(data$YearEduc, data$TFR,
     xlab="Average no. of yr of school per women",
     ylab="Total fertility rate in 2020",
     main="Relationship between TFR and education by 174 countries")

cor(data$YearEduc, data$TFR)

plot(data$YearEduc, log(data$TFR))

cor(data$YearEduc, log(data$TFR))

model1 <- lm(log(TFR) ~ YearEduc, data = data)

summary(model1)

par(mfrow=c(2,2))
plot(model1)
