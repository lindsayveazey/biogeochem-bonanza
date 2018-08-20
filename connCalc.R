rm(list=ls())
# Read in files

setwd('C:/Users/linds/Documents/HIReefSim')
list.files()
BI <- read.csv('BI_ConnPts.csv')
MNI <- read.cav('MNI_ConnPts.csv')
Oahu <- read.csv('Oahu_ConnPts.csv')
Kauai <- read.csv('Kauai_ConnPts.csv')
mod <- read.csv('modOut.csv')
mod[1] <- lapply(mod[1], as.integer)

# Merge files by site number
BImod <- merge(mod, BI, by = 'habitat_pi')
MNImod <- merge(mod, MNI, by = 'habitat_pi')
Oahumod <- merge(mod, Oahu, by = 'habitat_pi')
Kauaimod <- merge(mod, Kauai, by = 'habitat_pi')

# Do some trickery to get the NEAR_FID (for self s) for settlement sites
mod2 <- mod
names(mod2)[names(mod2) == 'habitat_pi'] <- 'habitat_pi_orig'
names(mod2)[names(mod2) == 'site_settled'] <- 'habitat_pi'

# MNI (example)
mod2 <- merge(mod2, MNI, by = 'habitat_pi')
names(mod2)[names(mod2) == 'habitat_pi'] <- 'site_settled'
mod2$settle_NEAR_ID <- mod2$NEAR_FID
cols <- c(1,11)
mod2 <- mod2[,cols]

# Remove duplicate rows
mod2 <- unique(mod2)

# Merge settlement NEAR_FID data w other merges
BImod <- merge(BImod, mod2, by = 'site_settled')
MNImod <- merge(MNImod, mod2, by = 'site_settled')
Oahumod <- merge(Oahumod, mod2, by = 'site_settled')
Kauaimod <- merge(Kauaimod, mod2, by = 'site_settled')


##############################################################
########## Kauai: subset by NEAR_FID (polygon segment) ########## 

Kauaimod0 <- subset(Kauaimod, Kauaimod$NEAR_FID == 0)
Kauaimod1 <- subset(Kauaimod, Kauaimod$NEAR_FID == 1)
Kauaimod2 <- subset(Kauaimod, Kauaimod$NEAR_FID == 2)
Kauaimod3 <- subset(Kauaimod, Kauaimod$NEAR_FID == 3)
Kauaimod4 <- subset(Kauaimod, Kauaimod$NEAR_FID == 4)
Kauaimod5 <- subset(Kauaimod, Kauaimod$NEAR_FID == 5)
Kauaimod6 <- subset(Kauaimod, Kauaimod$NEAR_FID == 6)
Kauaimod7 <- subset(Kauaimod, Kauaimod$NEAR_FID == 7)

### Loop through
# Kauaimod0
for (i in 1:nrow(Kauaimod0)) {
  if (Kauaimod0$NEAR_FID[i] == Kauaimod0$settle_NEAR_ID[i]) {
    Kauaimod0$settle[i] = "100"} # self-seeding
  else { 
    Kauaimod0$settle[i] = Kauaimod0$settle_NEAR_ID[i]}
}

# Kauaimod1
for (i in 1:nrow(Kauaimod1)) {
  if (Kauaimod1$NEAR_FID[i] == Kauaimod1$settle_NEAR_ID[i]) {
    Kauaimod1$settle[i] = "100"} # self-seeding
  else { 
    Kauaimod1$settle[i] = Kauaimod1$settle_NEAR_ID[i]}
}

# Kauaimod2
for (i in 1:nrow(Kauaimod2)) {
  if (Kauaimod2$NEAR_FID[i] == Kauaimod2$settle_NEAR_ID[i]) {
    Kauaimod2$settle[i] = "100"} # self-seeding
  else { 
    Kauaimod2$settle[i] = Kauaimod2$settle_NEAR_ID[i]}
}

# Kauaimod3
for (i in 1:nrow(Kauaimod3)) {
  if (Kauaimod3$NEAR_FID[i] == Kauaimod3$settle_NEAR_ID[i]) {
    Kauaimod3$settle[i] = "100"} # self-seeding
  else { 
    Kauaimod3$settle[i] = Kauaimod3$settle_NEAR_ID[i]}
}

# Kauaimod4
for (i in 1:nrow(Kauaimod4)) {
  if (Kauaimod4$NEAR_FID[i] == Kauaimod4$settle_NEAR_ID[i]) {
    Kauaimod4$settle[i] = "100"} # self-seeding
  else { 
    Kauaimod4$settle[i] = Kauaimod4$settle_NEAR_ID[i]}
}

# Kauaimod5
for (i in 1:nrow(Kauaimod5)) {
  if (Kauaimod5$NEAR_FID[i] == Kauaimod5$settle_NEAR_ID[i]) {
    Kauaimod5$settle[i] = "100"} # self-seeding
  else { 
    Kauaimod5$settle[i] = Kauaimod5$settle_NEAR_ID[i]}
}

# Kauaimod6
for (i in 1:nrow(Kauaimod6)) {
  if (Kauaimod6$NEAR_FID[i] == Kauaimod6$settle_NEAR_ID[i]) {
    Kauaimod6$settle[i] = "100"} # self-seeding
  else { 
    Kauaimod6$settle[i] = Kauaimod6$settle_NEAR_ID[i]}
}

# Kauaimod7
for (i in 1:nrow(Kauaimod7)) {
  if (Kauaimod7$NEAR_FID[i] == Kauaimod7$settle_NEAR_ID[i]) {
    Kauaimod7$settle[i] = "100"} # self-seeding
  else { 
    Kauaimod7$settle[i] = Kauaimod7$settle_NEAR_ID[i]}
}

#######################################################################
########## Oahu: subset by NEAR_FID (polygon segment) ########## 

Oahumod0 <- subset(Oahumod, Oahumod$NEAR_FID == 0)
Oahumod1 <- subset(Oahumod, Oahumod$NEAR_FID == 1)
Oahumod2 <- subset(Oahumod, Oahumod$NEAR_FID == 2)
Oahumod3 <- subset(Oahumod, Oahumod$NEAR_FID == 3)
Oahumod4 <- subset(Oahumod, Oahumod$NEAR_FID == 4)
Oahumod5 <- subset(Oahumod, Oahumod$NEAR_FID == 5)
Oahumod6 <- subset(Oahumod, Oahumod$NEAR_FID == 6)
Oahumod7 <- subset(Oahumod, Oahumod$NEAR_FID == 7)

### Loop through
# Oahumod0
for (i in 1:nrow(Oahumod0)) {
  if (Oahumod0$NEAR_FID[i] == Oahumod0$settle_NEAR_ID[i]) {
    Oahumod0$settle[i] = "100"} # self-seeding
  else { 
    Oahumod0$settle[i] = Oahumod0$settle_NEAR_ID[i]}
}

# Oahumod1
for (i in 1:nrow(Oahumod1)) {
  if (Oahumod1$NEAR_FID[i] == Oahumod1$settle_NEAR_ID[i]) {
    Oahumod1$settle[i] = "100"} # self-seeding
  else { 
    Oahumod1$settle[i] = Oahumod1$settle_NEAR_ID[i]}
}

# Oahumod2
for (i in 1:nrow(Oahumod2)) {
  if (Oahumod2$NEAR_FID[i] == Oahumod2$settle_NEAR_ID[i]) {
    Oahumod2$settle[i] = "100"} # self-seeding
  else { 
    Oahumod2$settle[i] = Oahumod2$settle_NEAR_ID[i]}
}

# Oahumod3
for (i in 1:nrow(Oahumod3)) {
  if (Oahumod3$NEAR_FID[i] == Oahumod3$settle_NEAR_ID[i]) {
    Oahumod3$settle[i] = "100"} # self-seeding
  else { 
    Oahumod3$settle[i] = Oahumod3$settle_NEAR_ID[i]}
}

# Oahumod4
for (i in 1:nrow(Oahumod4)) {
  if (Oahumod4$NEAR_FID[i] == Oahumod4$settle_NEAR_ID[i]) {
    Oahumod4$settle[i] = "100"} # self-seeding
  else { 
    Oahumod4$settle[i] = Oahumod4$settle_NEAR_ID[i]}
}

# Oahumod5
for (i in 1:nrow(Oahumod5)) {
  if (Oahumod5$NEAR_FID[i] == Oahumod5$settle_NEAR_ID[i]) {
    Oahumod5$settle[i] = "100"} # self-seeding
  else { 
    Oahumod5$settle[i] = Oahumod5$settle_NEAR_ID[i]}
}

# Oahumod6
for (i in 1:nrow(Oahumod6)) {
  if (Oahumod6$NEAR_FID[i] == Oahumod6$settle_NEAR_ID[i]) {
    Oahumod6$settle[i] = "100"} # self-seeding
  else { 
    Oahumod6$settle[i] = Oahumod6$settle_NEAR_ID[i]}
}

# Oahumod7
for (i in 1:nrow(Oahumod7)) {
  if (Oahumod7$NEAR_FID[i] == Oahumod7$settle_NEAR_ID[i]) {
    Oahumod7$settle[i] = "100"} # self-seeding
  else { 
    Oahumod7$settle[i] = Oahumod7$settle_NEAR_ID[i]}
}


##############################################################
########## MNI: subset by NEAR_FID (polygon segment) ########## 

MNImod0 <- subset(MNImod, MNImod$NEAR_FID == 0)
MNImod1 <- subset(MNImod, MNImod$NEAR_FID == 1)
MNImod2 <- subset(MNImod, MNImod$NEAR_FID == 2)
MNImod3 <- subset(MNImod, MNImod$NEAR_FID == 3)
MNImod4 <- subset(MNImod, MNImod$NEAR_FID == 4)
MNImod5 <- subset(MNImod, MNImod$NEAR_FID == 5)
MNImod6 <- subset(MNImod, MNImod$NEAR_FID == 6)
MNImod7 <- subset(MNImod, MNImod$NEAR_FID == 7)

### Loop through
# MNImod0
for (i in 1:nrow(MNImod0)) {
  if (MNImod0$NEAR_FID[i] == MNImod0$settle_NEAR_ID[i]) {
    MNImod0$settle[i] = "100"} # self-seeding
  else { 
    MNImod0$settle[i] = MNImod0$settle_NEAR_ID[i]}
}

# MNImod1
for (i in 1:nrow(MNImod1)) {
  if (MNImod1$NEAR_FID[i] == MNImod1$settle_NEAR_ID[i]) {
    MNImod1$settle[i] = "100"} # self-seeding
  else { 
    MNImod1$settle[i] = MNImod1$settle_NEAR_ID[i]}
}

# MNImod2
for (i in 1:nrow(MNImod2)) {
  if (MNImod2$NEAR_FID[i] == MNImod2$settle_NEAR_ID[i]) {
    MNImod2$settle[i] = "100"} # self-seeding
  else { 
    MNImod2$settle[i] = MNImod2$settle_NEAR_ID[i]}
}

# MNImod3
for (i in 1:nrow(MNImod3)) {
  if (MNImod3$NEAR_FID[i] == MNImod3$settle_NEAR_ID[i]) {
    MNImod3$settle[i] = "100"} # self-seeding
  else { 
    MNImod3$settle[i] = MNImod3$settle_NEAR_ID[i]}
}

# MNImod4
for (i in 1:nrow(MNImod4)) {
  if (MNImod4$NEAR_FID[i] == MNImod4$settle_NEAR_ID[i]) {
    MNImod4$settle[i] = "100"} # self-seeding
  else { 
    MNImod4$settle[i] = MNImod4$settle_NEAR_ID[i]}
}

# MNImod5
for (i in 1:nrow(MNImod5)) {
  if (MNImod5$NEAR_FID[i] == MNImod5$settle_NEAR_ID[i]) {
    MNImod5$settle[i] = "100"} # self-seeding
  else { 
    MNImod5$settle[i] = MNImod5$settle_NEAR_ID[i]}
}

# MNImod6
for (i in 1:nrow(MNImod6)) {
  if (MNImod6$NEAR_FID[i] == MNImod6$settle_NEAR_ID[i]) {
    MNImod6$settle[i] = "100"} # self-seeding
  else { 
    MNImod6$settle[i] = MNImod6$settle_NEAR_ID[i]}
}

# MNImod7
for (i in 1:nrow(MNImod7)) {
  if (MNImod7$NEAR_FID[i] == MNImod7$settle_NEAR_ID[i]) {
    MNImod7$settle[i] = "100"} # self-seeding
  else { 
    MNImod7$settle[i] = MNImod7$settle_NEAR_ID[i]}
}


#######################################################################
########## BI: subset by NEAR_FID (polygon segment) ########## 

BImod0 <- subset(BImod, BImod$NEAR_FID == 0)
BImod1 <- subset(BImod, BImod$NEAR_FID == 1)
BImod2 <- subset(BImod, BImod$NEAR_FID == 2)
BImod3 <- subset(BImod, BImod$NEAR_FID == 3)
BImod4 <- subset(BImod, BImod$NEAR_FID == 4)
BImod5 <- subset(BImod, BImod$NEAR_FID == 5)
BImod6 <- subset(BImod, BImod$NEAR_FID == 6)
BImod7 <- subset(BImod, BImod$NEAR_FID == 7)

### Loop through
# BImod0
for (i in 1:nrow(BImod0)) {
  if (BImod0$NEAR_FID[i] == BImod0$settle_NEAR_ID[i]) {
    BImod0$settle[i] = "100"} # self-seeding
  else { 
    BImod0$settle[i] = BImod0$settle_NEAR_ID[i]}
}

# BImod1
for (i in 1:nrow(BImod1)) {
  if (BImod1$NEAR_FID[i] == BImod1$settle_NEAR_ID[i]) {
    BImod1$settle[i] = "100"} # self-seeding
  else { 
    BImod1$settle[i] = BImod1$settle_NEAR_ID[i]}
}

# BImod2
for (i in 1:nrow(BImod2)) {
  if (BImod2$NEAR_FID[i] == BImod2$settle_NEAR_ID[i]) {
    BImod2$settle[i] = "100"} # self-seeding
  else { 
    BImod2$settle[i] = BImod2$settle_NEAR_ID[i]}
}

# BImod3
for (i in 1:nrow(BImod3)) {
  if (BImod3$NEAR_FID[i] == BImod3$settle_NEAR_ID[i]) {
    BImod3$settle[i] = "100"} # self-seeding
  else { 
    BImod3$settle[i] = BImod3$settle_NEAR_ID[i]}
}

# BImod4
for (i in 1:nrow(BImod4)) {
  if (BImod4$NEAR_FID[i] == BImod4$settle_NEAR_ID[i]) {
    BImod4$settle[i] = "100"} # self-seeding
  else { 
    BImod4$settle[i] = BImod4$settle_NEAR_ID[i]}
}

# BImod5
for (i in 1:nrow(BImod5)) {
  if (BImod5$NEAR_FID[i] == BImod5$settle_NEAR_ID[i]) {
    BImod5$settle[i] = "100"} # self-seeding
  else { 
    BImod5$settle[i] = BImod5$settle_NEAR_ID[i]}
}

# BImod6
for (i in 1:nrow(BImod6)) {
  if (BImod6$NEAR_FID[i] == BImod6$settle_NEAR_ID[i]) {
    BImod6$settle[i] = "100"} # self-seeding
  else { 
    BImod6$settle[i] = BImod6$settle_NEAR_ID[i]}
}

# BImod7
for (i in 1:nrow(BImod7)) {
  if (BImod7$NEAR_FID[i] == BImod7$settle_NEAR_ID[i]) {
    BImod7$settle[i] = "100"} # self-seeding
  else { 
    BImod7$settle[i] = BImod7$settle_NEAR_ID[i]}
}

#######################################################################

# Calculate probabilities: Kauai
# col 1: NEAR_FID = 0

(nrow(subset(Kauaimod0, Kauaimod0$settle == 100))) / nrow(Kauaimod0) # self

(nrow(subset(Kauaimod0, Kauaimod0$settle == 1))) / nrow(Kauaimod0) # 1

(nrow(subset(Kauaimod0, Kauaimod0$settle == 2))) / nrow(Kauaimod0) # 2

(nrow(subset(Kauaimod0, Kauaimod0$settle == 3))) / nrow(Kauaimod0) # 3

(nrow(subset(Kauaimod0, Kauaimod0$settle == 4))) / nrow(Kauaimod0) # 4

(nrow(subset(Kauaimod0, Kauaimod0$settle == 5))) / nrow(Kauaimod0) # 5

(nrow(subset(Kauaimod0, Kauaimod0$settle == 6))) / nrow(Kauaimod0) # 6

(nrow(subset(Kauaimod0, Kauaimod0$settle == 7))) / nrow(Kauaimod0) # 7

# col 2: NEAR_FID = 1

(nrow(subset(Kauaimod1, Kauaimod1$settle == 0))) / nrow(Kauaimod1) # 0

(nrow(subset(Kauaimod1, Kauaimod1$settle == 100))) / nrow(Kauaimod1) # self

(nrow(subset(Kauaimod1, Kauaimod1$settle == 2))) / nrow(Kauaimod1) # 2

(nrow(subset(Kauaimod1, Kauaimod1$settle == 3))) / nrow(Kauaimod1) # 3

(nrow(subset(Kauaimod1, Kauaimod1$settle == 4))) / nrow(Kauaimod1) # 4

(nrow(subset(Kauaimod1, Kauaimod1$settle == 5))) / nrow(Kauaimod1) # 5

(nrow(subset(Kauaimod1, Kauaimod1$settle == 6))) / nrow(Kauaimod1) # 6

(nrow(subset(Kauaimod1, Kauaimod1$settle == 7))) / nrow(Kauaimod1) # 7

# col 3: NEAR_FID = 2

(nrow(subset(Kauaimod2, Kauaimod2$settle == 0))) / nrow(Kauaimod2) # 0

(nrow(subset(Kauaimod2, Kauaimod2$settle == 1))) / nrow(Kauaimod2) # 1

(nrow(subset(Kauaimod2, Kauaimod2$settle == 100))) / nrow(Kauaimod2) # self

(nrow(subset(Kauaimod2, Kauaimod2$settle == 3))) / nrow(Kauaimod2) # 3

(nrow(subset(Kauaimod2, Kauaimod2$settle == 4))) / nrow(Kauaimod2) # 4

(nrow(subset(Kauaimod2, Kauaimod2$settle == 5))) / nrow(Kauaimod2) # 5

(nrow(subset(Kauaimod2, Kauaimod2$settle == 6))) / nrow(Kauaimod2) # 6

(nrow(subset(Kauaimod2, Kauaimod2$settle == 7))) / nrow(Kauaimod2) # 7

# col 4: NEAR_FID = 3

(nrow(subset(Kauaimod3, Kauaimod3$settle == 0))) / nrow(Kauaimod3) # 0

(nrow(subset(Kauaimod3, Kauaimod3$settle == 1))) / nrow(Kauaimod3) # 1

(nrow(subset(Kauaimod3, Kauaimod3$settle == 2))) / nrow(Kauaimod3) # 2

(nrow(subset(Kauaimod3, Kauaimod3$settle == 100))) / nrow(Kauaimod3) # self

(nrow(subset(Kauaimod3, Kauaimod3$settle == 4))) / nrow(Kauaimod3) # 4

(nrow(subset(Kauaimod3, Kauaimod3$settle == 5))) / nrow(Kauaimod3) # 5

(nrow(subset(Kauaimod3, Kauaimod3$settle == 6))) / nrow(Kauaimod3) # 6

(nrow(subset(Kauaimod3, Kauaimod3$settle == 7))) / nrow(Kauaimod3) # 7

# col 5: NEAR_FID = 4

(nrow(subset(Kauaimod4, Kauaimod4$settle == 0))) / nrow(Kauaimod4) # 0

(nrow(subset(Kauaimod4, Kauaimod4$settle == 1))) / nrow(Kauaimod4) # 1

(nrow(subset(Kauaimod4, Kauaimod4$settle == 2))) / nrow(Kauaimod4) # 2

(nrow(subset(Kauaimod4, Kauaimod4$settle == 3))) / nrow(Kauaimod4) # 3

(nrow(subset(Kauaimod4, Kauaimod4$settle == 100))) / nrow(Kauaimod4) # self

(nrow(subset(Kauaimod4, Kauaimod4$settle == 5))) / nrow(Kauaimod4) # 5

(nrow(subset(Kauaimod4, Kauaimod4$settle == 6))) / nrow(Kauaimod4) # 6

(nrow(subset(Kauaimod4, Kauaimod4$settle == 7))) / nrow(Kauaimod4) # 7

# col 6: NEAR_FID = 5

(nrow(subset(Kauaimod5, Kauaimod5$settle == 0))) / nrow(Kauaimod5) # 0

(nrow(subset(Kauaimod5, Kauaimod5$settle == 1))) / nrow(Kauaimod5) # 1

(nrow(subset(Kauaimod5, Kauaimod5$settle == 2))) / nrow(Kauaimod5) # 2

(nrow(subset(Kauaimod5, Kauaimod5$settle == 3))) / nrow(Kauaimod5) # 3

(nrow(subset(Kauaimod5, Kauaimod5$settle == 4))) / nrow(Kauaimod5) # 4

(nrow(subset(Kauaimod5, Kauaimod5$settle == 100))) / nrow(Kauaimod5) # self

(nrow(subset(Kauaimod5, Kauaimod5$settle == 6))) / nrow(Kauaimod5) # 6

(nrow(subset(Kauaimod5, Kauaimod5$settle == 7))) / nrow(Kauaimod5) # 7

# col 7: NEAR_FID = 6

(nrow(subset(Kauaimod6, Kauaimod6$settle == 0))) / nrow(Kauaimod6) # 0

(nrow(subset(Kauaimod6, Kauaimod6$settle == 1))) / nrow(Kauaimod6) # 1

(nrow(subset(Kauaimod6, Kauaimod6$settle == 2))) / nrow(Kauaimod6) # 2

(nrow(subset(Kauaimod6, Kauaimod6$settle == 3))) / nrow(Kauaimod6) # 3

(nrow(subset(Kauaimod6, Kauaimod6$settle == 4))) / nrow(Kauaimod6) # 4

(nrow(subset(Kauaimod6, Kauaimod6$settle == 5))) / nrow(Kauaimod6) # 5

(nrow(subset(Kauaimod6, Kauaimod6$settle == 100))) / nrow(Kauaimod6) # self

(nrow(subset(Kauaimod6, Kauaimod6$settle == 7))) / nrow(Kauaimod6) # 7

# col 8: NEAR_FID = 7

(nrow(subset(Kauaimod7, Kauaimod7$settle == 0))) / nrow(Kauaimod7) # 0

(nrow(subset(Kauaimod7, Kauaimod7$settle == 1))) / nrow(Kauaimod7) # 1

(nrow(subset(Kauaimod7, Kauaimod7$settle == 2))) / nrow(Kauaimod7) # 2

(nrow(subset(Kauaimod7, Kauaimod7$settle == 3))) / nrow(Kauaimod7) # 3

(nrow(subset(Kauaimod7, Kauaimod7$settle == 4))) / nrow(Kauaimod7) # 4

(nrow(subset(Kauaimod7, Kauaimod7$settle == 5))) / nrow(Kauaimod7) # 5

(nrow(subset(Kauaimod7, Kauaimod7$settle == 6))) / nrow(Kauaimod7) # 6

(nrow(subset(Kauaimod7, Kauaimod7$settle == 100))) / nrow(Kauaimod7) # self

#######################################################################

# Calculate probabilities: Oahu
# col 1: NEAR_FID = 0

(nrow(subset(Oahumod0, Oahumod0$settle == 100))) / nrow(Oahumod0) # self

(nrow(subset(Oahumod0, Oahumod0$settle == 1))) / nrow(Oahumod0) # 1

(nrow(subset(Oahumod0, Oahumod0$settle == 2))) / nrow(Oahumod0) # 2

(nrow(subset(Oahumod0, Oahumod0$settle == 3))) / nrow(Oahumod0) # 3

(nrow(subset(Oahumod0, Oahumod0$settle == 4))) / nrow(Oahumod0) # 4

(nrow(subset(Oahumod0, Oahumod0$settle == 5))) / nrow(Oahumod0) # 5

(nrow(subset(Oahumod0, Oahumod0$settle == 6))) / nrow(Oahumod0) # 6

(nrow(subset(Oahumod0, Oahumod0$settle == 7))) / nrow(Oahumod0) # 7

# col 2: NEAR_FID = 1

(nrow(subset(Oahumod1, Oahumod1$settle == 0))) / nrow(Oahumod1) # 0

(nrow(subset(Oahumod1, Oahumod1$settle == 100))) / nrow(Oahumod1) # self

(nrow(subset(Oahumod1, Oahumod1$settle == 2))) / nrow(Oahumod1) # 2

(nrow(subset(Oahumod1, Oahumod1$settle == 3))) / nrow(Oahumod1) # 3

(nrow(subset(Oahumod1, Oahumod1$settle == 4))) / nrow(Oahumod1) # 4

(nrow(subset(Oahumod1, Oahumod1$settle == 5))) / nrow(Oahumod1) # 5

(nrow(subset(Oahumod1, Oahumod1$settle == 6))) / nrow(Oahumod1) # 6

(nrow(subset(Oahumod1, Oahumod1$settle == 7))) / nrow(Oahumod1) # 7

# col 3: NEAR_FID = 2

(nrow(subset(Oahumod2, Oahumod2$settle == 0))) / nrow(Oahumod2) # 0

(nrow(subset(Oahumod2, Oahumod2$settle == 1))) / nrow(Oahumod2) # 1

(nrow(subset(Oahumod2, Oahumod2$settle == 100))) / nrow(Oahumod2) # self

(nrow(subset(Oahumod2, Oahumod2$settle == 3))) / nrow(Oahumod2) # 3

(nrow(subset(Oahumod2, Oahumod2$settle == 4))) / nrow(Oahumod2) # 4

(nrow(subset(Oahumod2, Oahumod2$settle == 5))) / nrow(Oahumod2) # 5

(nrow(subset(Oahumod2, Oahumod2$settle == 6))) / nrow(Oahumod2) # 6

(nrow(subset(Oahumod2, Oahumod2$settle == 7))) / nrow(Oahumod2) # 7

# col 4: NEAR_FID = 3

(nrow(subset(Oahumod3, Oahumod3$settle == 0))) / nrow(Oahumod3) # 0

(nrow(subset(Oahumod3, Oahumod3$settle == 1))) / nrow(Oahumod3) # 1

(nrow(subset(Oahumod3, Oahumod3$settle == 2))) / nrow(Oahumod3) # 2

(nrow(subset(Oahumod3, Oahumod3$settle == 100))) / nrow(Oahumod3) # self

(nrow(subset(Oahumod3, Oahumod3$settle == 4))) / nrow(Oahumod3) # 4

(nrow(subset(Oahumod3, Oahumod3$settle == 5))) / nrow(Oahumod3) # 5

(nrow(subset(Oahumod3, Oahumod3$settle == 6))) / nrow(Oahumod3) # 6

(nrow(subset(Oahumod3, Oahumod3$settle == 7))) / nrow(Oahumod3) # 7

# col 5: NEAR_FID = 4

(nrow(subset(Oahumod4, Oahumod4$settle == 0))) / nrow(Oahumod4) # 0

(nrow(subset(Oahumod4, Oahumod4$settle == 1))) / nrow(Oahumod4) # 1

(nrow(subset(Oahumod4, Oahumod4$settle == 2))) / nrow(Oahumod4) # 2

(nrow(subset(Oahumod4, Oahumod4$settle == 3))) / nrow(Oahumod4) # 3

(nrow(subset(Oahumod4, Oahumod4$settle == 100))) / nrow(Oahumod4) # self

(nrow(subset(Oahumod4, Oahumod4$settle == 5))) / nrow(Oahumod4) # 5

(nrow(subset(Oahumod4, Oahumod4$settle == 6))) / nrow(Oahumod4) # 6

(nrow(subset(Oahumod4, Oahumod4$settle == 7))) / nrow(Oahumod4) # 7

# col 6: NEAR_FID = 5

(nrow(subset(Oahumod5, Oahumod5$settle == 0))) / nrow(Oahumod5) # 0

(nrow(subset(Oahumod5, Oahumod5$settle == 1))) / nrow(Oahumod5) # 1

(nrow(subset(Oahumod5, Oahumod5$settle == 2))) / nrow(Oahumod5) # 2

(nrow(subset(Oahumod5, Oahumod5$settle == 3))) / nrow(Oahumod5) # 3

(nrow(subset(Oahumod5, Oahumod5$settle == 4))) / nrow(Oahumod5) # 4

(nrow(subset(Oahumod5, Oahumod5$settle == 100))) / nrow(Oahumod5) # self

(nrow(subset(Oahumod5, Oahumod5$settle == 6))) / nrow(Oahumod5) # 6

(nrow(subset(Oahumod5, Oahumod5$settle == 7))) / nrow(Oahumod5) # 7

# col 7: NEAR_FID = 6

(nrow(subset(Oahumod6, Oahumod6$settle == 0))) / nrow(Oahumod6) # 0

(nrow(subset(Oahumod6, Oahumod6$settle == 1))) / nrow(Oahumod6) # 1

(nrow(subset(Oahumod6, Oahumod6$settle == 2))) / nrow(Oahumod6) # 2

(nrow(subset(Oahumod6, Oahumod6$settle == 3))) / nrow(Oahumod6) # 3

(nrow(subset(Oahumod6, Oahumod6$settle == 4))) / nrow(Oahumod6) # 4

(nrow(subset(Oahumod6, Oahumod6$settle == 5))) / nrow(Oahumod6) # 5

(nrow(subset(Oahumod6, Oahumod6$settle == 100))) / nrow(Oahumod6) # self

(nrow(subset(Oahumod6, Oahumod6$settle == 7))) / nrow(Oahumod6) # 7

# col 8: NEAR_FID = 7

(nrow(subset(Oahumod7, Oahumod7$settle == 0))) / nrow(Oahumod7) # 0

(nrow(subset(Oahumod7, Oahumod7$settle == 1))) / nrow(Oahumod7) # 1

(nrow(subset(Oahumod7, Oahumod7$settle == 2))) / nrow(Oahumod7) # 2

(nrow(subset(Oahumod7, Oahumod7$settle == 3))) / nrow(Oahumod7) # 3

(nrow(subset(Oahumod7, Oahumod7$settle == 4))) / nrow(Oahumod7) # 4

(nrow(subset(Oahumod7, Oahumod7$settle == 5))) / nrow(Oahumod7) # 5

(nrow(subset(Oahumod7, Oahumod7$settle == 6))) / nrow(Oahumod7) # 6

(nrow(subset(Oahumod7, Oahumod7$settle == 100))) / nrow(Oahumod7) # self

#######################################################################


# Calculate probabilities: MNI
# col 1: NEAR_FID = 0

(nrow(subset(MNImod0, MNImod0$settle == 100))) / nrow(MNImod0) # self

(nrow(subset(MNImod0, MNImod0$settle == 1))) / nrow(MNImod0) # 1

(nrow(subset(MNImod0, MNImod0$settle == 2))) / nrow(MNImod0) # 2

(nrow(subset(MNImod0, MNImod0$settle == 3))) / nrow(MNImod0) # 3

(nrow(subset(MNImod0, MNImod0$settle == 4))) / nrow(MNImod0) # 4

(nrow(subset(MNImod0, MNImod0$settle == 5))) / nrow(MNImod0) # 5

(nrow(subset(MNImod0, MNImod0$settle == 6))) / nrow(MNImod0) # 6

(nrow(subset(MNImod0, MNImod0$settle == 7))) / nrow(MNImod0) # 7

# col 2: NEAR_FID = 1

(nrow(subset(MNImod1, MNImod1$settle == 0))) / nrow(MNImod1) # 0

(nrow(subset(MNImod1, MNImod1$settle == 100))) / nrow(MNImod1) # self

(nrow(subset(MNImod1, MNImod1$settle == 2))) / nrow(MNImod1) # 2

(nrow(subset(MNImod1, MNImod1$settle == 3))) / nrow(MNImod1) # 3

(nrow(subset(MNImod1, MNImod1$settle == 4))) / nrow(MNImod1) # 4

(nrow(subset(MNImod1, MNImod1$settle == 5))) / nrow(MNImod1) # 5

(nrow(subset(MNImod1, MNImod1$settle == 6))) / nrow(MNImod1) # 6

(nrow(subset(MNImod1, MNImod1$settle == 7))) / nrow(MNImod1) # 7

# col 3: NEAR_FID = 2

(nrow(subset(MNImod2, MNImod2$settle == 0))) / nrow(MNImod2) # 0

(nrow(subset(MNImod2, MNImod2$settle == 1))) / nrow(MNImod2) # 1

(nrow(subset(MNImod2, MNImod2$settle == 100))) / nrow(MNImod2) # self

(nrow(subset(MNImod2, MNImod2$settle == 3))) / nrow(MNImod2) # 3

(nrow(subset(MNImod2, MNImod2$settle == 4))) / nrow(MNImod2) # 4

(nrow(subset(MNImod2, MNImod2$settle == 5))) / nrow(MNImod2) # 5

(nrow(subset(MNImod2, MNImod2$settle == 6))) / nrow(MNImod2) # 6

(nrow(subset(MNImod2, MNImod2$settle == 7))) / nrow(MNImod2) # 7

# col 4: NEAR_FID = 3

(nrow(subset(MNImod3, MNImod3$settle == 0))) / nrow(MNImod3) # 0

(nrow(subset(MNImod3, MNImod3$settle == 1))) / nrow(MNImod3) # 1

(nrow(subset(MNImod3, MNImod3$settle == 2))) / nrow(MNImod3) # 2

(nrow(subset(MNImod3, MNImod3$settle == 100))) / nrow(MNImod3) # self

(nrow(subset(MNImod3, MNImod3$settle == 4))) / nrow(MNImod3) # 4

(nrow(subset(MNImod3, MNImod3$settle == 5))) / nrow(MNImod3) # 5

(nrow(subset(MNImod3, MNImod3$settle == 6))) / nrow(MNImod3) # 6

(nrow(subset(MNImod3, MNImod3$settle == 7))) / nrow(MNImod3) # 7

# col 5: NEAR_FID = 4

(nrow(subset(MNImod4, MNImod4$settle == 0))) / nrow(MNImod4) # 0

(nrow(subset(MNImod4, MNImod4$settle == 1))) / nrow(MNImod4) # 1

(nrow(subset(MNImod4, MNImod4$settle == 2))) / nrow(MNImod4) # 2

(nrow(subset(MNImod4, MNImod4$settle == 3))) / nrow(MNImod4) # 3

(nrow(subset(MNImod4, MNImod4$settle == 100))) / nrow(MNImod4) # self

(nrow(subset(MNImod4, MNImod4$settle == 5))) / nrow(MNImod4) # 5

(nrow(subset(MNImod4, MNImod4$settle == 6))) / nrow(MNImod4) # 6

(nrow(subset(MNImod4, MNImod4$settle == 7))) / nrow(MNImod4) # 7

# col 6: NEAR_FID = 5

(nrow(subset(MNImod5, MNImod5$settle == 0))) / nrow(MNImod5) # 0

(nrow(subset(MNImod5, MNImod5$settle == 1))) / nrow(MNImod5) # 1

(nrow(subset(MNImod5, MNImod5$settle == 2))) / nrow(MNImod5) # 2

(nrow(subset(MNImod5, MNImod5$settle == 3))) / nrow(MNImod5) # 3

(nrow(subset(MNImod5, MNImod5$settle == 4))) / nrow(MNImod5) # 4

(nrow(subset(MNImod5, MNImod5$settle == 100))) / nrow(MNImod5) # self

(nrow(subset(MNImod5, MNImod5$settle == 6))) / nrow(MNImod5) # 6

(nrow(subset(MNImod5, MNImod5$settle == 7))) / nrow(MNImod5) # 7

# col 7: NEAR_FID = 6

(nrow(subset(MNImod6, MNImod6$settle == 0))) / nrow(MNImod6) # 0

(nrow(subset(MNImod6, MNImod6$settle == 1))) / nrow(MNImod6) # 1

(nrow(subset(MNImod6, MNImod6$settle == 2))) / nrow(MNImod6) # 2

(nrow(subset(MNImod6, MNImod6$settle == 3))) / nrow(MNImod6) # 3

(nrow(subset(MNImod6, MNImod6$settle == 4))) / nrow(MNImod6) # 4

(nrow(subset(MNImod6, MNImod6$settle == 5))) / nrow(MNImod6) # 5

(nrow(subset(MNImod6, MNImod6$settle == 100))) / nrow(MNImod6) # self

(nrow(subset(MNImod6, MNImod6$settle == 7))) / nrow(MNImod6) # 7

# col 8: NEAR_FID = 7

(nrow(subset(MNImod7, MNImod7$settle == 0))) / nrow(MNImod7) # 0

(nrow(subset(MNImod7, MNImod7$settle == 1))) / nrow(MNImod7) # 1

(nrow(subset(MNImod7, MNImod7$settle == 2))) / nrow(MNImod7) # 2

(nrow(subset(MNImod7, MNImod7$settle == 3))) / nrow(MNImod7) # 3

(nrow(subset(MNImod7, MNImod7$settle == 4))) / nrow(MNImod7) # 4

(nrow(subset(MNImod7, MNImod7$settle == 5))) / nrow(MNImod7) # 5

(nrow(subset(MNImod7, MNImod7$settle == 6))) / nrow(MNImod7) # 6

(nrow(subset(MNImod7, MNImod7$settle == 100))) / nrow(MNImod7) # self

#######################################################################

# Calculate probabilities: BI
# col 1: NEAR_FID = 0

(nrow(subset(BImod0, BImod0$settle == 100))) / nrow(BImod0) # self

(nrow(subset(BImod0, BImod0$settle == 1))) / nrow(BImod0) # 1

(nrow(subset(BImod0, BImod0$settle == 2))) / nrow(BImod0) # 2

(nrow(subset(BImod0, BImod0$settle == 3))) / nrow(BImod0) # 3

(nrow(subset(BImod0, BImod0$settle == 4))) / nrow(BImod0) # 4

(nrow(subset(BImod0, BImod0$settle == 5))) / nrow(BImod0) # 5

(nrow(subset(BImod0, BImod0$settle == 6))) / nrow(BImod0) # 6

(nrow(subset(BImod0, BImod0$settle == 7))) / nrow(BImod0) # 7

# col 2: NEAR_FID = 1

(nrow(subset(BImod1, BImod1$settle == 0))) / nrow(BImod1) # 0

(nrow(subset(BImod1, BImod1$settle == 100))) / nrow(BImod1) # self

(nrow(subset(BImod1, BImod1$settle == 2))) / nrow(BImod1) # 2

(nrow(subset(BImod1, BImod1$settle == 3))) / nrow(BImod1) # 3

(nrow(subset(BImod1, BImod1$settle == 4))) / nrow(BImod1) # 4

(nrow(subset(BImod1, BImod1$settle == 5))) / nrow(BImod1) # 5

(nrow(subset(BImod1, BImod1$settle == 6))) / nrow(BImod1) # 6

(nrow(subset(BImod1, BImod1$settle == 7))) / nrow(BImod1) # 7

# col 3: NEAR_FID = 2

(nrow(subset(BImod2, BImod2$settle == 0))) / nrow(BImod2) # 0

(nrow(subset(BImod2, BImod2$settle == 1))) / nrow(BImod2) # 1

(nrow(subset(BImod2, BImod2$settle == 100))) / nrow(BImod2) # self

(nrow(subset(BImod2, BImod2$settle == 3))) / nrow(BImod2) # 3

(nrow(subset(BImod2, BImod2$settle == 4))) / nrow(BImod2) # 4

(nrow(subset(BImod2, BImod2$settle == 5))) / nrow(BImod2) # 5

(nrow(subset(BImod2, BImod2$settle == 6))) / nrow(BImod2) # 6

(nrow(subset(BImod2, BImod2$settle == 7))) / nrow(BImod2) # 7

# col 4: NEAR_FID = 3

(nrow(subset(BImod3, BImod3$settle == 0))) / nrow(BImod3) # 0

(nrow(subset(BImod3, BImod3$settle == 1))) / nrow(BImod3) # 1

(nrow(subset(BImod3, BImod3$settle == 2))) / nrow(BImod3) # 2

(nrow(subset(BImod3, BImod3$settle == 100))) / nrow(BImod3) # self

(nrow(subset(BImod3, BImod3$settle == 4))) / nrow(BImod3) # 4

(nrow(subset(BImod3, BImod3$settle == 5))) / nrow(BImod3) # 5

(nrow(subset(BImod3, BImod3$settle == 6))) / nrow(BImod3) # 6

(nrow(subset(BImod3, BImod3$settle == 7))) / nrow(BImod3) # 7

# col 5: NEAR_FID = 4

(nrow(subset(BImod4, BImod4$settle == 0))) / nrow(BImod4) # 0

(nrow(subset(BImod4, BImod4$settle == 1))) / nrow(BImod4) # 1

(nrow(subset(BImod4, BImod4$settle == 2))) / nrow(BImod4) # 2

(nrow(subset(BImod4, BImod4$settle == 3))) / nrow(BImod4) # 3

(nrow(subset(BImod4, BImod4$settle == 100))) / nrow(BImod4) # self

(nrow(subset(BImod4, BImod4$settle == 5))) / nrow(BImod4) # 5

(nrow(subset(BImod4, BImod4$settle == 6))) / nrow(BImod4) # 6

(nrow(subset(BImod4, BImod4$settle == 7))) / nrow(BImod4) # 7

# col 6: NEAR_FID = 5

(nrow(subset(BImod5, BImod5$settle == 0))) / nrow(BImod5) # 0

(nrow(subset(BImod5, BImod5$settle == 1))) / nrow(BImod5) # 1

(nrow(subset(BImod5, BImod5$settle == 2))) / nrow(BImod5) # 2

(nrow(subset(BImod5, BImod5$settle == 3))) / nrow(BImod5) # 3

(nrow(subset(BImod5, BImod5$settle == 4))) / nrow(BImod5) # 4

(nrow(subset(BImod5, BImod5$settle == 100))) / nrow(BImod5) # self

(nrow(subset(BImod5, BImod5$settle == 6))) / nrow(BImod5) # 6

(nrow(subset(BImod5, BImod5$settle == 7))) / nrow(BImod5) # 7

# col 7: NEAR_FID = 6

(nrow(subset(BImod6, BImod6$settle == 0))) / nrow(BImod6) # 0

(nrow(subset(BImod6, BImod6$settle == 1))) / nrow(BImod6) # 1

(nrow(subset(BImod6, BImod6$settle == 2))) / nrow(BImod6) # 2

(nrow(subset(BImod6, BImod6$settle == 3))) / nrow(BImod6) # 3

(nrow(subset(BImod6, BImod6$settle == 4))) / nrow(BImod6) # 4

(nrow(subset(BImod6, BImod6$settle == 5))) / nrow(BImod6) # 5

(nrow(subset(BImod6, BImod6$settle == 100))) / nrow(BImod6) # self

(nrow(subset(BImod6, BImod6$settle == 7))) / nrow(BImod6) # 7

# col 8: NEAR_FID = 7

(nrow(subset(BImod7, BImod7$settle == 0))) / nrow(BImod7) # 0

(nrow(subset(BImod7, BImod7$settle == 1))) / nrow(BImod7) # 1

(nrow(subset(BImod7, BImod7$settle == 2))) / nrow(BImod7) # 2

(nrow(subset(BImod7, BImod7$settle == 3))) / nrow(BImod7) # 3

(nrow(subset(BImod7, BImod7$settle == 4))) / nrow(BImod7) # 4

(nrow(subset(BImod7, BImod7$settle == 5))) / nrow(BImod7) # 5

(nrow(subset(BImod7, BImod7$settle == 6))) / nrow(BImod7) # 6

(nrow(subset(BImod7, BImod7$settle == 100))) / nrow(BImod7) # self
