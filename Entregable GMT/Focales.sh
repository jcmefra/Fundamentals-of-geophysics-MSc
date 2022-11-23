#Plotear los mecanismos focales

gmt begin 
    
    gmt figure beachball-color-by-depth png

	gmt set FONT_ANNOT_PRIMARY 12p,Helvetica MAP_GRID_CROSS_SIZE_PRIMARY 0
    grdimage earthrelief3mAQ.grd -Jd0/-70/-90/-49/1:50000000 -Ccolorsrelief.cpt -I$hs_relief270 -Bxa3g3 -Bya3g3 -B+glightred+t"Mapa de relieve con mecanismos focales 2022"

    gmt makecpt -Cseis -T0/120 -Z
    gmt meca focales.txt -Sd0.5c -C -i0-9 -B+t 
    gmt colorbar -DJMR+o1.5c/0c -Bx+l"Profundidad focal (km)"
    
gmt end show