library(ncdf4)
nc <- nc_open('/home/lindsay/Downloads/ROMS_Kaneohe_Regional_Ocean_Model_best.ncd.nc')
str(nc)  # examine nc file structure