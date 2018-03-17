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
# Also want to plot mean regional (admin2id) nodule_prev base v. avprev

###### Part 1c ######


###### Part 1e ######
# Write function to simulate disease status for the population based on 2004-2005 data 
require(deSolve) # package to help solve differential eqns
SIR.model <- function(t, b, g) {
  init <- c(S = 1-1e-9, I = 1e-9, R = 0) # Everyone is S (susceptible), infection (I) = avg. prev. in 2004 survey, recovery = 2004 prev-base prev
  params <- c(beta = b, gamma = g) # transmission and recovery params
  time <- seq(0, t, by = t/(2*length(1:t))) }
  
eqn <- function(time, state, params) {
    with(as.list(c(state, params)), {
      dS <- -beta*S*I
      dI <- beta*S*I-gamma*I
      dR <- gamma*I
      return(list(c(dS,dI,dR))) } ) }

# Save output as df
output <- ode(y = init, times = time, eqn, parms = params)
df <- as.data.frame(output)

  
#######################################################################################################
###### Part 2, Q1a ######

###### Part 2, Q1b ######

###### Part 2, Q2 ######
