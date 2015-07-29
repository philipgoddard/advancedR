# Q1

rm(list = ls())

# implement arg_max()
# should take function and a vector of inputs and return where
# function has highest value

arg_max <- function(x, f, ...) {
  fx <- vapply(x, f, ..., numeric(1))
  x[which(fx == max(fx))]  
}

arg_max(-5:5, function(x) x ^ 2)

arg_min <- function(x, f, ...) {
  fx <- vapply(x, f, ..., numeric(1))
  x[which(fx == min(fx))]  
}

arg_min(-5:5, function(x) x ^ 2)

# Q2

# come back to once have internet