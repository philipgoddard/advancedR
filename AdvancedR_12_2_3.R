# Q1

# create a negative FO that flips the sign of the output
# of the function to which is is applied

negative <- function(f) {
  force(f)
  function(...) {
    f(...) * -1
  }
}

vec <- c(2,2,2)

mean(vec)
negMean <- negative(mean)
negMean(vec)


# Q2

# The evaluate package makes it easy to capture all the outputs
# (results, text, messages, warnings, errors and plots) from an expression
# Creat a function like capture_it() that also captures the wanrings and errors

library(evaluate)

capture_it <- function(f) {
  force(f)
  function(...) {
    capture.output(f(...))
  }
}

str_out <- capture_it(str)
str(1:10)
str_out(1:10)

capture_it2 <- function(f) {
  force(f)
  function(...) {
    evalutate(f(...))
  }
}


a <- caputure_it2(log)
log(-1)
a(-1)


# Q3

# create a FO that tracks files created or deleted in the working directory
# hint: use dir() and setdiff()

track_it <- function(f) {
  force(f)
  function(...){
    dir_list1 <- dir()
    res <- f(...)
    dir_list2 <- dir()
    added <- setdiff(dir_list2, dir_list1)
    removed <- setdiff(dir_list1, dir_list2)
    cat('added', added, sep = " ")
    cat(' removed', removed, sep = " ")
    res
  }
}

writeTrack <- track_it(write)
writeTrack(c(1,2,3), file = 'hat9')

