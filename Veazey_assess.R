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
plot(bv$nodule_eval_tested, bv$ov16_eval_tested) # Checking num. tested per eval. method
bv$avprev <- apply(bvsub, 1, mean, na.rm = TRUE) # Average prev data; equal weight to both methods; NAs assigned when there is no data for either eval method

###### Part 1b ######

summary(bv$avprev) # Basic descriptive stats for averaged prevalence metric
hist(bv$nodule_prev_base)
hist(bv$avprev)
wilcox.test(bv$nodule_prev_base, bv$avprev) # Two-sided Wilcoxon test

# Reshape the data into tidy format for plotting
library(tidyr)
bvsub <- bv[, c(3, 9, 18)]
bvNew <- bvsub %>% gather(attribute, value, -admin2id)
head(bvNew)
bvNew$admin2id <- as.character(bvNew$admin2id)
# Plot mean regional (admin2id) nodule_prev_base v. avprev
ggplot(bvNew, aes(x = admin2id, y = value)) + stat_summary(fun.y ='mean', geom = 'bar', position = 'dodge', aes(fill = attribute)) + labs(title = 'Baseline and averaged river blindness prevalence in Burkina Faso, 1995-2005', x = 'Regional ID', y = 'Proportional prevalence') + scale_fill_manual(values = c('coral', 'navy'), name = 'Evaluation period', labels = c('2004-2005', 'Baseline: 1995-1998')) + theme(plot.title = element_text(hjust = 0.5))

###### Part 1c ######

# Second plot: regional nodule_prev_base v. nodule_eval_prev & ov16_eval_prev
bvsub2 <- bv[, c(3, 9, 13, 16)]
bvNew2 <- bvsub2 %>% gather(attribute, value, -admin2id)
head(bvNew2)
bvNew2$admin2id <- as.character(bvNew2$admin2id)
ggplot(bvNew2, aes(x = admin2id, y = value)) + stat_summary(fun.y ='mean', geom = 'bar', position = 'dodge', aes(fill = attribute)) + labs(title = 'Baseline and updated river blindness prevalence in Burkina Faso, 1995-2005', x = 'Regional ID', y = 'Proportional prevalence') + scale_fill_manual(values = c('skyblue', 'navy', 'forestgreen'), name = 'Evaluation period', labels = c('2004-2005 (nodules)', 'Baseline: 1995-1998 (nodules)', '2004-2005 (antibodies)')) + theme(plot.title = element_text(hjust = 0.5))

# Summary stats for baseline v. eval. data (2 types)
summary(bv$nodule_prev_base)
summary(bv$nodule_eval_prev)
summary(bv$ov16_eval_prev)

###### Part 1e ######

# Write function to simulate disease status for the population based on 2004-2005 data; model structure adapted from https://github.com/eugejoh/SIR-interact 
library(deSolve) # package to help solve differential eqns
library(ggplot2)

SIR.model <- function(t, b, g){
  init <- c(S = .4554, I = .3313, R = .2133) # Avg. 33.13% measured infected; 54.46% (baseline nodule prev) - 33.31% = 21.33% recovered; 1 - 21.33 - 33.13 = 45.54% susceptible
  params <- c(beta = b, gamma= g)
  time <- seq(0, t ,by = t/(2*length(1:t)))
  eqn <- function(time, state, params){
    with(as.list(c(state, params)),{
      dS <- -beta*S*I
      dI <- beta*S*I-gamma*I
      dR <- gamma*I
      return(list(c(dS,dI,dR)))})}
  vals <- ode(y = init,times = time,eqn,parms = params)
  vals.df <- as.data.frame(vals)
  title <- bquote('SIR Model: onchocerciasis prevalence 2004-2005')
subtitle <- bquote(list(beta ==.(params[1]), ~gamma ==.(params[2])))
res <- ggplot(vals.df, aes(x = time)) +
  ggtitle(bquote(atop(bold(.(title)), atop(bold(.(subtitle)))))) +
  geom_line(aes(y = S, color = 'Susceptible')) +
  geom_line(aes(y = I, color = 'Infected')) +
  geom_line(aes(y = R, color = 'Recovered')) +
  ylab(label = 'Proportion of population') +
  xlab(label = 'Time (days)') +
  theme(legend.justification = c(1,0), legend.position = c(1,0)) +
  theme(legend.title = element_text(size = 12, hjust = 0.5), plot.title = element_text(hjust = 0.5),
        legend.background = element_rect(fill='#FFFFFF', size = 0.5, linetype = 'solid'),
        legend.text = element_text(size = 10),
        legend.key = element_rect(colour = '#FFFFFF', fill = '#C2C2C2', size = 0.25, linetype = 'solid')) +
  scale_colour_manual('Onchocersiasis: health status',
                      breaks = c('Susceptible', 'Infected', 'Recovered'),
                      values = c('red', 'navy', 'forestgreen'))
print(res)
}

SIR.model(720, 0.0007, 1/3650) # Run for 2 years (720 days), beta = c*p = 0.1*0.007 = 0.0007, recovery time = 1/3650 days (10 yrs)

#######################################################################################################
###### Part 2, Q2 ######
# Plot 1: pinpoint villages that have shown an increase since mid-program monitoring (2003)
names(mda)[names(mda) == 'ADMIN2ID'] = 'admin2id'
bvmda <- merge(bv, mda, by = 'admin2id') # Note- only 34 unique IDs in mda
# Subset bvmda to cov-only df (temp)
covsub <- bvmda[,22:26]
# Sum cov values 
covsub$covsum <- rowSums(covsub, na.rm = TRUE)
# Count number of non-NAs per row per df
covsub$na_count <- apply(covsub, 1, function(x) sum(!is.na(x) - 1))
covsub$non_na_count <- 5 - covsub$na_count 
# Calculate mean cov per point and merge
covmn <- transform(covsub, covmn = covsum/non_na_count)
bvmda <- cbind(bvmda, covmn$covmn)
names(bvmda)[names(bvmda) == 'covmn$covmn'] = 'COV_MN'
# Merge mid program monitoring data with other file based on village_id
all <- merge(bvmda, mon, by = 'village_id') # 82 rows
# Find villages that have shown an increase in avg prev from 2003 - 2005
all$modchange <- all$avprev - all$skin_prev_monitor

# Plot 2 is interpolation in ArcGis using avprev

# Plot 3: Color matrix based on effort and effectiveness metrics
# For loop to adjust COV_MN vals
for (i in 1:nrow(bvmda)) {
  if (bvmda$vector_01[i] == 2) {
    bvmda$COV_MN_ADJ[i] = bvmda$COV_MN[i] - 10}  
  else { 
    if (bvmda$vector_01[i] == 1) {
      bvmda$COV_MN_ADJ[i] = bvmda$COV_MN[i] + 10}}} 
    
# For loop to assign "effort" rank based on adjusted (account for vector prog) cov quantiles
quantile(bvmda$COV_MN_ADJ)
#    0%   25%   50%   75%  100% 
#  64.4  70.6  87.0  90.4 100.0 
for (i in 1:nrow(bvmda)) {
  if (bvmda$COV_MN_ADJ[i] < 70.6) {
    bvmda$effortRank[i] = 1}  
  else { 
    if (bvmda$COV_MN_ADJ[i] < 90.4 && bvmda$COV_MN_ADJ[i] >= 70.6) {
      bvmda$effortRank[i] = 2}  
    else { 
      if (bvmda$COV_MN_ADJ[i] >= 90.4) {
        bvmda$effortRank[i] = 3}}}}

bvmda$effortRank <- as.numeric(bvmda$effortRank)

# For loop to assign combined effort and effectiveness rank based on adjusted (account for vector prog) cov quantiles
quantile(bvmda$avprev, na.rm=T)
#        0%       25%       50%       75%      100% 
# 0.0099010 0.1841305 0.2515845 0.4675766 0.8709677

sub <- bvmda[ ,c(3:4, 18, 29)]
sub <- na.omit(sub) # 328 rows

for (i in 1:nrow(sub)) {
  if (sub$avprev[i] >= 0.4675766 && sub$effortRank[i] == 1) { # bottom left
    sub$comRank[i] <- 1}  
  else { 
    if (sub$avprev[i] >= 0.1841305 && sub$avprev[i] < 0.4675766 && sub$effortRank[i] == 1) { # bottom middle
      sub$comRank[i] <- 2}  
    else { 
      if (sub$avprev[i] < 0.1841305 && sub$effortRank[i] == 1) { # bottom right
        sub$comRank[i] <- 3}
      else {
        if (sub$avprev[i] >= 0.4675766 && sub$effortRank[i] == 2) { # center left
          sub$comRank[i] <- 4}  
        else { 
          if (sub$avprev[i] >= 0.1841305 && sub$avprev[i] < 0.4675766 && sub$effortRank[i] == 2) { # center middle
            sub$comRank[i] <- 5}  
          else { 
            if (sub$avprev[i] < 0.1841305 && sub$effortRank[i] == 2) { # center right
              sub$comRank[i] <- 6}
            else {
            if (sub$avprev[i] >= 0.4675766 && sub$effortRank[i] == 3) { # top left
              sub$comRank[i] <- 7}  
            else { 
              if (sub$avprev[i] >= 0.1841305 && sub$avprev[i] < 0.4675766 && sub$effortRank[i] == 3) { # top middle
                sub$comRank[i] <- 8}  
              else { 
                if (sub$avprev[i] < 0.1841305 && sub$effortRank[i] == 3) { # top right
                  sub$comRank[i] <- 9}
                else {
                  sub$comRank[i] <- NA 
                }}}}}}}}}}

write.csv(sub, 'merge.csv')