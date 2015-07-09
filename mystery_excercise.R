# Q1

rm(list = ls())

summary2 <- list(
  Min = min,
  FirstQ = function(x) quantile(x, 0.25)[[1]] ,
  Median = median,
  Mean = mean,
  
  ThirdQ = function(x) quantile(x, 0.75)[[1]],
  Max = max
)

x = c(1:10)
unlist(lapply(summary2, function(f) f(x)))
summary(x)