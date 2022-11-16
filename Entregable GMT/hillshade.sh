#Hillshade
gmt begin 
    grdgradient $Map2 -A0/270 -Ne0.6 -V -GGrdrelief3.nc
    grdgradient $Map2 -A0/270 -Ne0.6 -V -GGrdmag23.nc
    grdgradient $Map3 -A0/270 -Ne0.6 -V -GGrdmag3.nc
    grdgradient $Map4 -A0/270 -Ne0.6 -V -GGrdfaa3.nc
gmt end

hs_relief = Grdrelief3.nc
hs_wdmam = Grdmag23.nc
hs_mag = Grdmag3.nc
hs_faa = Grdfaa3.nc