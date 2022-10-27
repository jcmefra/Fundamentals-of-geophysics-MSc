#!/usr/bin/env bash
#               GMT EXAMPLE 33
#
# Purpose:      Illustrate grdtrack's new cross-track and stacking options
# GMT modules:  grdcut, makecpt, convert, grdimage, grdtrack, text, plot
# Unix progs:   cat, rm
#

Map1=earthrelief3mAQ.grd
Map2=earthmag23m.grd
Map3=earthmag3m.grd
Map4=earthfaa3m.grd

gmt begin corte png
	# Extract a subset of earth_relief_01m for the East Pacific Rise
	# gmt grdcut @earth_relief_01m -R118W/107W/49S/42S -Gspac_33.nc
	# gmt makecpt -Crainbow -T-5000/-2000
	gmt grdimage $Map1 -I$hs_relief270 -Jd0/-70/-90/-49/1:50000000 -Ccolorsrelief.cpt -Bxa3g3 -Bya3g3 --FORMAT_GEO_MAP=dddF
	gmt colorbar -Dx9c/-1c+w10c/0.7c+jTC+h -B2000+l'Metros'
	# Select two points along the ridge
	cat <<- EOF > ridge.txt
	-27	-54
	-25	-61
	EOF
	# Plot ridge segment and end points
	gmt plot -R$Map1 -W2p,blue ridge.txt
	gmt plot -Sc0.25c -Gblue ridge.txt
	# Generate cross-profiles 400 km long, spaced 10 km, samped every 2km
	# and stack these using the median, write stacked profile
	gmt grdtrack ridge.txt -G$Map1 -C400k/5k/30k+v -Sm+sstack.txt > table.txt
	gmt plot -W0.5p table.txt
	# Show upper/lower 2-sigma confidence bounds encountered as an envelope
	gmt plot -R-200/200/-3500/-2000 -JX15c/7.5c -W3p stack.txt -i0,1,5,6 -L+b -Glightgray -Yh+3c
	gmt basemap  -Bxafg1000+l"Distance from ridge (km)" -Byaf+l"Depth (m)" -BWSne
	echo "0 -2000 MEDIAN STACKED PROFILE" | gmt text -Gwhite -F+jTC+f14p -Dj8p
	# cleanup
	rm -f ridge.txt table.txt stack.txt spac_33.nc
gmt end show