# Q1

rm(list=ls())

# i)

# wrong
# mtcars[mtcars$cyl = 4, ]

# correct
mtcars[mtcars$cyl == 4, ]

# ii)

# wrong
# mtcars[-1:4, ]

# correct
mtcars[-(1:4), ]

# iii)

# wrong
# mtcars[mtcars$cyl <= 5]

# correct
mtcars[mtcars$cyl <= 5, ]

# iv)

# wrong
# mtcars[mtcars$cyl == 4 | 6, ]

# correct
mtcars[mtcars$cyl == 4 | mtcars$cyl == 6, ]

#------------------------------------------------
# Q2

rm(list=ls())

x <- 1:5
x[NA]
x[NA_real_]

# why do these give different results?
# NA is a logical vector of length 1, so gets recycled

#------------------------------------------------
# Q3

rm(list=ls())

# ?upper.tri : Returns a matrix of logicals the same size of
# a given matrix with entries TRUE in the lower or upper triangle.

x <- outer(1:5, 1:5, FUN ='*')
upper.tri(x)
x[upper.tri(x)]

# when subset a matrix with it, it returns a vector of those values
# which are true in the upper triangular part

#------------------------------------------------
# Q4

rm(list=ls())


# mtcars[1:20] returns and error as there are not 20 columns.
# mtcars[1:20, ] returns first 20 rows

mtcars[1:20]
mtcars[1:20, ]

#------------------------------------------------
# Q5

rm(list=ls())


# implement a function that extracts diagonal elements from a matrix

x <- outer(1:5, 1:5, FUN = '*')
x
diag(x)

diag2 <- function(matIn){
  # find number of elements in the diagonal
  maxDim <- max(nrow(matIn), ncol(matIn))
  # initialise a list of the correct size
  output <- list(1:maxDim)
  for(k in 1:maxDim){
    output[k] <- matIn[k, k]
  }
  unlist(output)
}

#------------------------------------------------
# Q6

rm(list=ls())

# what does df[is.na(df)] <- 0 do? how does it work?

# it finds NA values in df, and sets them to 0
# it uses vector notation to subset the dataframe
