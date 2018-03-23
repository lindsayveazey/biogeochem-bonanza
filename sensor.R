rm(list = ls())

setwd('C:/Users/linds/OneDrive/Desktop') # CHANGE

list.files()
data <- read.csv('gbj.csv')
head(data) 
sub <- data[,4] #subset GRFD column
library(stringi)
sub2 <- stri_replace_all_regex(sub[1:299], "[\n]", ",") # remove \n replace with comma
sub3 <- as.list(sub2)
list <- strsplit(sub2[1:5980], ",") # as a list; 299*20=5980; 5980*10 = 59800
l1 <- unlist(list) # separate all character elements; 59800
l1 <- na.omit(l1)
l2 <- matrix(data = l1, nrow = 5980, ncol = 10, byrow = T) # create matrix, fill by row
df <- as.data.frame(l2)
dim(df) # 5980 rows, 10 cols
data2 <- data[,1:3] # remove last col
data3 <- data2[rep(seq_len(nrow(data2)), each = 20),] # repeat each row 20 times
dataNew <- cbind(data3, df)