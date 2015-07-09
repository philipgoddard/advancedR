# Q1
# create a list of all the replacement functions in the base package
# which are primitive?

rm(list = ls())

# here is a list of all functions in base R package
objs <- mget(ls("package:base"), inherits = TRUE)
funs <- Filter(is.function, objs)

names(funs[grepl("<-$", names(funs))])

# to adapt to primitive functions only, change
# funs <- Filter(is.primitive, objs)


#------------------------------------------
# Q2
# what are valid names for user created infix functions?

rm(list = ls())

# valid names are %something%, note that have to escape special characters


#------------------------------------------
# Q3
# create and infix xor operator

rm(list = ls())

`%xor%` <- function(x, y){
  if((x == T & y == F) | (x == F & y == T)) {T}
  else {F}
}
  

#------------------------------------------
# Q4
# create an infix version of set functions intersect(), union() and setdiff()

rm(list = ls())

x <- c(1, 2, 3, 4)
y <- c(4, 5, 6, 7)

intersect(x, y)
`%intersect1%` <- function(a, b) a[a %in% b]
x %intersect1% y

union(x, y)
`%union1%` <- function(a, b) {
  inputVec <- as.vector(rep(NA, times = (length(a) + length(b))))
  inputVec <- unique(c(a, b))
}
x %union1% y

setdiff(x, y)
`%setdif1%` <- function(a, b) {
  test <- as.vector(rep(FALSE, times = length(a)))
  for(i in 1:length(a)){
    if(a[i] %in% b){test[i] <- TRUE}
  }
  test
  a[!test]
}
x %setdiff1% y

# as an aside, look at definition of functions. can do more efficiently
# using match()

#------------------------------------------
# Q5
# create a replacement function that modifies a random location in a vector

rm(list = ls())

`modify<-` <- function(x, value){
  randomPos <- sample((1:length(x)), 1)
  x[randomPos] <- value
  x
}

x <- c(1,2,3,4,5)
x
modify(x) <- 10
x