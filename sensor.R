rm(list = ls())

### CHANGE THIS ###

setwd('C:/Users/linds/OneDrive/Desktop') # your wd
list.files()
data <- read.csv('RFSb2.csv') # your file name
dim(data)
rows <- nrow(data) # no. rows in df
lastcol <- ncol(data) # last col index (where sample data stored)
samples <- 20 # no. samples per row
readings <- 6 # no. readings per sample

### Copy and paste the following ###

list.files()
head(data) 
sub <- data[,lastcol] #subset GRFD column
library(stringi)
# Below was the error- this df had a \n\n
sub2 <- stri_replace_all_regex(sub[1:rows], "\n\n", ",") # remove \n\n replace with comma
sub3 <- as.list(sub2)
rs <- rows*samples
list <- strsplit(sub2[1:rs], ",") # as a list; rows*samples=rs; rs*readings = rrs
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
write.csv(dataNew, 'RFSb2edit.csv')