setwd('C:/Users/linds/Documents/HIReefSim/BI/FloatGrids')
library(raster)
library(rgdal)

### BI

# CCA
BI_cca_tif <- 'BI_cca.tif'
BI_cca_ras <- raster(BI_cca_tif)
BI_cca <- writeRaster(BI_cca_ras, 'BI_cca.flt', datatype = "FLT4s", overwrite = T)

# Corals
BI_cor_tif <- 'BI_cor.tif'
BI_cor_ras <- raster(BI_cor_tif)
# Want to * 0.97 across all cells (spawners)
BI_cor_s_ras <- BI_cor_ras * 0.97
summary(BI_cor_s_ras)
# Want to * 0.03 across all cells (brooders)
BI_cor_b_ras <- BI_cor_ras * 0.03
summary(BI_cor_b_ras)

BI_cor_b <- writeRaster(BI_cor_b_ras, 'BI_cor_b.flt', datatype = "FLT4s", overwrite = T)
BI_cor_s <- writeRaster(BI_cor_s_ras, 'BI_cor_s.flt', datatype = "FLT4s", overwrite = T)

# Herbivores
BI_h_tif <- 'BI_h.tif'
BI_h_ras <- raster(BI_h_tif)
BI_h <- writeRaster(BI_h_ras, 'BI_h.flt', datatype = "FLT4s", overwrite = T)

# Piscivores
BI_ps_tif <- 'BI_ps.tif'
BI_ps_ras <- raster(BI_ps_tif)
BI_ps <- writeRaster(BI_ps_ras, 'BI_ps.flt', datatype = "FLT4s", overwrite = T)

# Macroalgae
BI_mac_tif <- 'BI_mac.tif'
BI_mac_ras <- raster(BI_mac_tif)
BI_mac <- writeRaster(BI_mac_ras, 'BI_mac.flt', datatype = "FLT4s", overwrite = T)

# Turf
BI_tur_tif <- 'BI_tur.tif'
BI_tur_ras <- raster(BI_tur_tif)
BI_tur <- writeRaster(BI_tur_ras, 'BI_tur.flt', datatype = "FLT4s", overwrite = T)

### Check data formats
dataType(BI_cca)
dataType(BI_cor_s)
dataType(BI_cor_b)
dataType(BI_mac)
dataType(BI_tur)
dataType(BI_h)
dataType(BI_ps)


### Kauai
setwd('C:/Users/linds/Documents/HIReefSim/Kauai/FloatGrids')

# CCA
Kauai_cca_tif <- 'Kauai_cca.tif'
Kauai_cca_ras <- raster(Kauai_cca_tif)
Kauai_cca <- writeRaster(Kauai_cca_ras, 'Kauai_cca.flt', datatype = "FLT4s", overwrite = T)

# Corals
Kauai_cor_tif <- 'Kauai_cor.tif'
Kauai_cor_ras <- raster(Kauai_cor_tif)
# Want to * 0.97 across all cells (spawners)
Kauai_cor_s_ras <- Kauai_cor_ras * 0.97
summary(Kauai_cor_s_ras)
# Want to * 0.03 across all cells (brooders)
Kauai_cor_b_ras <- Kauai_cor_ras * 0.03
summary(Kauai_cor_b_ras)

Kauai_cor_b <- writeRaster(Kauai_cor_b_ras, 'Kauai_cor_b.flt', datatype = "FLT4s", overwrite = T)
Kauai_cor_s <- writeRaster(Kauai_cor_s_ras, 'Kauai_cor_s.flt', datatype = "FLT4s", overwrite = T)

# Herbivores
Kauai_h_tif <- 'Kauai_h.tif'
Kauai_h_ras <- raster(Kauai_h_tif)
Kauai_h <- writeRaster(Kauai_h_ras, 'Kauai_h.flt', datatype = "FLT4s", overwrite = T)

# Piscivores
Kauai_ps_tif <- 'Kauai_ps.tif'
Kauai_ps_ras <- raster(Kauai_ps_tif)
Kauai_ps <- writeRaster(Kauai_ps_ras, 'Kauai_ps.flt', datatype = "FLT4s", overwrite = T)

# Macroalgae
Kauai_mac_tif <- 'Kauai_mac.tif'
Kauai_mac_ras <- raster(Kauai_mac_tif)
Kauai_mac <- writeRaster(Kauai_mac_ras, 'Kauai_mac.flt', datatype = "FLT4s", overwrite = T)

# Turf
Kauai_tur_tif <- 'Kauai_tur.tif'
Kauai_tur_ras <- raster(Kauai_tur_tif)
Kauai_tur <- writeRaster(Kauai_tur_ras, 'Kauai_tur.flt', datatype = "FLT4s", overwrite = T)

### Check data formats
dataType(Kauai_cca)
dataType(Kauai_cor_s)
dataType(Kauai_cor_b)
dataType(Kauai_mac)
dataType(Kauai_tur)
dataType(Kauai_h)
dataType(Kauai_ps)


### MNI
setwd('C:/Users/linds/Documents/HIReefSim/MNI/FloatGrids')

# CCA
MNI_cca_tif <- 'MNI_cca.tif'
MNI_cca_ras <- raster(MNI_cca_tif)
MNI_cca <- writeRaster(MNI_cca_ras, 'MNI_cca.flt', datatype = "FLT4s", overwrite = T)

# Corals
MNI_cor_tif <- 'MNI_cor.tif'
MNI_cor_ras <- raster(MNI_cor_tif)
# Want to * 0.97 across all cells (spawners)
MNI_cor_s_ras <- MNI_cor_ras * 0.97
summary(MNI_cor_s_ras)
# Want to * 0.03 across all cells (brooders)
MNI_cor_b_ras <- MNI_cor_ras * 0.03
summary(MNI_cor_b_ras)

MNI_cor_b <- writeRaster(MNI_cor_b_ras, 'MNI_cor_b.flt', datatype = "FLT4s", overwrite = T)
MNI_cor_s <- writeRaster(MNI_cor_s_ras, 'MNI_cor_s.flt', datatype = "FLT4s", overwrite = T)

# Herbivores
MNI_h_tif <- 'MNI_h.tif'
MNI_h_ras <- raster(MNI_h_tif)
MNI_h <- writeRaster(MNI_h_ras, 'MNI_h.flt', datatype = "FLT4s", overwrite = T)

# Piscivores
MNI_ps_tif <- 'MNI_ps.tif'
MNI_ps_ras <- raster(MNI_ps_tif)
MNI_ps <- writeRaster(MNI_ps_ras, 'MNI_ps.flt', datatype = "FLT4s", overwrite = T)

# Macroalgae
MNI_mac_tif <- 'MNI_mac.tif'
MNI_mac_ras <- raster(MNI_mac_tif)
MNI_mac <- writeRaster(MNI_mac_ras, 'MNI_mac.flt', datatype = "FLT4s", overwrite = T)

# Turf
MNI_tur_tif <- 'MNI_tur.tif'
MNI_tur_ras <- raster(MNI_tur_tif)
MNI_tur <- writeRaster(MNI_tur_ras, 'MNI_tur.flt', datatype = "FLT4s", overwrite = T)

### Check data formats
dataType(MNI_cca)
dataType(MNI_cor_s)
dataType(MNI_cor_b)
dataType(MNI_mac)
dataType(MNI_tur)
dataType(MNI_h)
dataType(MNI_ps)


### Oahu
setwd('C:/Users/linds/Documents/HIReefSim/Oahu/FloatGrids')

# CCA
Oahu_cca_tif <- 'Oahu_cca.tif'
Oahu_cca_ras <- raster(Oahu_cca_tif)
Oahu_cca <- writeRaster(Oahu_cca_ras, 'Oahu_cca.flt', datatype = "FLT4s", overwrite = T)

# Corals
Oahu_cor_tif <- 'Oahu_cor.tif'
Oahu_cor_ras <- raster(Oahu_cor_tif)
# Want to * 0.97 across all cells (spawners)
Oahu_cor_s_ras <- Oahu_cor_ras * 0.97
summary(Oahu_cor_s_ras)
# Want to * 0.03 across all cells (brooders)
Oahu_cor_b_ras <- Oahu_cor_ras * 0.03
summary(Oahu_cor_b_ras)

Oahu_cor_b <- writeRaster(Oahu_cor_b_ras, 'Oahu_cor_b.flt', datatype = "FLT4s", overwrite = T)
Oahu_cor_s <- writeRaster(Oahu_cor_s_ras, 'Oahu_cor_s.flt', datatype = "FLT4s", overwrite = T)

# Herbivores
Oahu_h_tif <- 'Oahu_h.tif'
Oahu_h_ras <- raster(Oahu_h_tif)
Oahu_h <- writeRaster(Oahu_h_ras, 'Oahu_h.flt', datatype = "FLT4s", overwrite = T)

# Piscivores
Oahu_ps_tif <- 'Oahu_ps.tif'
Oahu_ps_ras <- raster(Oahu_ps_tif)
Oahu_ps <- writeRaster(Oahu_ps_ras, 'Oahu_ps.flt', datatype = "FLT4s", overwrite = T)

# Macroalgae
Oahu_mac_tif <- 'Oahu_mac.tif'
Oahu_mac_ras <- raster(Oahu_mac_tif)
Oahu_mac <- writeRaster(Oahu_mac_ras, 'Oahu_mac.flt', datatype = "FLT4s", overwrite = T)

# Turf
Oahu_tur_tif <- 'Oahu_tur.tif'
Oahu_tur_ras <- raster(Oahu_tur_tif)
Oahu_tur <- writeRaster(Oahu_tur_ras, 'Oahu_tur.flt', datatype = "FLT4s", overwrite = T)

### Check data formats
dataType(Oahu_cca)
dataType(Oahu_cor_s)
dataType(Oahu_cor_b)
dataType(Oahu_mac)
dataType(Oahu_tur)
dataType(Oahu_h)
dataType(Oahu_ps)

