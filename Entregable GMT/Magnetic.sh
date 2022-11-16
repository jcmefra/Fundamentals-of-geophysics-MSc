#Enhancing magnetic data
#Upward continuation
gmt grdfft earthmag23m.grd -C800 -V -Gmag_800.nc
#Second derivative
gmt grdfft earthmag23m.grd -D -V -Gmag_2nd_derivative.nc
#directional derivative
gmt grdfft earthmag23m.grd -A180 -GMagD180.nc
gmt grdfft earthmag23m.grd -A90 -GMagD90.nc
#Differentiate the field
gmt grdfft earthmag23m.grd -D -GMag_dz.nc
#Analytical signal
grdmath MagD90.nc 2 POW = A.nc
grdmath MagD180.nc 2 POW = B.nc
grdmath Mag_dz.nc 2 POW = C.nc
grdmath A.nc B.nc ADD = D.nc
grdmath D.nc C.nc ADD = Suma.nc
grdmath Suma.nc SQRT = AS.nc
#Tilt Derivative
grdmath D.nc SQRT = 1.nc
grdmath Mag_dz.nc 1.nc DIV = 2.nc
grdmath 2.nc ATAN = TDR.nc