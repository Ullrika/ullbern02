library(dplyr)

df <- read_csv("data/epilobee.txt",skip=2) %>%  
  mutate(Number_dead = round(`Mortality_rate_%`/100*Number_colonies)) %>%
  mutate(`Mortality_rate_%`=NULL)

write_csv(df,file="data/bee_mort.csv")


