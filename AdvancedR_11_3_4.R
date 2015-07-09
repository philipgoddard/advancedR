# Q1 

# how does apply() arrange output?

# Q2 there is no equivalent to split + vapply. Implement one


svapply <- function(x, group, f, FUN.VALUE, ..., simplify = TRUE){
  pieces <- split(x, group)
  vapply(pieces, f, FUN.VALUE, simplify = simplify)
}

pulse <- round(rnorm(22, 70, 10/3)) + rep(c(0,5), c(10, 12))
group <- rep(c("A", "B"), c(10, 12))

svapply(pulse, group, mean, numeric(1))

# Q3 implement a pure R version of split()

split(pulse,group)

split2 <- function(v1, v2){
  gNames <- unique(as.factor(v2))
  output <- vector('list', length(gNames))
  names(output) <- levels(gNames)
  for(i in gNames){
    output[[i]] <- v1[v2 == i]
  }
 output
}

split2(pulse,group)
