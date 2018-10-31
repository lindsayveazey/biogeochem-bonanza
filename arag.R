# IDW: http://pro.arcgis.com/en/pro-app/help/analysis/geostatistical-analyst/how-inverse-distance-weighted-interpolation-works.htm
# tmap vignette: https://cran.r-project.org/web/packages/gstat/gstat.pdf
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

# Create an empty grid; n = number of cells
gr <- as.data.frame(spsample(EJA, 'regular', n  = 20000))
names(gr) <- c('X', 'Y')
coordinates(gr) <- c('X', 'Y')
gridded(gr) <- TRUE  
fullgrid(gr) <- TRUE  # Create SpatialGrid object

# Interpolate the grid cells using power value = 1
# Arag ~ 1 = simple kriging
EJA.idw <- idw(Arag ~ 1, EJA, newdata = gr, idp = 1)

# Convert to raster
r <- raster(EJA.idw)

# Load continents
data('World', package = 'tmap') 
# World is a ‘SpatialPolygonsDataFrame’ of countries

# Plot
# Per the tmap vignette, I think I can layer shapes..
tm_shape(r) + 
  tm_raster(n = 12, palette = 'Blues', # n = 10 may be better
            title = "Aragonite \n concentration(units here)") + 
  tm_legend(legend.outside = TRUE) +
  tm_shape(World)