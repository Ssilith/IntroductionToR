celcius <- function(temp){
  c = temp*1.8+32
  return(c)
}
celcius(c(-10, 15, 30))

gauss <- function(n){
  for(i in n){
    sol=i*(i+1)/2
    return(sol)
  }
}
gauss(100)

sol=0
for(i in c(1:100)){
  sol=sol+i
}

if(sol == gauss(100)){
  print("Good job!")
} else{
  print("Sth wrong!")
}

comparee <- function(val_1,val_2){
  if(val_1 > val_2){
    paste("the number", val_1, "is greater than", val_2)
  } else if(val_1 < val_2){
    paste("the number", val_2, "is greater than", val_1)
  } else{
    paste("the number", val_1, "is equal to", val_2)
  }
}
comparee(2,3)
