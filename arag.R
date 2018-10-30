# setwd('C:/Users/linds/Downloads')
EJA <- read.csv("EJA.csv")

library(raster)
library(rgdal)
library(tmap)
library(gstat) 
library(sp)   

EJA <- SpatialPoints(EJA) # this is your spatial points data frame
head(EJA)
EJA$WGS_Lat <- EJA$lat - 180
EJA$WGS_Long <- EJA$long - 180

# Create an empty grid; n = number of cells
gr <- as.data.frame(spsample(EJA, "regular", n  = 20000))
names(gr) <- c("X", "Y")
coordinates(gr) <- c("X", "Y")
gridded(gr) <- TRUE  
fullgrid(gr) <- TRUE  # Create SpatialGrid object

# Interpolate the grid cells using a power value of 2 
EJA.idw <- idw(Arag ~ 1, EJA, newdata = gr, idp = 2.0)

# Convert to raster
r <- raster(EJA.idw)

# Plot
tm_shape(r) + 
  tm_raster(n = 12, palette = "Blues", # n = 10 may be better
            title = "Aragonite \n concentration(units here)") + 
  tm_legend(legend.outside = TRUE)