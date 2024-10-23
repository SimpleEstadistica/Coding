install.packages('spatstat')
library('spatstat')

ojos_boca <- clickpoly(add = TRUE,np = 3)
calabaza  <- clickpoly(add = TRUE,np = 1)
pedunculo <- clickpoly(add = TRUE,np = 1)

rango_x = c(ojos_boca$xrange,calabaza$xrange,pedunculo$xrange)
rango_y = c(ojos_boca$yrange,calabaza$yrange,pedunculo$yrange)
min_x   = min(rango_x) ; min_y = min(rango_y)
max_x   = max(rango_x) ; max_y = max(rango_y)

plot(1,1,xlim=c(min_x,max_x),
         ylim=c(min_y,max_y),
         xaxt='n',xlab = '',
         yaxt='n',ylab = '')

polygon(x = calabaza$bdry[[1]]$x,
        y = calabaza$bdry[[1]]$y,
        col = "orange")

for(poly in ojos_boca$bdry){
  polygon(x = poly$x,
          y = poly$y,
          col = "darkgreen") 
}

polygon(x = pedunculo$bdry[[1]]$x,
        y = pedunculo$bdry[[1]]$y,
        col = "black")
#=== Objetos para reproducir el gráfico

# > ojos_boca$xrange
# [1] 0.08590614 0.28552754
# > ojos_boca$yrange
# [1] 0.7833274 0.9318380
# > calabaza$xrange
# [1] 0.05793985 0.32120866
# > calabaza$yrange
# [1] 0.7380027 0.9684835
# > pedunculo$xrange
# [1] 0.1553397 0.1823416
# > pedunculo$yrange
# [1] 0.9424459 1.0118794

# > calabaza$bdry
# [[1]]
# [[1]]$x
# [1] 0.29902850 0.32120866 0.31060076 0.27974141 0.22863062 0.13123080
# [7] 0.06854775 0.06179727 0.05793985 0.07433388 0.09169226 0.16209015
# [13] 0.22091578
# 
# [[1]]$y
# [1] 0.7669334 0.8334738 0.9086935 0.9598043 0.9636617 0.9684835 0.9241232
# [8] 0.8720480 0.8305808 0.8026145 0.7775413 0.7380027 0.7380027

# > ojos_boca$bdry
# [[1]]
# [[1]]$x
# [1] 0.13219516 0.08590614 0.14955354
# 
# [[1]]$y
# [1] 0.9318380 0.8874777 0.8865133
# 
# 
# [[2]]
# [[2]]$x
# [1] 0.2575613 0.2170584 0.2855275
# 
# [[2]]$y
# [1] 0.9299093 0.8749411 0.8749411
# 
# 
# [[3]]
# [[3]]$x
# [1] 0.2373098 0.2411672 0.2643117 0.2691335 0.2855275 0.1186942 0.1225516
# [8] 0.1379813 0.1466605 0.1669119 0.1678763 0.2103079
# 
# [[3]]$y
# [1] 0.7852561 0.8112937 0.8122580 0.8035788 0.8382956 0.8411887 0.7968283
# [8] 0.7852561 0.8064719 0.8006858 0.7900779 0.7833274

# > pedunculo$bdry
# [[1]]
# [[1]]$x
# [1] 0.1823416 0.1630545 0.1553397 0.1804129
# 
# [[1]]$y
# [1] 1.0109151 1.0118794 0.9453390 0.9424459
