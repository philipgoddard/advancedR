# Q1

rm(list = ls())

# match.fun() lets you find a function. Given a function can you find its name?
# Why does this not make sense in R?

?match.fun

# need to know the calling name of function to find it- whats the point?

# Q2

rm(list = ls())

# Use lapply() and an anonymous function to find the coefficient of variation on mtcars data set

lapply(mtcars, function(x) sd(x) / mean(x))

# Q3

rm(list = ls())

# use integrate() and an anonymous function to find areas under curves

integrate(function(x) x ^ 2 - x, 0, 10)
integrate(function(x) sin(x) + cos(x), -pi, pi)
integrate(function(x) exp(x) / x, 10, 20)
# Q4

rm(list = ls())

# Blah