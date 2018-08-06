# http://www.pacioos.hawaii.edu/currents/model-kaneohe/#about
# 3 day, hourly forecast
# 100 m res; 1.5 km res at edges
library(ncdf4)
nc <- nc_open('/home/lindsay/Downloads/ROMS_Kaneohe_Regional_Ocean_Model_best.ncd.nc')
str(nc)  # examine nc file structure
# lat, lon, time, depth, mask, zeta, time_run, salt, temp, u (eastward vel), v (northward vel)

v1 = nc$var[[1]] # v1 is sea_binary_mask
v2 = nc$var[[2]] # zeta: "absolute SSH"; includes time mean and time varying SSH 
# with respect to a datum (i.e. zeta=0) that is a geopotential surface, 
# i.e. if zeta=constant there is no associated pressure gradient force. 
v3 = nc$var[[3]] # time_run
v4 = nc$var[[4]] # salt
v5 = nc$var[[5]] # temp
v6 = nc$var[[6]] # u
v7 = nc$var[[7]] # v
