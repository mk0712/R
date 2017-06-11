# Load libraries:
library(data.table) # required

library(tau)

## Load image:
##load("./data_images/CapstoneImage_.Rdata")
#bi.dt = data.table( read.csv(file="./data_images/english_bigram.csv", header=TRUE, sep = ";") )
#tri.dt = data.table( read.csv(file="./data_images/english_trigram.csv", header=TRUE, sep=";") )
#setkey(bi.dt, v)
#setkey(tri.dt, uv)
#stmt="Talking to your mom has the same effect as a hug and helps reduce your"

predictNextWord <- function(stmt, tri.dt, bi.dt) # removed opts, m.df.l
{        
  stmt.tkns = tokenize(stmt)
  tkns1 = stmt.tkns[stmt.tkns != " "]
  len1 = length(tkns1)
  u = tkns1[len1 - 1 - 1] # u+v+w = the last three words of the data entered
  v = tkns1[len1 - 1]
  w = tkns1[len1]
  bigram = paste(v, w, sep=" ")
  unigram = w
  
  predWord = "the" # set default predicted word
  temp.dt = NULL
  
  # Check whether a trigram of the words u+v+w exists. If so, store it as "predWord":
  if( length(tri.dt[tri.dt$uv == bigram,]$w)==1 ){
    temp.dt = tri.dt[tri.dt$uv == bigram,]
    temp.dt$w = as.character(temp.dt$w)
    predWord = temp.dt[[1, "w"]]
    temp.dt = NULL
  }else if( length(bi.dt[bi.dt$v == unigram,]$w)==1 ){# If no trigram exists, check whether a bigram of the words v+w exists. If so, store it as "predWord":
    temp.dt = bi.dt[bi.dt$v == unigram,]
    temp.dt$w = as.character(temp.dt$w)
    predWord = temp.dt[[1, "w"]]
    temp.dt = NULL
  }
  
  return(predWord)
}
