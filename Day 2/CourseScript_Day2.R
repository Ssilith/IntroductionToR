### Vector - recap ###

x<-1:5
x

y<-seq(1,10, by=2)
y

names(y)<-c("A", "B", "C", "D", "E")
y

length(y)

y[2]
y["B"]


### Data frame ###

Beatles<-data.frame(
  Name = c("Paul", "John", "Ringo", "George"),
  Instrument = c("Bass", "Guitar", "Drum", "Guitar"),
  Age = c(80, 81, 81, 79)
)
Beatles
dim(Beatles)

# select the variable with $
Beatles$Name

#Select the variable with []
Beatles[,3]
Beatles[,"Age"]
Beatles[,c("Name","Age")]

# Select an observation with []
Beatles[1,]
Beatles[c(1,2),]

#Select observation based on condition
Beatles$Instrument
Beatles$Instrument=="Guitar"

Beatles[Beatles$Instrument=="Guitar",]
Beatles[Beatles$Age==81,"Name"]

# Expand the data frame
Beatles$Status<-c(0,1,0,1)
Beatles

#Missing values
Beatles$Age_Death<-c(NA, 40, NA, 58)
Beatles

typeof(Beatles$Age_Death)


### Matrix ####
A<- matrix(data=c(1:9),
           nrow=3,
           ncol=3)
A
dim(A)

#Naming the rows and columns
rownames(A)<-c("a", "b", "c")
colnames(A)<-c("d", "e", "f")
A

#Selecting elements
A[1,]
A["a",]

A[,c(1,2)]
A[,c("d", "e")]

# Expanding matrices
# Adding a row
Arow<-rep(10, 3)
A_4rows<-rbind(A, Arow)
A_4rows
dim(A_4rows)

#Adding a column
Acol<-c(4, 56, 100)
A_4cols<-cbind(A, Acol)
A_4cols
dim(A_4cols)

# Binding 2 matrices
A
B<-matrix(data=c(1:6),
          nrow=2,
          ncol=3)
B
dim(B)

AB<-rbind(A, B)
AB


### Array ###
B<-array(data=c(1:12),
         dim=c(2,2,3))
B
dim(B)

# Selecting element

#First dimension: rows
B[1,,]

#Second dimension: columns
B[,1,]

#Third dimension
B[,,1]

#naming the dimensions
rownames(B)<-c("a", "b")
B

dimnames(B)[[1]]<-c("Row1", "Row2")
dimnames(B)[[2]]<-c("Col1", "Col2")
dimnames(B)[[3]]<-c("Matrix1", "Matrix2", "Matrix3")
B


### List ###
mylist<-list(Beatles,
             A,
             B,
             "A charater")
mylist

#naming elements in a list
names(mylist)<-c("Dataframe",
                 "Matrix",
                 "Array",
                 "Object")
mylist

# Selecting element by name
mylist$Matrix

# Selecting element by position
mylist[[1]]
mylist$Dataframe


### Saving the data ###

save(mylist, file="Example.RData")

#Loading R data into R
load("Example.RData")

# Save into csv file
write.csv(Beatles, file="Beatle.csv")
