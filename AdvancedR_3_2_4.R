# given a linear model 
mod <- lm(mpg ~ wt, data = mtcars)

# extract residual degrees of freedom
mod$residuals

# extract the R squared from the model summary
names(summary(mod))
summary(mod)$r.squared
