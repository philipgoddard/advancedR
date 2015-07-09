df <- data.frame(a = runif(20),
                 b = rnorm(20, 0, 2),
                 c = rnorm(20, 1, 4),
                 d = c(rep('hello', 10), rep('goodbye', 10)) )

vapply(df[vapply(df, is.numeric, logical(1))], sd, numeric(1))

# sapply dangerous for class of df columns as there can be more than 1 and sapply
# silently drops

trials <- replicate(
  100,
  t.test(rpois(10,10), rpois(7,10)),
  simplify = F
)

sapply(trials, function(x) x[[3]])
sapply(trials, '[[', 'p.value')

replicate(10, c(2,3,4))
replicate(10, c('blues', 'clues'))

blah <- list('a' = c(1, 2, 3, 4), 'b' = c(5, 6, 7, 8))

lapply2 <- function(x, f, ...){
  out <- list(length(x))
  for (i in seq_along(x)){
    out[[i]] <- f(x[[i]], ...)
    names(out)[[i]] <- names(x)[[i]]
  }
  out
}

lapply2(blah, sum, na.rm = T)

# copied this off internet
lapply3 <- function(f, FUN.VALUE , ...) {
  out <- Map(f, ...)
  vapply(out, identity, FUN.VALUE)
}

lapply3(sum, numeric(1), blah, na.rm = T)

mcsapply <- function(x, f, ...){
  res <- mclapply(x, f, ..., mc.cores = 4)
  simplify2array(res)
}

mcsapply(blah, sum, na.rm = T)

# i dont think a parallel vapply can be done - doesnt it already
# work in parallel?

# have a look at pvec
# The major difference between pvec and mclapply is that mclapply will run FUN on each element
# separately whereas pvec assumes that c(FUN(x[1]), FUN(x[2])) is equivalent to FUN(x[1:2]) 
# and thus will split into as many calls to FUN as there are cores (or elements, if fewer), 
# each handling a subset vector.This makes it more efficient than mclapply but requires
# the above assumption on FUN.

library(microbenchmark)

microbenchmark(
  pvec(1:1000000, sqrt, mc.cores = 4)
)
microbenchmark(
  unlist(mclapply(1:1000000, sqrt, mc.cores = 4))
)
microbenchmark(
  unlist(lapply(1:1000000, sqrt))
)


