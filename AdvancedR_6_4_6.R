# clairfy the list of odd function calls

set.seed(1234)
x <- sample(replace = TRUE, 20, x = c(1:10, NA))
x
x <- sample(x = c(1:10, NA), size = 20, replace = TRUE )
x

y <- runif(min = 0, max = 1, 20)
y
y  <- runif(n = 20, min = 0, max = 20)

cor(m = "k", y = y, u = "p", x = x)
cor(x = x, y = y, use = 'pairwise.complete.obs', method =  'kendall')

# what does this function return? why? which principle does it illustrate?

f1 <- function(x = {y <- 1:2}, y = 0){
  x + y
}
f1()
# returns 2 4
# not sure what this is demonstarting... y gets evaluated to c(1,2), then
# overwrites the default y = 0...

# what does this function return? why? which principle does it illustrate?

f2 <- function(x = z){
  z <- 100
  x
}
f2()

# returns 100
# shows defailt values can be set inside the function itself, 
# get pulled back out for the formals