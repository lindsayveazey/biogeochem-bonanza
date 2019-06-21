library(ncdf4) 
nc = nc_open('C:/Users/linds/Downloads/hioekg_his_04840.nc')
# str(nc)  # examine nc file structure

alk <- ncvar_get(nc, "alk")
lon <- ncvar_get(nc, "lon_rho")
lat <- ncvar_get(nc, "lat_rho")
t <- ncvar_get(nc, "ocean_time")
s_rho <- ncvar_get(nc, "s_rho")

dim(alk)
# [1] 190  90  20  30

# Check the fill value
fillvalue <- ncatt_get(nc, "alk", "_FillValue")
fillvalue
# $value
# [1] 1e+37

# Replace fill value with NA
alk[alk == fillvalue$value] <- NA

# Depth is the third dimension of the alk array
# The first s_rho slice represents the surface layer
alk.slice <- alk[,,1,] 
# Check the dimensions: 190 lon by 90 lat by 30 days
dim(alk.slice)
# [1] 190  90  30

# Now let's slice out the first day
alk.slice.day <- alk.slice[,,1]
dim(alk.slice.day)

# Save as raster
r <- raster(t(alk.slice.day), xmn=min(lon), xmx=max(lon), 
            ymn=min(lat), ymx=max(lat), 
            crs=CRS("+proj=longlat +ellps=WGS84 +datum=WGS84 +no_defs+ towgs84=0,0,0"))

# Orient the map
r <- flip(r, direction='y')
plot(r)
writeRaster(r, "alktest.tif", "GTiff", overwrite=TRUE)

# Slice the last day
alk.slice.last <- alk.slice[,,30] 
alk.diff <- alk.slice.last - alk.slice.day
r_diff <- raster(t(alk.diff), xmn=min(lon), xmx=max(lon), 
                 ymn=min(lat), ymx=max(lat), 
                 crs=CRS("+proj=longlat +ellps=WGS84 +datum=WGS84 +no_defs+ towgs84=0,0,0"))

r_diff <- flip(r_diff, direction='y')
plot(r_diff)

# Using combine function c() to turn matrices into numeric class output
alkvals <- c(alk)
test_alk <- as.data.frame(alkvals)
colnames(test_alk) <- "test_alk"
# View summary with extended decimals
apply(test_alk, 2, summary, digits = 10)
# same lat applied to 190 alk vals at a time (there are 190 lon values before they repeat)
latlist <- rep(lat, each=190)
# same lon applied to 90 alk vals at a time (there are 90 lat values before they repeat)
lonlist <- rep(lon, times=90)
# same s_rho applied to 17,100 rows (across 190 lon * 90 lat)
s_rholist <- rep(s_rho, t)
# 1 column and 10,260,000 (190*90*20*30) rows in this df
# 190 lon, 90 lat, 20 depths, 30 days
# New depth every 17,100 (190*90) rows
# New day every 342,000 (190*90*20) rows


jan_2008_000_uvel$Lat <- latlist
# repeat lon vector 195 times 

jan_2008_000_uvel$Lon <- lonlist