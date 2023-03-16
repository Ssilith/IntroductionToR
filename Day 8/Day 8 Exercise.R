# Exercise 1
setwd()

Jims <- read.table("Jims.txt", header=T, quote= "\" ")

ggplot(Jims, aes(x = year, y = rle))+
  
  geom_smooth(method = "lm", col="gray") +
  geom_point(aes(color = country)) +
  
  scale_y_continuous(name = "Record Life Expectancy")+
  scale_x_continuous(name = "Year")+

  theme_bw()
