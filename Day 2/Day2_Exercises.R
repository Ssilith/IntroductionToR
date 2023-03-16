#Set your work directory
#setwd()

###  Exercise 1 ###

# Create data frame
tab_exercise <- data.frame(Name=c("Peter", "Sara", "Adam", "Lisa", "Joseph"),
                           Age=c(51, 32, 29, 25,43),
                           Sex=c("Male", "Female", "Male", "Female", "Male"),
                           Coutry=c("USA", "Italy", "Denmark", "Portugal", "France"),
                           Salary=c(4400, 2900, 3200, 1800, 3850))
tab_exercise

# Select age variable
Age<-tab_exercise$Age
Age
tab_exercise[,"Age"]
tab_exercise[,2]

# Average age
mean(tab_exercise$Age)
mean(Age)

# Select salary variable
tab_exercise$Salary

# Average age
max(tab_exercise$Salary)

# Add a variable
tab_exercise$Children<-c(3,1,0,NA,4)
head(tab_exercise)



###  Exercise 2 ###

# Create 3 vectors
X<-c(1:4)
X
Y<-seq(1,8, 2)
Y
Z<-rep(2,4)
Z

# Create a matrix
mat<-cbind(X, Y, Z)
mat

#columns and rows name
rownames(mat)<-c("A", "B", "C", "D")
colnames(mat)<-c("X", "Y", "Z")
mat

#Select column X
mat[,"X"]
mat[,1]

#Select row C
mat["C",]
mat[3,]

#Values in row B and column Z
mat["B", "Z"]
mat[2,3]


### Exercise 3 ###

load("salary.RData")
salary

#Names of the matrices
dimnames(salary)[[3]]

#Information in the rows
dimnames(salary)[[1]]

#Information in the columns
dimnames(salary)[[2]]

#Dimensions of each matrix
nrow(salary)
ncol(salary)
dim(salary)

#Peter's salary
salary["Peter","Salary",]

#Rent prices in 2015
salary[,"Rent","2015"]


### Exercise 4 ###

MyList<-list(tab_exercise,
             mat,
             salary)
names(MyList)<-c("Dataframe", "Matrix", "Array")

# Select the array
MyList$Array
MyList[[3]]

# Select the dataframe
MyList$Dataframe
MyList[[1]]
