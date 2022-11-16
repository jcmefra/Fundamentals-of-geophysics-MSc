#Paletas de colores
gmt makecpt -Crelief -T-8100/4600/500 -Z> colorsrelief.cpt
gmt makecpt -Chaxby -T-350/350 > colorsfaa.cpt
gmt makecpt -Cjet -T-630/565/40 -Z> colorsmag.cpt
gmt makecpt -Cjet -T-600/600/50 -Z> colorswdmam.cpt

#Definir grillas y mapas
#gmt grdcut @earth_relief_03m_g -Gearthrelief3m.grd -R-180/180/-90/-50
#gmt grdcut @earth_wdmam_03m_g -Gearthmag23m.grd -R-180/180/-90/-50
#gmt grdcut @earth_mag_03m_g -Gearthmag3m.grd -R-180/180/-90/-50
#gmt grdcut @earth_faa_03m_g -Gearthfaa3m.grd -R-180/180/-90/-50

Map1=earthrelief3mAQ.grd
Map2=earthmag23m.grd
Map3=earthmag3m.grd
Map4=earthfaa3m.grd

#Imagenes mapas
gmt begin map_relief png 
    gmt set FONT_ANNOT_PRIMARY 12p,Helvetica MAP_GRID_CROSS_SIZE_PRIMARY 0
    grdimage $Map1 -Jd0/-70/-90/-49/1:50000000 -Ccolorsrelief.cpt -I$hs_relief270 -Bxa3g3 -Bya3g3 -B+glightred+t"Mapa de relieve"
    gmt colorbar -Dx9c/-1c+w10c/0.7c+jTC+h -B2000+l'Metros'
gmt end show

gmt begin map_wdmam png 
    gmt set FONT_ANNOT_PRIMARY 12p,Helvetica MAP_GRID_CROSS_SIZE_PRIMARY 0
    grdimage $Map2 -Jd0/-70/-90/-49/1:50000000 -Ccolorswdmam.cpt -I$hs_wdmam270 -Bxa3g3 -Bya3g3 -B+glightred+t"World Digital Magnetic Anomaly Map"
    gmt colorbar -Dx9c/-1c+w10c/0.7c+jTC+h -B200+l'nT/m'
gmt end show

gmt begin map_mag png 
    gmt set FONT_ANNOT_PRIMARY 12p,Helvetica MAP_GRID_CROSS_SIZE_PRIMARY 0
    grdimage $Map3 -Jd0/-70/-90/-49/1:50000000 -Ccolorsmag.cpt -I$hs_mag270 -Bxa3g3 -Bya3g3 -B+glightred+t"Mapa de anomalía magnética"
    gmt colorbar -Dx9c/-1c+w10c/0.7c+jTC+h -B200+l'nT/m'
gmt end show

gmt begin map_freeair png 
    gmt set FONT_ANNOT_PRIMARY 12p,Helvetica MAP_GRID_CROSS_SIZE_PRIMARY 0
    grdimage $Map4 -Jd0/-70/-90/-49/1:50000000 -Ccolorsfaa.cpt -I$hs_faa270 -Bxa3g3 -Bya3g3 -B+glightred+t"Mapa de aire libre"
    gmt colorbar -Dx9c/-1c+w10c/0.7c+jTC+h -B100+l'mGal'
gmt end show