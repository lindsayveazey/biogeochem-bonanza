# Lindsay Veazey's focal 3 researcher test

rm(list=ls())
# wd is my scratch git repo

list.files()

##### Data import & cleaning #####

base <- read.csv('baseline_eval.csv') # geo-referenced prevalence data from community-based surveys
mda <- read.csv('MDA_coverage.csv') # district-level summary data of mass drug admin. coverage (% treated of district pop)
vector <- read.csv('Vector.csv') # binary community-level vector control implementation
mon <- read.csv('monitoring_data.csv') # mid-program community-level prevalence data

vsub <- vector[,5:6] # Isolate village_id and binary vector data
bv <- merge(base, vsub, by = 'village_id')

#######################################################################################################
###### Part 1a ######

bvsub <- bv[, c(13, 16)] # Isolate 'nodule_eval_prev' and 'ov16_eval_prev'
bv$avprev <- apply(bvsub, 1, mean, na.rm = TRUE) # Average prev data; equal weight to both methods; NAs assigned when there is no data for either eval method

###### Part 1b ######

###### Part 1c ######

###### Part 1d ######

###### Part 1e ######

#######################################################################################################
###### Part 2 ######
