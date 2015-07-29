# 12.3.3

# prvious download() only downoads a single file
# how can you use partial() and lapply() to create a
# file that downloads multiple files at once?

download_file <- function(url, ...) {
  download.file(url, basename(url), ...)
}
# apply with lapply(urls, download_file)

delay_by <- function(delay, f) {
  function(...) {
    Sys.sleep(delay)
    f(...)
  }
}

dot_every <- function(n, f) {
  i <- 1
  function(...) {
    if (i %% n == 0 ) cat(".")
    i <<- i + 1
    f(...)
  }
}

download <- dot_every(10, delay_by(1, download_file))

# now apply with
# lapply(urls, download)

# not really sure what question is asking!

#--------------------------------------------------------
# Q2

function (.fun, .cols = true, ...) 
{
  if (!is.function(.cols)) {
    .cols <- as.quoted(.cols)
    filter <- function(df) eval.quoted(.cols, df)
  }
  else {
    filter <- function(df) Filter(.cols, df)
  }
  dots <- list(...)
  function(df, ...) {
    stopifnot(is.data.frame(df))
    df <- strip_splits(df)
    filtered <- filter(df)
    if (length(filtered) == 0) 
      return(data.frame())
    out <- do.call("lapply", c(list(filtered, .fun, ...), 
                               dots))
    names(out) <- names(filtered)
    quickdf(out)
  }
}

#Turn a function that operates on a vector into a
#function that operates column-wise on a data.frame.

nmissing <- function(x) sum(is.na(x))
f <- colwise(nmissing)
f(baseball)

#----------------------------------
# Q3

# write a functional operator to return a matrix instead of a data frame
# or a data frame instead of a matrix

change_it <- function(f){
  force(f)
  function(...) {
    if(is.matrix(f(...))){
      out <- as.data.frame(f(...))
    } else if (is.data.frame(f(...))){
      out <- as.matrix(f(...))
    }
    out
  }
}

a <- matrix(c(1,2,5,3,4,5,6,7,8), nrow = 3)
?pivot

test1 <- change_it(solve)
solve(a)
test1(a)
class(test1(a))

test2 <- change_it(log)
test2(mtcars)
class(test2(mtcars))

# Q4


# Q5
