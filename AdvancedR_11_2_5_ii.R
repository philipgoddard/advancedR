# Q1

rm(list = ls())

# use vapply() to calculate the sd of every column in a numerical data frame

df <- data.frame(x = rnorm(20, 0, 1),
                 y = sin(seq(1, 3, length = 20)) + runif(20), 
                 z = rnorm(20, 0, 2))

vapply(df, sd, numeric(1))

# use vapply() to compute the sd of every numeric column in a mixed data frame

df2 <- data.frame(x = rnorm(20, 0, 1),
                 y = sin(seq(1, 3, length = 20)) + runif(20), 
                 z = rnorm(20, 0, 2),
                 mood = c(rep('happy', 10), rep('sad', 10)))

numericCol <- vapply(df2, is.numeric, logical(1))
vapply(df2[numericCol], sd, numeric(1))

# Q2

rm(list = ls())

# why is using sapply() to get class of columns in data frame dangerous?

df2 <- data.frame(x = rnorm(20, 0, 1),
                  y = sin(seq(1, 3, length = 20)) + runif(20), 
                  z = rnorm(20, 0, 2),
                  mood = c(rep('happy', 10), rep('sad', 10)))

sapply(df2, class)

# ? not sure
# sapply silently drops arguments, if a column has more than 1 class
# will have problems

# Q3

rm(list = ls())

# use sapply and an anonymous function to extract p-value from every trial

trials <- replicate(
  100,
  t.test(rpois(10,10), rpois(7,10)),
  simplify = F
)

sapply(trials, function(x) x$p.value )
sapply(trials, '[[', i = 'p.value' )

# Q4

rm(list = ls())

# what does replicate() do? what sort of loop does it eliminate?
# why does its loops differ from lapply and friends?

# replicate is a wrapper for the common use of sapply for repeated evaluation of an expression
# (which will usually involve random number generation).
# usage: replicate(n, expr, simplify = "array")

## use of replicate() with parameters:
foo <- function(x = 1, y = 2) c(x, y)
# does not work: bar <- function(n, ...) replicate(n, foo(...))
bar <- function(n, x) replicate(n, foo(x = x))
bar(5, x = 3)

replicate(5, rnorm(2))
replicate(10, c('blue', 'clue'))

# Q5

rm(list = ls())

# implement a version of laaply() that supplies FUN with both the name and the value of each component

blah <- list('a' = c(1, 2, 3, 4), 'b' = c(2, 4, 6, 8), 'c' = c(3, 6, 9, 12), 'd' = c(NA, 8, 12, 16))

lapply2 <- function(x, f, ...){
  out <- vector("list", length(x))
  for (i in seq_along(x)){
    out[[i]] <- f(x[[i]], ...)
    names(out)[i] <- names(x)[i]
  }
  out
}


lapply2(blah, sum, na.rm = TRUE)


# Q6

rm(list = ls())

# implement a combination of Map() and vapply() to create an lapply variant that iterate over
# inputs in parallel and stores outputs in vector (or matrix)
# what arguments should the function take?

# wow had no idea. modified this from a solution I found...
# can use mcMap to speed further

library(parallel)
lapply4 <- function(f, FUN.VALUE , ...) {
  out <- mcMap(f, ...)
  vapply(out, identity, FUN.VALUE)
}

lapply4(sum, numeric(1), blah, na.rm=T)

lapply4(sd, numeric(1), list(1:1000000000), na.rm=T, mc.cores = 4)
unlist(lapply(list(1:100000000), sd))

