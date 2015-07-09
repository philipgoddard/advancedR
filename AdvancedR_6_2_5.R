# Q1

rm(list = ls())

# what does follwing code do?

c <- 10
c(c = c)

# c() makes vector. names element c of the vector to = 10
# is a function vs variable thing...

#----------------------------------
# Q2

rm(list = ls())

#what are 4 principles giverns how R looks for values?

# dynamic lookup - WHERE not WHEN. R looks for values where function called. 

# function vs variable - R looks for functions the same way it looks for variables

# name masking - if variable not defined in a function, R will look one level up until it finds or
# gets to highest level 

# fresh start - new environment made each time function called, so function has 'no recollection'
# of previous excecutions


#----------------------------------
# Q3

rm(list = ls())

#what does code return? Guess before running

f <- function(x){
  f <- function(x){
    f <- function(x){
      x ^ 2
    }
    f(x + 1)
  }
  f(x) * 2
}
f(10)

# is 242. why??
# (11 ^ 2) * 2 = 242
# goes in initially, sees 2 more f(x) defined. hits f(x) * 2
# -> looks for f(x) next lebel in which is f(x + 1), so passes 11 to the
# inner most f(x). 11 ^ 2 = 121 [= f(x)], the f(x) * 2 = 242, which is returned.