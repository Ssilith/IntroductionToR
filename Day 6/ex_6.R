######################################
#              zadania               #
######################################
setwd("C:/Users/ktrin/Desktop/Dania/Day 6")
data <- read.csv("Gapminder_LastDecade.csv", header = TRUE, sep = ";")

data_As2007 <- subset(data, continent == "Asia" & year == 2007)
LE_As2007 <- data_As2007$lifeExp
boxplot(LE_As2007, main="Boxplot of LE_As2007")
shapiro.test(LE_As2007)

data_Af2007 <- subset(data, continent == "Africa" & year == 2007)
LE_Af2007 <- data_Af2007$lifeExp
boxplot(LE_Af2007, main="Boxplot of LE_Af2007")
shapiro.test(LE_Af2007)

nonpar_twosample_ttest <- wilcox.test(LE_Af2007, LE_As2007)
nonpar_twosample_ttest
#not normally distributed and outliers

data_EU1997 <- subset(data, continent == "Europe" & year == 1997)
GDP_EU1997 <- data_EU1997$gdpPercap

data_EU2007 <- subset(data, continent == "Europe" & year == 2007)
GDP_EU2007 <- data_EU2007$gdpPercap

diff <- GDP_EU2007 - GDP_EU1997
shapiro.test(diff) #not normally distributed

paired_twosample_ttest <- t.test(GDP_EU2007, GDP_EU1997, paired = TRUE)
paired_twosample_ttest
#sa powiazane