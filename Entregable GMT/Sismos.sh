#Plotear sismos

gmt begin

    gmt figure Mapas/Sismos_antártida_2022 png

	gmt set FONT_ANNOT_PRIMARY 12p,Helvetica MAP_GRID_CROSS_SIZE_PRIMARY 0
    grdimage earthrelief3mAQ.grd -Jd0/-70/-90/-49/1:50000000 -Ccolorsrelief.cpt -I$hs_relief270 -Bxa3g3 -Bya3g3 -B+glightred+t"Mapa de relieve con sismos"

    gmt makecpt -Cjet -T0/200 -Z
    gmt psxy Sismos.txt -R-180/180/-90/-50 -Sc0.25i -C -Bafg -W -B+t
    gmt colorbar -DJMR+o1.5c/0c -Bx+l"Hipocentro (km)"

gmt end show