#=== Dependencias
install.packages("dplyr")
library(dplyr)
data(mtcars)

#=== R base vs dplyr
head(mtcars[,c('mpg','cyl')],3)
mtcars %>% head(3) %>% select(mpg,cyl)
3 %>% head(mtcars,.) %>% select(mpg,cyl)

#=== Operaciones en columnas

# select()
mtcars %>% dplyr::select(-mpg)

# mutate()
mtcars = mtcars %>% mutate(wt_kg = 1000*wt)

# separate()
library(tidyr)
mtcars = mtcars %>% mutate(carro = rownames(mtcars)) %>% tidyr::separate(carro,c('marca')," ")

#=== Operaciones en filas

# filter()
mtcars %>% filter(marca == 'Toyota' | marca == 'Mazda')

#=== Agrupamientos

# group_by()
mtcars_gr = mtcars %>% group_by(marca)

# summarize()
mtcars_gr_summarize = mtcars_gr %>% summarize(hp_mean = mean(hp),min_wt_kg=min(wt_kg))