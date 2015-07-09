# Q1

rm(list = ls())

# why isnt is.na() a predicate function? What base R function is the closest to
# being a predicate verion of is.na()

is.na(NA)
is.na(1)
is.na(c(NA, 1, 3, 4))

is.character(c('a', 'b'))

# predicate function should return a SINGLE T or F
# anyNA() is closer to predicate version

anyNA(NA)
anyNA(c(NA, 1, 2))
!anyNA(c(NA, 1, 2))

# Q2

rm(list = ls())

# use filter and vapply to apply a summary statistic
# to every numeric column of a data frame

data <- data.frame(x = c(1, 2, 3, 4, 5, 6),
                   y = c(10, 20, 30, 40, 50, 60),
                   z = rep(c('red', 'blue'), 3))

filtSummary <- function(x, f, ...) {
  # filter out non numeric
  numCols <- Filter(is.numeric, x)  
  # and vapply summary statistic f
  vapply(numCols, f, ...,  numeric(1))
}

filtSummary(data, mean, na.rm = T)


# Q3

rm(list = ls())

# what is the difference between which() and Position()?
# what is the difference between where() and Filter()?

where <- function(f, x) {
  vapply(x, f, logical(1))
}

# which() returns all values that match, not just the first
# where() returns all (with T/F) wheras filter only returns TRUE

# Q4

rm(list = ls())

# implement Any(), a function that takes a list and a predicate function,
# and returns TRUE if the predicate function returns TRUE for any of the inputs
# Implement All() similarly

test <- vector('list', length = 5)
test[[1]] <- 30
test[[2]] <- 'hat'
test[[3]] <- TRUE
test[[4]] <- 10
test[[5]] <- FALSE

test2 <- vector('list', length = 3)
test2[[1]] <- 1
test2[[2]] <- 1
test2[[3]] <- 1

test3 <- vector('list', length = 2)
test3[[1]] <- 'cat'
test3[[2]] <- 'hat'
test3[[3]] <- TRUE

Any <- function(x, f) {
  temp <- vapply(x, f, logical(1))
  Reduce('||', temp, init = FALSE)
  # how return single true if any are true?
}

Any(test, is.numeric)
Any(test2, is.numeric)
Any(test3, is.numeric)

All <- function(x, f) {
  temp <- vapply(x, f, logical(1))
  Reduce('&&', temp, init = TRUE)
}

All(test, is.numeric)
All(test2, is.numeric)
All(test3, is.numeric)


# solution from internet (kind of cheating... as it used all() and any()...)
# sloppy as will accept any function... eg Any <- AnyAll(mean)

AnyAll <- function(FUN){
  function(f, x){
    test <- vapply(x, f, logical(1))
    FUN(test)
  }
}

Any <- AnyAll(any)
All <- AnyAll(all)

tester <- list("foo",1)

Any(is.numeric, tester)
All(is.numeric, tester)

# Q5 implement span() function
# this was a bit of a headache, but got there
# without the need for a loop!

# where predicate function
where <- function(f, x) {
  vapply(x, f, logical(1))
}

span <- function(x, f) {

  # where is condition true
  temp <- where(f, x)
  
  # do we start where condition true or false?
  start <- temp[1]
  
  # what are the run lengths
  runs <- (rle(temp)$length)
  
  # lets make an odd and even vector, as could
  # start on true or false
  # where multiple max lengths, just take the 
  # first instance
  oddRuns <- runs[seq(1, length(runs), 2)]
  evenRuns <- runs[seq(2, length(runs), 2)]
  
  if (start) { 
     longest <- which(runs == max(oddRuns))[1]
     length <- max(oddRuns)
  } else {
     longest <- which(runs == max(evenRuns))[1]
     length <- max(evenRuns)
  } 
  
  # so now can deduce index position and length of
  # the longest TRUE
  longestStart <- sum(runs[1:longest - 1]) 
  # final result
  out <- longestStart + seq_len(length)
  out
}

green30 <- replicate(100000, sample(list("green", 30), size = 1, prob = c(0.5, 0.5)))
#unlist(green30)
span(green30, is.character)