library(dplyr)

https://besjournals.onlinelibrary.wiley.com/doi/full/10.1111/1365-2664.12720

df <- read_csv("data/jpe12720-sup-0003-apps2-greenfinch.csv")  %>% filter(site == "site88") %>% mutate("...1"=NULL,site=NULL,day=NULL,firstSurvey=NULL,latitude=NULL)
write_csv(df,file="data/bird_count.csv")

