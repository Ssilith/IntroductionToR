# Lecture script

setwd()

data <- read.csv("Gapminder_LastDecade.csv", header = TRUE, sep = ";")

class(data)

summary(data)

head(data)
tail(data)


data_EU2007 <- subset(data, continent == "Europe" & year == 2007)

head(data_EU2007)

GDP_EU2007 <- data_EU2007$gdpPercap

mean(GDP_EU2007)

sd(GDP_EU2007)

boxplot(GDP_EU2007, main="Boxplot of GDP_EU2007")


S <- shapiro.test(GDP_EU2007)
S


one_sample_ttest <- t.test(GDP_EU2007, mu=12000)
one_sample_ttest

data_Am2007 <- subset(data, year==2007 & continent == "Americas")
GDP_Am2007 <- subset(data, year==2007 & continent == "Americas")$gdpPercap


mean(GDP_Am2007)
sd(GDP_Am2007)

boxplot(GDP_Am2007)

outliers <- boxplot(GDP_Am2007, plot=FALSE)$out
outliers
which(GDP_Am2007 %in% c(outliers))

shapiro.test(GDP_Am2007)

wilcox.test(GDP_EU2007, GDP_Am2007)

data_EU2002 <- subset(data, continent == "Europe" & year == 2002)
GDP_EU2002 <- data_EU2002$gdpPercap

boxplot(GDP_EU2002)

GDP_EU <- cbind(GDP_EU2002, GDP_EU2007)
GDP_EU

mean(GDP_EU)
mean(GDP_EU[, 1])
mean(GDP_EU[,2])

apply(GDP_EU, 2, mean)

boxplot(GDP_EU)

diff <- GDP_EU2007 - GDP_EU2002

shapiro.test(diff)

paired_twosample_ttest <- t.test(GDP_EU2007, GDP_EU2002, paired = TRUE)
paired_twosample_ttest$method






