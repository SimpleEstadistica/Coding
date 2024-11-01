library(dplyr)
letters_s = letters[1:5]

set.seed(123)
x = sample(letters_s,100,rep = TRUE)
y = sample(letters_s,100,rep = TRUE)

df = tibble(x,y)

#R base

unique(df)
df[!duplicated(df),]
all.equal(unique(df),df[!duplicated(df),])

df[!duplicated(df$x),]


#Dplyr

df %>% distinct()
all.equal(unique(df),df %>% distinct())
all.equal(df %>% distinct(x,y),df %>% distinct())
df %>% distinct(x,.keep_all = TRUE)

# Agrupando

df = tibble(x,y)
df_group = df %>% group_by(x) %>% distinct(y) %>% arrange(x,y)

df_group_base <- do.call(rbind, lapply(split(df, df$x), function(x) {unique(x[["y"]])}))

rbind_new = function(a,b,c,d,e){
            df_res = tibble()
            for(letter in letters[1:5]){
              df_n = tibble(x=letter,
                            y=eval(parse(text = letter)))
              df_res = rbind(df_res,df_n)}
            return(df_res)}
df_group_base <- do.call(rbind_new, lapply(split(df, df$x), function(x) {unique(x[["y"]])}))

df_group_base <- df_group_base[order(df_group_base$x, df_group_base$y), ]

all.equal(df_group_base,df_group %>% ungroup()) 
