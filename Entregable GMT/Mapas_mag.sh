gmt grd2cpt mag_800.nc -Cpolar -Z> colorup800.cpt
gmt grd2cpt MagD180.nc -Cpolar -Z> colordir180.cpt
gmt grd2cpt MagD90.nc -Cpolar -Z> colordir90.cpt
gmt grd2cpt AS.nc -Cpolar -Z> colorAS.cpt
gmt grd2cpt TDR.nc -Cpolar -Z> colorTDR.cpt

gmt begin Mapas/Upward_800 png
    grdimage mag_800.nc -Jd0/-70/-90/-49/1:50000000 -Ccolorup800.cpt -IGrdmag23.nc -Bxa3g3 -Bya3g3 -B+glightred+t"Upward Continuation"
    gmt coast -Wthick
    gmt colorbar -Dx9c/-1c+w10c/0.7c+jTC+h -Ba500f250+l'nT' 
gmt end show

gmt begin Mapas/Directional_180 png
    grdimage MagD180.nc -Jd0/-70/-90/-49/1:50000000 -Ccolordir180.cpt -IGrdmag23.nc -Bxa3g3 -Bya3g3 -B+glightred+t"Directional Derivative 180°"
    gmt coast -Wthick
    gmt colorbar -Dx9c/-1c+w10c/0.7c+jTC+h -B0.15+l'nT/m' 
gmt end show

gmt begin Mapas/Directional_90 png
    grdimage MagD90.nc -Jd0/-70/-90/-49/1:50000000 -Ccolordir90.cpt -IGrdmag23.nc -Bxa3g3 -Bya3g3 -B+glightred+t"Directional Derivative 90°"
    gmt coast -Wthick
    gmt colorbar -Dx9c/-1c+w10c/0.7c+jTC+h -B0.3+l'nT/m' 
gmt end show

gmt begin Mapas/Analytic_mag png
    grdimage AS.nc -Jd0/-70/-90/-49/1:50000000 -CcolorAS.cpt -IGrdmag23.nc -Bxa3g3 -Bya3g3 -B+glightred+t"Analytic Signal"
    gmt coast -Wthick
    gmt colorbar -Dx9c/-1c+w10c/0.7c+jTC+h -B0.2+l'nT/m' 
gmt end show

gmt begin Mapas/Tilt_der png
    grdimage TDR.nc -Jd0/-70/-90/-49/1:50000000 -CcolorTDR.cpt -IGrdmag23.nc -Bxa3g3 -Bya3g3 -B+glightred+t"Tilt Derivative"
    gmt coast -Wthick
    gmt colorbar -Dx9c/-1c+w10c/0.7c+jTC+h -Ba0.5f0.25+l'Rad' 
gmt end show