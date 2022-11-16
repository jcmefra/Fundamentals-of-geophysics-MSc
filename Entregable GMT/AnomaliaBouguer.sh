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
    gmt colorbar -Dx9c/-1c+w10c/0.7c+jTC+h -Ba100f50+l'mGal' 
gmt end show

#Calculating the potential of the crust (at the top of Moho)
gmt gravfft Oceanrelief.nc=+o-7000 -D600 -Gmoho_g.nc 
#Airy gravity
gmt grdmath moho_g.nc water.nc ADD = TP.nc
gmt gravfft Oceanrelief.nc -Gelastic.nc -T0/2900/3300/1100/2300 -Z9000 -E1
# #Using Parker expansion - modelo de placa el‡stica
# gmt gravfft Oceanrelief.nc -D1665 -Gwater.nc -E1 -fg 
# gmt gravfft Oceanrelief.nc -Gelastic.nc -T7000/2900/3300/1100/2300+m -Z10000 -E1 -fg

gmt grdmath water.nc elastic.nc ADD = isomodel.nc

#Admittance calculation of topography to free air gravity
gmt gravfft Oceanrelief.nc earthfaa3m.grd -It -T7000/2700/3300/1035 -Z10000 -fg
gmt gravfft Oceanrelief.nc earthfaa3m.grd -It -T0/2700/3300/1035 -fg

#Anomalía de bouguer sin isostasia (Moho Bouguer Anomaly)

gmt grdmath Bougueroff.nc TP.nc SUB = anomalia_tp.nc
gmt grdmath Bougueroff.nc elastic.nc SUB = anomalia_elastic.nc
gmt grdmath Bougueroff.nc moho_g.nc SUB = anomalia_moho_g.nc


