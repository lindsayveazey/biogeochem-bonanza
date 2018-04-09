rm(list = ls())

### CHANGE THIS ###

setwd('C:/Users/linds/OneDrive/Documents/GBJ') # your wd
list.files()
data <- read.csv('rawSa.csv') # your file name
data$X <- NULL # This is a useless column
dim(data)
rows <- nrow(data) # no. rows in df
lastcol <- ncol(data) # last col index (where sample data stored)
samples <- 43 # no. samples per row
readings <- 10 # no. readings per sample

### Copy and paste the following ###

list.files()
head(data) 
sub <- data[,lastcol] #subset GRFD column
library(stringi)
sub2 <- stri_replace_all_regex(sub[1:rows], "\n", ",break,") # remove \n\n replace with comma
sub3 <- as.list(sub2)
rs <- rows*samples
list <- strsplit(sub2[1:rs], ",") # as a list; rows*samples=rs; rs*readings = rrs
## Try this

b <- c("break","-9.737715","0.000091","-0.000340","-0.001318","-38.103233","-10.327046","break","27.469583","break")

y <- c()
cnt_betwn_break <- 0
for(i in 1:length(b)){
  ifelse(b[i]=='break',
         {if(!(cnt_betwn_break %in% c(0,9))) y <- c(y, rep(NA, 9 - cnt_betwn_break))
         cnt_betwn_break <- 0},
         cnt_betwn_break <- cnt_betwn_break + 1)
  y <- c(y, b[i])
}
y

#######

rrs <- rs*readings
l1 <- unlist(list) # separate all character elements; should = rrs
l1 <- na.omit(l1)
l2 <- matrix(data = l1, nrow = rs, ncol = readings, byrow = T) # create matrix, fill by row
df <- as.data.frame(l2)
dim(df) # rs = no. rows, readings = no. cols
data2 <- data[,-lastcol] # remove last col
data3 <- data2[rep(seq_len(nrow(data2)), each = samples),] # repeat each row (no. samples) times
dataNew <- cbind(data3, df)

### CHANGE THIS FILE NAME ###
write.csv(dataNew, 'rawSbedit.csv')