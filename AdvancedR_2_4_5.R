#Q1

rm(list = ls())

dat = data.frame(x = c(1,2,3),
                 y = c('hat', 'hat', 'dog'),
                 z = factor(c('m', 'm', 'f'), levels = c('m','f')))

attributes(dat)

# attributes are column names, row names and class

#---------------------------------------------------------------
#---------------------------------------------------------------

#Q2

rm(list = ls())

dat = data.frame(x = c(1,2,3),
                 y = c('hat', 'hat', 'dog'),
                 z = factor(c('m', 'm', 'f'), levels = c('m','f')))

as.matrix(dat)

# when as.matrix is applied to a data frame of different types, 
# contents are coerced to most flexible common type. In this case,
# characters

#---------------------------------------------------------------
#---------------------------------------------------------------

#Q3

rm(list = ls())

L3 <- LETTERS[1:3]
fac <- sample(L3, 10, replace = TRUE)
(d <- data.frame(x = 1, y = 1:10, fac = fac))

(d0  <- d[, FALSE])   # data frame with 0 columns and 10 rows
(d.0 <- d[FALSE, ])   # <0 rows> data frame  (3 named cols)
(d00 <- d[FALSE, FALSE])  # data frame with 0 columns and 0 rows

# yes, you can have a data frame with zero rows or zero columns, or both