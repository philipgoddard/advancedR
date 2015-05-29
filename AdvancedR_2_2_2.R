#Q1

rm(list=ls())

structure(1:5, comment = 'my attribute')
structure(1:10, my_attribute = 'This is a vector')

# reason why attribute not printed is as comment is a function
# ?comment - contrarty to other attributes, the commentet is not printed
# by default

#Q2

rm(list=ls())

f1 <- factor(letters)
class(f1)
levels(f1) <- rev(levels(f1))
class(f1)

# we see that when levels are modified... cant see anything unexpected

f1 <- rev(levels(f1))
# here factor is coerced to character

#Q3

rm(list=ls())

f1 <- factor(letters)
f1 <- rev(levels(f1))
f2 <- rev(factor(letters))
f3 <- rev(factor(letters, levels = rev(letters)))

# f2 and f3 differs as they maintain the class as a factor
