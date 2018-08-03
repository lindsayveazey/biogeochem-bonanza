rm(list=ls())
# Read in files

setwd('C:/Users/linds/Documents/HIReefSim')
list.files()
BI <- read.csv('BI_ConnPts.csv')
Oahu <- read.csv('Oahu_ConnPts.csv')
Kauai <- read.csv('Kauai_ConnPts.csv')
mod <- read.csv('modOut.csv')
mod[1] <- lapply(mod[1], as.integer)

# Merge files by site number
BImod <- merge(mod, BI, by = 'habitat_pi')
Oahumod <- merge(mod, Oahu, by = 'habitat_pi')
Kauaimod <- merge(mod, Kauai, by = 'habitat_pi')

# Do some trickery to get the NEAR_FID (for self s) for settlement sites
mod2 <- mod
names(mod2)[names(mod2) == 'habitat_pi'] <- 'habitat_pi_orig'
names(mod2)[names(mod2) == 'site_settled'] <- 'habitat_pi'

mod2 <- merge(mod2, BI, by = 'habitat_pi')
names(mod2)[names(mod2) == 'habitat_pi'] <- 'site_settled'
mod2$settle_NEAR_ID <- mod2$NEAR_FID
cols <- c(1,11)
mod2 <- mod2[,cols]

# Remove duplicate rows
mod2 <- unique(mod2)

# Merge settlement NEAR_FID data w other merges
BImod <- merge(BImod, mod2, by = 'site_settled')
Oahumod <- merge(Oahumod, mod2, by = 'site_settled')
Kauaimod <- merge(Kauaimod, mod2, by = 'site_settled')

# Loop through

# BI
for (i in 1:nrow(BImod)) {
  if (BImod$NEAR_FID[i] == BImod$settle_NEAR_ID[i]) {
    BImod$self[i] = "1"}  
  else { 
      BImod$self[i] = "0"}  
   }