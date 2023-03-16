

### ----- Write a function ----- ###

### Example 1

in_to_cm<-function(feet, inches){
  cm<-(feet*30.48)+(inches*2.54)
  return(cm)
}
in_to_cm(feet=5,inches=5)
in_to_cm(feet=6,inches=0)


### Example 2

#Set your work directory
# Load the data
data<-read.csv("LifeExpectancy_2020World.csv",
               header=T)
head(data)
dim(data)

#Find mean
Mean_Expectancy<-mean(data$LifeExpectancy,
                      na.rm=TRUE)
Mean_Expectancy

#Create function
dev_from_mean<-function(LE, mean){
  #Create tasks
  Difference<-LE-mean
  Percentage<-Difference/mean *100
  #Create a list of object to return
  output<-list(
    Absolute_difference =Difference,
    Relative_difference =Percentage
  )
  #Return the list
  return(output)
}

# Find deviation for specific country
#Select a country
data$Country
country<-"Brazil"

#Find its life expectancy
LE_country<-data$LifeExpectancy[data$Country==country]
LE_country

#Find the deviation from the mean
dev_from_mean(LE=LE_country,
              mean=Mean_Expectancy)



### ----- Loop ----- ###

x<-c(1,2,4,7,10)
length(x)

# Loop based on values
for(values in x){
  output<- values + 10
  print(output)
}

#Loop based on position
for(positions in c(2,4)){
  output<- x[positions] + 10
  print(output)
}

### Example with life expectancy difference

# Select multiple countries
countries<-c("Afghanistan", "Denmark",
             "India", "Japan",
             "Mexico", "Mozambique",
             "United States")

#Create a data frame to store the results from the loop
results<-data.frame(
  Country = countries,
  LE = rep(NA, length(countries)),
  Absolute_diff = rep(NA, length(countries)),
  Relative_diff = rep(NA, length(countries))
)
results


# Loop the results from values
for(i in countries){
  #Find life expectancy for country i
  LifeExpectancy<-data$LifeExpectancy[data$Country==i]
  
  #Find the deviation
  Deviation<-dev_from_mean(LE=LifeExpectancy,
                           mean=Mean_Expectancy)
  
  #Store the results
  results[results$Country==i,"LE"]<-LifeExpectancy
  results[results$Country==i,"Absolute_diff"]<-Deviation$Absolute_diff
  results[results$Country==i,"Relative_diff"]<-Deviation$Relative_diff
}
results


### ----- Condition ----- ###

x<- -10

if(x>0){
  print("Positive value")
}else{
  print("Negative value")
}

# Example with life expectancy
LE<-60
if(LE>Mean_Expectancy){
  print("High life expectancy")
}else{
  print("Low life expectancy")
}

# Apply condition to multiple countries
for(i in 1:nrow(data)){
  if(data$LifeExpectancy[i] > Mean_Expectancy &
     !is.na(data$LifeExpectancy[i])){
    print(data$Country[i])
  }
}


