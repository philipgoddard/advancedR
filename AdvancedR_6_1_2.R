#Q1

rm(list = ls())

# tell if a function is a function

is.function(sum)

# tell if a functon is a primative function (ie calls C code directly)
# and no body, environment and formals

is.primitive(sum)

#-----------------------------------------
#Q2

rm(list = ls())

# here is a list of all functions in base R package
objs <- mget(ls("package:base"), inherits = TRUE)
funs <- Filter(is.function, objs)

nFormals <- (lapply(funs, function(x){length(formals(x))}))
nFormalsUL <- unlist(nFormals)

table(nFormalsUL)
nFormals[which(nFormalsUL == max(nFormalsUL))]

# to adapt to primitive functions only, change
# funs <- Filter(is.primitive, objs)

#-----------------------------------------
#Q3

rm(list = ls())

# Three important components of a function are
# body() - function contents
# environment() - function environment where variables stored
# formals() - function arguments

#-----------------------------------------
#Q4

rm(list = ls())

# When does a printing function not show the environment it was created in?

# primitive function
