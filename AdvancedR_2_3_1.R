#Q1

rm(list = ls())

vec <- c(1,2,3,4,5)
typeof(vec)
is.atomic(vec)
dim(vec)

# dim of a vector is NULL

#Q2

rm(list = ls())

mat <- matrix(1:6, ncol = 3, nrow = 2)
is.matrix(mat)
is.array(mat)

# if is.matrix is true, is.array is true as well (i guess as
# matrix is a special case of an array)

#Q3

rm(list = ls())

x1 <- array(1:5, c(1, 1, 5))
x2 <- array(1:5, c(1, 5, 1))
x3 <- array(1:5, c(5, 1, 1))

dim(x1)
dim(x2)
dim(x3)
dim(c(1:5))

# these ojects are arrays, 1D thick in two out of 3 dimensions
# can think of them as a vector pointing in a dimension
# in R vectors do not have dimensions