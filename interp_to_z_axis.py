import numpy as np
import seapy
depths = np.array([1,10,50,100,125,150,200], dtype=object)
nx = 4*4/111
ny = 4*4/111
seapy.roms.interp.to_zgrid('hiig_cobalt_avg.nc', 'out.nc', depth=depths, threads=4, nx=nx, ny=ny)
# https://stackoverflow.com/questions/28753572/python-error-file-stdin NO SPACES!

