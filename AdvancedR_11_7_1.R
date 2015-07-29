# Q1

rm(list = ls())

smaller <- function(x, y, na.rm = F){
  stopifnot(is.numeric(x),
            is.numeric(x),
            length(x) == 1,
            length(y) == 1)
  min(x, y)
}

smaller(10,4)

# now use rm_na helper

rm_na <- function(x, y, identity) {
  if(is.na(x) && is.na(y)) {
    identity
  } else if (is.na(x)) {
    y
  } else {
    x
  }
}

smaller2 <- function(x, y, na.rm = F) {
  ifelse(na.rm && (is.na(x) || is.na(y)), rm_na(x, y, Inf), min(x, y))
}

smaller2(10, (smaller2(NA, NA, na.rm = T)), na.rm = T)
smaller2(NA, 6)

# i guess thats ok...


larger <- function(x, y, na.rm = F){
  stopifnot(is.numeric(x),
            is.numeric(x),
            length(x) == 1,
            length(y) == 1)
  max(x, y)
}

larger2 <- function(x, y, na.rm = F) {
  ifelse(na.rm && (is.na(x) || is.na(y)), rm_na(x, y, -Inf), max(x, y))
}

larger2(10, 2)
larger2(10, NA)
larger2(10, NA, na.rm = T)
larger2(10, (larger2(NA, NA, na.rm = T)), na.rm = T)

# now (i guess) the functions work, lets make min2(), max2(), pmin2(), pmax2()
# and row_min()w and row_max()


# use reduce- want to recursively apply smaller2 over inputs to combine
# as smaller2 requires 2 arguments, have to enclose in anonymous function
min2 <- function(..., na.rm = T) {
  Reduce(function(x, y) smaller2(x, y, na.rm = na.rm), list(...), init = Inf)
}

min(c(10, 6, 2, 5))
min2(c(10, 6, 2, 5))
min2(10, 6, 2, 5)

max2 <- function(..., na.rm = T) {
  Reduce(function(x, y) larger2(x, y, na.rm = na.rm), list(...), init = -Inf)
}

max(c(10, 6, 2, 5))
max2(c(10, 6, 2, 5))
max2(10, 6, 2, 5)

# use map- essentially just want to apply min2 over the input vectors
pmin2 <- function(..., na.rm = T) {
  simplify2array(
      Map(min2, ..., na.rm = na.rm)
  )
}

pmin(c(1,2,3), c(4,5,6), c(1,4,2))
pmin2(c(1,2,3), c(4,5,6), c(1,4,2))

pmax2 <- function(..., na.rm = T) {
  simplify2array(
    Map(max2, ..., na.rm = na.rm)
  )
}

pmax(c(1,2,3), c(4,5,6), c(1,4,2))
pmax2(c(1,2,3), c(4,5,6), c(1,4,2))

# just apply min2 over the rows of input (assume it is a matrix)
row_min <- function(x, na.rm = T) {
  apply(x, 1, min2, na.rm = na.rm)
}

testMatrix <- matrix(runif(9), nrow = 3)
testMatrix

row_min(testMatrix)

row_max <- function(x, na.rm = T) {
  apply(x, 1, max2, na.rm = na.rm)
}

row_max(testMatrix)
