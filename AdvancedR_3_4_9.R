# Q1
rm(list=ls())

# how would you randomly permute the columns of a dataframe?
# can you simultaniously permute rows and columns in one step?

permDF <- function(inSeed){
  df <- mtcars
  set.seed(inSeed)
  
  colVec <- seq(from = 1, to = ncol(mtcars))
  rowVec <- seq(from = 1, to = nrow(mtcars))
  randOrderCol <- sample(colVec, length(colVec), replace = FALSE)
  randOrderRow <- sample(rowVec, length(rowVec), replace = FALSE)
  
  dfPerm <- df[randOrderRow, randOrderCol]
  head(dfPerm)
}

permDF(1234)
permDF(123344)

#-------------------------------------
# Q2
rm(list=ls())

# how do you sample a random selection of m rows from a data frame?
# what if they have to be contiguos? (ie initial row, final row, every row between)
randRow <- function(inSeed, nSamples){
  df <- mtcars
  set.seed(inSeed)
  
  rowVec <- seq(from = 1, to = nrow(mtcars))
  rowSamp <- sample(rowVec, nSamples, replace = FALSE)
  
  dfRandRow <- df[rowSamp, ]
  head(dfRandRow)
}

randRow(1234, 10)
randRow(123344, 4)

# rmeove the choice for number of samples here as 
# can easily go out of bounds
# could restore option to specify how many want with a while loop?
# eg keep resampling until can produce the min to max of specified
# size without going out of range
randRowCont <- function(inSeed){
  df <- mtcars
  set.seed(inSeed)
  
  rowVec <- seq(from = 1, to = nrow(mtcars))
  
  flag <- TRUE
  while(flag == TRUE){
    rowSamp <- sample(rowVec, 2, replace = FALSE)
    rowStart <- min(rowSamp)
    rowStop <- max(rowSamp)
    if(rowStop <= nrow(df)){flag = FALSE}
  }

  print(c(rowStart, rowStop))
  dfRandRowCont <- df[rowStart:rowStop, ]
  dfRandRowCont
}

randRowCont(1223334)
randRowCont(124)


#------------------------------------
# Q3
rm(list=ls())

# how do you put columns of data frame in alphabetical order?
df <- mtcars

df[, order(names(df))]



