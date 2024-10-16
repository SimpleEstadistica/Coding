# Este código permite dar formato estructurado a la información descargada desde la página de
# la red de monitoreo de calidad del aire RMCAB
# Pg web: http://201.245.192.252:81/home/map

# Si no se ha instalado tidyverse y readxl antes, debe ejecutar install.packages
# install.packages("tidyverse")
# install.packages("readxl")

# Dependencias
library(tidyverse)
library(readxl)

#=== Lectura de datos y renombre de columnas
c_aire           = read_excel("StationsReport_202491613415.xlsx",sheet=1,skip=1,na = '----')
# colnames(c_aire)
col_letras       = str_detect(colnames(c_aire),"[aA-zZ]")
col_letras_val   = colnames(c_aire)[col_letras]
col_letras_id    = cumsum(col_letras)
col_letras_tot   = table(col_letras_id)
colnames(c_aire) = rep(col_letras_val, times = col_letras_tot)
# colnames(c_aire)

#=== Unificación de información relevante para la identificación: Estación, Variable y Unidad de Medida
colnames(c_aire) = paste0(colnames(c_aire),"-",c_aire[1,],"-",c_aire[2,])

#=== Remoción de información irrelevante: Columnas de Variable y Unidad de Medida + Estadísticas resumen
c_aire_datos     = c_aire %>% filter(str_detect(`DateTime-NA-NA`, "^[0-9]"))
c_aire_datos     = c_aire_datos %>% pivot_longer(cols = -`DateTime-NA-NA`,
                                                 names_to  = "Variable",
                                                 values_to = "Valor")
c_aire_datos     = c_aire_datos %>% separate(Variable,c('Estacion','Variable','UnidadMedida'),'-') %>% 
                                    separate(`DateTime-NA-NA`,c('Fecha','Hora')," ")
write_csv(c_aire_datos,"StationsReport_202491613415.csv",fileEncoding = "UTF-8")
