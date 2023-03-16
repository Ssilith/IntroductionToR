### Introduction to R
### Day 1 - Fundamentals
### Script written in class

# Create an object
A<-1
A

# Type of object
class(A)

#Numerical object
height<-170
weight<-65.2

height
class(height)

weight
class(weight)

# Integer object
weight_integer<-65L
weight_integer
class(weight_integer)

# Logical object
L1<-T
L1

L2<-F
L2

L3<-weight==height
L3

# Character object
name<-"Marie-Pier"
name
class(name)

# Complex object
imaginary<-3+2i
imaginary
class(imaginary)

#transform from one type to another
x<-1:5
class(x)

as.character(x)
as.complex(x)
as.numeric(x)


# Vector
x<-c(2,4,6,8,10)
x

y<-c(T, F, TRUE, "R")
y
typeof(y)

# Length of a vector
length(x)

# class of vector
typeof(x)

# Creating a vector with :
x<-1:5
x

y<- -2:2
y

# Creating a vector with seq()
x<-seq(0,10, by=3)
x

y<-seq(0,20, length.out=3)
y

# Selecting element of a vector
x<-seq(0,20, by=5)
x

x[2]
x[c(2,4)]
x[-1]
x[-c(1,2)]
x[c(T,F,T,F,T)]

# Modify elements in a vector
x
x[1]<-5
x

# Modify vector based on condition
A<-1
#Bigger than
A>=1
#Smaller than
A<=3
#Equal to
A==3

x
x<10
x[x<10]<-0
x

# Name the elements of a vector
x<-c("A"=1, "B"=2, "C"=3)
x
typeof(x)

y<-1:3
names(y)<-c("A", "B", "C")
y
x

x[1]
x["A"]


# Basic arithmetic
A<-1
B<-2

#Addition
A+B

#Subtraction
A-B

#Multiplication
A*B

#Division
A/B


# R build-in functions
x<-c(1,2,4,5,7)

1+2+4+5+7
sum(x)

(1+2+4+5+7)/5
mean(x)

min(x)
max(x)

round(3.1415936)
round(3.1415936, digits = 4)

#Open dataset
# *** Set your work directory setwd() ***

data<-read.csv("LifeExpectancy_Denmark.csv",
               header=T)
data

head(data)
tail(data)

#Create vector from variables
LE<-data$LifeExpectancy
Year<-data$Year

names(LE)<-Year
head(LE)

#Basic plot
plot(x=Year,
     y=LE,
     type="l",
     col="red",
     lty=2,
     main="Life expectancy in Denmark from 1800 to 2021",
     xlab="Years",
     ylab="Life expectancy")
