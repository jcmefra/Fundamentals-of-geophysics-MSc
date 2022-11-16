
gmt begin Mapas/MBA_TP png
    grdimage anomalia_tp.nc -Jd0/-70/-90/-49/1:50000000 -Ccolorsbouguer.cpt -I$hs_mag270 -Bxa3g3 -Bya3g3 -B+glightred+t"Mapa de anomalía MBA Offshore Antártica V1"
    gmt coast -Wthick
    gmt colorbar -Dx9c/-1c+w10c/0.7c+jTC+h -Ba100f50+l'mgal' 
gmt end show

gmt begin Mapas/MBA_elastic png
    grdimage anomalia_elastic.nc -Jd0/-70/-90/-49/1:50000000 -Ccolorsbouguer.cpt -I$hs_mag270 -Bxa3g3 -Bya3g3 -B+glightred+t"Mapa de anomalía MBA Offshore Antártica V2"
    gmt coast -Wthick
    gmt colorbar -Dx9c/-1c+w10c/0.7c+jTC+h -Ba100f50+l'mgal' 
gmt end show

gmt begin Mapas/MBA_moho png
    grdimage anomalia_elastic.nc -Jd0/-70/-90/-49/1:50000000 -Ccolorsbouguer.cpt -I$hs_mag270 -Bxa3g3 -Bya3g3 -B+glightred+t"Mapa de anomalía MBA Offshore Antártica (método GMT)"
    gmt coast -Wthick
    gmt colorbar -Dx9c/-1c+w10c/0.7c+jTC+h -Ba100f50+l'mgal' 
gmt end show