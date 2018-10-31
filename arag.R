# IDW: http://pro.arcgis.com/en/pro-app/help/analysis/geostatistical-analyst/how-inverse-distance-weighted-interpolation-works.htm
# tmap vignette: https://cran.r-project.org/web/packages/tmap/tmap.pdf
# setwd()
EJA <- read.csv('EJA.csv')

library(raster)
library(rgdal)
library(tmap)
library(gstat) 
library(sp)   

head(EJA)
EJA$long <- EJA$long - 180 # convert to WGS 1984 bounds
EJA <- SpatialPoints(EJA) # this is your spatial points df

# Project sp object to WGS 84
proj4string(EJA) <- CRS("+proj=longlat +ellps=WGS84 +datum=WGS84")

# Create an empty grid; n = number of cells
# Increase n to increase resolution
gr <- as.data.frame(spsample(EJA, 'regular', n  = 50000))
names(gr) <- c('X', 'Y')
coordinates(gr) <- c('X', 'Y')
gridded(gr) <- TRUE  
fullgrid(gr) <- TRUE  # Create SpatialGrid object
proj4string(gr) <- proj4string(EJA) # If this line throws an error, run this
# chunk again. It is a random grid.

# Interpolate the grid cells using power value = 2
# Arag ~ 1 = simple kriging
EJA.idw <- idw(Arag ~ 1, EJA, newdata = gr, idp = 2)

# Convert to raster
r <- raster(EJA.idw)

# Load continents
data('World', package = 'tmap') 
# World is a {sf} df of countries

# Plot
# Per the tmap vignette, I think I can layer shapes..
    tm_shape(r) + 
    tm_raster(n = 12, palette = 'Blues', # n = 10 may be better
            title = "Aragonite concentration \n in Jan. 1800 (units here)") + 
  tm_legend(legend.outside = TRUE) +
  tm_shape(World) + 
      tm_fill()
#
