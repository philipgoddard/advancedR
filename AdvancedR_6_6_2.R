# Q1
# how does chdir parameter of source() compar to in_dir()
# why might you prefer one approach to the other?

rm(list = ls())

in_dir <- function(dir, code){
  old <- setwd(dir)
  on.exit(setwd(old))
  
  force(code)
  
}
getwd()
in_dir("~", getwd())

# look at ?source
# chdir is logical,  if TRUE and file is a pathname, 
# the R working directory is temporarily changed to the 
# directory containing file for evaluating.

# in_dir() changes path then resets back to old

# source() chdir is optional, which is why might prefer

#------------------------------------------
# Q2
# what function undoes the action of library()
# how do you save and restore the options() and par()?

rm(list = ls())

# detach() is opposite of library

op <- par(new = TRUE)

bloop <- function(){
  op <- par(new = TRUE)
  on.exit(par(op))
}

#------------------------------------------
# Q3
# write a function that opens a graphics device, runs supplied code,
# then closes the graphics device, regardless of whether code works

# had problems with this, found this solution using google
rm(list = ls())

safe_plot <- function(code, file = 'test.png', ...) {
  png(file = file, ...)
  on.exit(dev.off())
  force(code)
  invisible(NULL)
}

safe_plot({require(ggplot2)
           p <- ggplot(iris, aes(x = Sepal.Length, y = Sepal.Width)) +
             geom_point()
           print(p)
})

#------------------------------------------
# Q4
# can use on.exit() to implement a simple version of capture.output()
rm(list = ls())

capture.output2 <- function(code){
  temp <- tempfile()
  on.exit(file.remove(temp), add = TRUE)
  
  sink(temp)
  on.exit(sink(), add = TRUE)
  
  force(code)
  readLines(temp)
}

capture.output2(cat("a", "b", "c", sep = "\n"))
capture.output(cat("a", "b", "c", sep = "\n"))


# compare capture.output() to capture.output2()
# how do the functions differ? what features have been removed?
# how have key ideas been written to be easier to understand?

# this is tough, wont dwell on too much for now
# capture.output2 is waaaay simpler!