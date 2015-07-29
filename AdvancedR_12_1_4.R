# Q1
# Write an FO that logs a time stamp and writes a message
# to file every time a function runs

# make this better by passing in arguments and function
# name to be included in the stamp?

stampy <- function(f){
  force(f)    
  
  function(x, ...) {
    res <- f(x, ...)
    time <- Sys.time()
    if(!file.exists('stamp.txt'))
       file.create('stamp.txt', showWarnings = FALSE)
    
    write(paste("function ran at", time, " \n", sep = " "),
          file = 'stamp.txt', append = TRUE)
    res
  } 
}

f <- function(x) x ^ 2
s <- c(3, 2, 1)

stampy(f)(1)
stampy(f)(s)

# Q2
rm(list = ls())

# what does the following function do? what would be a good name for it?

f <- function(g) {
  force(g)
  result <- NULL
  function(...) {
    if (is.null(result)) {
      result <<- g(...)
    }
    result
  }
}

runif2 <- f(runif)
runif2(5)
runif2(10)

# saves the results after the function is run, and never changes


# Q3
rm(list = ls)

# modify delay_by() so instead of delaying by a fixed amount of time,
# it ensures a certain amount of time has elapsed since the function
# was last called. That is, if you called 
# g <- delay_by(1, f); g(); Sys.sleep(2); g()
# there should not be any extra delay


delay_by <- function(delay, f) {
  force(f)
  function(...) {
    Sys.sleep(delay)
    f(...)
  }
}

library(lubridate)
delay_by <- function(delay, f) {
  force(f)
  runtime <- 0
  dt <- as.numeric(Sys.time() - runtime)
  if(dt < delay) {
    function(...) {
      Sys.sleep(delay)
      f(...)
      runtime <<- Sys.time() 
    } } else {
      function(...) {
      f(...)
    } 
  }
}


# Q4 write wait_until() that delays excecution until specific time

wait_until <- function(time, f){
  force(f)
  function(x, ...) {
    # while loop that only exits upon time being reached?
    while(as.numeric(Sys.time()) <= time ) {}
    f(x, ...)
  }
}

time_now <- as.numeric(Sys.time())

waitmean <- wait_until(time_now + 10, mean)
waitmean(c(2, 3, 4))

# Q5
# innermost woudl just remember the urls
# outermost would save excecution of whole expression

# Q6
# Why is the remember function inefficient?
# does not pre define size so has to make a list big enough then copy contents over
# would want to predefine the nummber of things (or max number of things, then delete
# empties?) that you want to remember


# Q7

# lazy evaluation, need to force a and be before defining function
f <- function(a, b) {
  force(a)
  force(b)
  function(x) {
    a * x + b
  }
}

fs <- Map(f, a = c(0, 1), b = c(0, 1))

fs[[1]](3)
# should return 0 * 3 + 0 = 0

