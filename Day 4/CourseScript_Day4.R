#Set your work directory

### Load the data ###

#Life expectancy in the World in 2020
LifeExpectancy<-read.csv("LifeExpectancy_2020World.csv",
                         header=T)
head(LifeExpectancy)
dim(LifeExpectancy)

#GDP in the World in 2020
GDP<-read.csv("GDP_2020World.csv",
              header=T)
head(GDP)
dim(GDP)

typeof(GDP$Country)
typeof(GDP$GDP)



#### Frequency table ###

table(round(LifeExpectancy$LifeExpectancy))

# Relative frequency table
table(round(LifeExpectancy$LifeExpectancy))/
  nrow(LifeExpectancy)*100



### Histogram ###

hist(LifeExpectancy$LifeExpectancy)

#Change the number of breaks
hist(LifeExpectancy$LifeExpectancy,
     breaks=3)
hist(LifeExpectancy$LifeExpectancy,
     breaks=20)

#Relative frequency
hist(LifeExpectancy$LifeExpectancy, 
     freq=F)


### Summary statistics ###

### Mean

#Calculate manually
LE<-LifeExpectancy$LifeExpectancy
sum(LE,na.rm=T)/length(LE[!is.na(LE)])

#With the function
mean(LE, na.rm=T)
mean(GDP$GDP, na.rm = T)


###Median

#Calculate manually
LE_order<- LE[order(LE)]
mid_position<-length(LE)/2

(LE_order[floor(mid_position)]+
    LE_order[ceiling(mid_position)])/2

#With the function
median(LE, na.rm = T)
median(GDP$GDP, na.rm = T)



### Measures of spread ###

### Range
min(LE, na.rm = T)
max(LE, na.rm = T)
range(LE, na.rm = T)

range(GDP$GDP)


### Variance

# Manually
Mean_LE<-mean(LE, na.rm = T)
#squared differences
sum((LE[!is.na(LE)]-Mean_LE)^2)/
  (length(LE[!is.na(LE)])-1)

#With the function
var(LE, na.rm = T)
var(GDP$GDP, na.rm = T)


### Standard deviation

# Manually
sqrt(sum((LE[!is.na(LE)]-Mean_LE)^2)/
       (length(LE[!is.na(LE)])-1))

#With the function
sd(LE, na.rm = T)
sd(GDP$GDP)



### Measures of dependence ###

### Theoritical example

x<-c(1:10)
y<-c(11:20)

plot(x, y)

#Covariance
sum((x-mean(x))*(y-mean(y)))/
  (length(x)-1)
cov(x,y)

#Correlation coefficient
cov(x,y)/(sd(x)*sd(y))
cor(x,y)


x<-c(1:10)
y<-rep(c(1,2), 5)

plot(x, y)
cor(x,y)


### Example with LE and GDP

# Merge the data

data<-merge(LifeExpectancy,
            GDP,
            by="Country")
head(data)
dim(data)

# Remove observations with missing LE
data2<-data[!is.na(data$LifeExpectancy),]
dim(data2)

# plot the data
plot(data2$GDP,
     data2$LifeExpectancy,
     xlab="GDP",
     ylab = "Life expectancy",
     main= "Relation between GDP and life expectancy")

# covariance
cov(data2$GDP, data2$LifeExpectancy)

# Correlation
cor(data2$GDP, data2$LifeExpectancy)
