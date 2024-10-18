#=== Definición de variables en R
# id.cl: identificación del cliente.
# sex: sexo reportado por el cliente.
# esc: escolaridad  reportada por el cliente.
# n.comp: número de compras en el último mes.
# g.comp: gasto promedio (en millones de COP) de cada compra del último mes.

id     <- seq(100,600,by=100)                   # Secuencia de valores entre 100 y 600 c.100
sex    <- c("M","M","M","M","H","H")            # Concatenación de atributos: "M" y "H"
esc    <- c(rep("PRI",3),"SEC",rep("PRF",2))    # Concatenación de repetición de atributos
sex    <- factor(sex)                           # Sobreescritura de sex como var. nominal
esc    <- ordered(esc)                          # Soreescritura de esc como var. ordinal
n_comp <- c(60, 72, 57, 90, 95, 72)             # Concatenación de números enteros
g_comp <- c(1.75, 1.80, 1.65, 1.90, 1.74, 1.91) # Concatenación de números decimales
comp_tt<- n_comp*g_comp                         # Multiplicación "element-wise" de vectores

#=== Creación de una base de datos en R (análogo a una hoja de cálculo en Excel)
datos = data.frame(id,                          # "datos" es un objeto data.frame, en el cual
                   Sexo=sex,                    # c/columna representa una variable. Estas 
                   Escolaridad=esc,             # se toman del espacio de trabajo de R y pueden
                   GastoT_Promedio=comp_tt      # renombrarse al definir el data.frame.
)
class(datos)                                    # Clase data.frame               
str(datos)                                      # Estructura detallada de "datos" en R

#=== Creación de una lista en R (análogo a un libro en Excel)
list.dat <- list(datos,raw1=g.comp,raw2=n.comp) # Este nuevo objeto, llamado lista, es una ge-
class(list.dat)                                 # Generalización de un data.frame. Este puede
str(list.dat)                                   # almacenar objetos de diferente clase.
