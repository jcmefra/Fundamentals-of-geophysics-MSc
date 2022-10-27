gmt makecpt -Chaxby -T-637/150/40 -Z> colorsbouguer.cpt

# #Crear la grilla de 0 y 1 para multiplicar y separar batimetría de topografía
# gmt grdclip earthrelief3mAQ.grd -GLand.nc -Sa0/1 -Sb0/0 -V 
# gmt grdmath earthrelief3mAQ.grd Land.nc MUL = landrelief.nc
# grdinfo landrelief.nc -M

# #Selección de Batimetría
# gmt grdclip earthrelief3mAQ.grd -GOcean.nc -Sa0/0 -Sb0/1 -V 
# gmt grdmath earthrelief3mAQ.grd Ocean.nc MUL = oceanrelief.nc
# grdinfo oceanrelief.nc -M

# #Llenar huecos grilla (no necesario en este caso porque no hay NaN)
# gmt grdfill oceanrelief.nc -An -GOceanrelief.nc
# gmt grdfill landrelief.nc -An -GLandrelief.nc

# #Cálculo de la anomalía de Bouguer
# gravfft Oceanrelief.nc -D1665 -Gwater.nc -E4 -fg -Ff
# grdmath earthfaa3m.grd water.nc SUB = Bougueroff.nc

grdinfo Bougueroff.nc
#Mostrar mapas
gmt begin bouguer png
    grdimage Bougueroff.nc -Jd0/-70/-90/-49/1:50000000 -Ccolorsbouguer.cpt -I$hs_mag270 -Bxa3g3 -Bya3g3 -B+glightred+t"Mapa de anomalía de Bouguer"
    gmt colorbar -Dx9c/-1c+w10c/0.7c+jTC+h -Ba100f50+l'nT/m' 
gmt end show