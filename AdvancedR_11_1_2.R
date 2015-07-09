# Q1

rm(list = ls())

# why are follwoing invocations of lapply() equivalent?

trims <- c(0, 0.1, 0.2, 0.5)
x <- rcauchy(100)

lapply(trims, function(trim) mean(x, trim = trim))
lapply(trims, mean, x = x)

# first elemengt of mean gets interpetetd as the value of trim IF the value of x is already supplied

# Q2

rm(list = ls())

# function here scales a vector so it falls in the range [0, 1].

scale01 <- function(x) {
  rng <- range(x, na.rm = TRUE)
  (x - rng[1]) / (rng[2] - rng[1])
}

# apply to every column in a data frame
mtcarsCopy <- mtcars
mtcarsCopy[] <- lapply(mtcarsCopy, scale01)

# would have to be more careful to specify only numeric columns - filter first?

cols <- unlist(lapply(mtcars, is.numeric))
mtcarsFiltered <- mtcars[, cols]
mtcarsFiltered[] <- lapply(mtcarsFiltered, scale01)

# Q3 

rm(list = ls())

formulas <- list(
  mpg ~ disp,
  mpg ~ I(1 / disp),
  mpg ~ disp + wt,
  mpg ~ I(1 / disp + wt))

mods <- vector("list", length(formulas))

for (i in seq_along(formulas)){
  mods[[i]] <- lm(formulas[[i]], data = mtcars)  
}

lapply(formulas, lm, data = mtcars)

# Q4


rm(list = ls())

# fit a model of mpg ~ disp for 
# each of these bootstrap samples of mtcars

bootstraps <- lapply(1:10, function(i){
  rows <- sample(1:nrow(mtcars), rep = TRUE)
  mtcars[rows, ]
})

mods <- vector("list", length(bootstraps))
for (i in seq_along(bootstraps)){
  mods[[i]] <- lm(mpg ~ disp, data = bootstraps[[i]])
}
lapply(bootstraps, lm, formula = mpg ~ disp)

# Q5

rm(list = ls())

# extract R2 using the below function:

rsq <- function(mod) summary(mod)$r.squared

formulas <- list(
  mpg ~ disp,
  mpg ~ I(1 / disp),
  mpg ~ disp + wt,
  mpg ~ I(1 / disp + wt))

formula_lapply <- lapply(formulas, lm, data = mtcars)

# get rsq out with a second use of lapply
lapply(formula_lapply, rsq)

bootstraps <- lapply(1:10, function(i){
  rows <- sample(1:nrow(mtcars), rep = TRUE)
  mtcars[rows, ]
})

bootstrap_lapply <- lapply(bootstraps, lm, formula = mpg ~ disp)

# get rsq out with a second use of lapply
lapply(bootstrap_lapply, rsq)
