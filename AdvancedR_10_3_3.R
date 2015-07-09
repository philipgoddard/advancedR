# Q1

rm(list = ls())

# why are functions created inside over functions called closures?

# because they are enclosed by the parent function

# Q2

rm(list = ls())

# its a box-cox transform, generates function for trasform given lambda 

# Q3

rm(list = ls())

# what does approxfun() do? what does it return?

?approxfun

require(graphics)

x <- 1:10
y <- rnorm(10)
par(mfrow = c(2,1))
plot(x, y, main = "approx(.) and approxfun(.)")
points(approx(x, y), col = 2, pch = "*")
points(approx(x, y, method = "constant"), col = 4, pch = "*")

# Q4

rm(list = ls())

# what does ecdf() do? what does it return?

?ecdf

x <- rnorm(12)
Fn <- ecdf(x)
Fn     # a *function*
Fn(x)  # returns the percentiles for x
tt <- seq(-2, 2, by = 0.1)
12 * Fn(tt) # Fn is a 'simple' function {with values k/12}
summary(Fn)

# Q5

rm(list = ls())

# create a function that creates functions that compute the central moment of a numerical vector

moment <- function(order) {
  function(x) {
    #something - look up definition
  }
}

# m1 <- moment(1)
# m2 <- moment(2)

# Q6

rm(list = ls())

# create a function pick() that takes and index i as and argument and returns a
# function with an argument x that subsets x with i

pick <- function(position){
  function(x){
    x[[position]]
  }
}

lapply(mtcars, pick(5))
lapply(mtcars, function(x) x[[5]])

